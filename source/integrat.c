/* ####################################################################### */

/*                      PROGOL Integrate Routines			   */
/*                      ------------------------			   */

/* ####################################################################### */

#include        <stdio.h>
#include        "progol.h"

/* cl_assert - asserts a clause for Prolog interpretation. `sort'
 *	argument determines whether to use i_sort on the new definition.
 *	When `sort' is false clauses should be added in reverse order.
 */

PREDICATE
cl_assert(cclause,sort,last,update,libq,pseen)
	ITEM cclause;
	PREDICATE sort,last,update,libq;
	ITEM pseen;
	{
	LONG psym,cno,cno1,clen;
	ITEM *entry,*bentry,clause,atom,atom1;
	PREDICATE result=TRUE;
	char mess[MAXMESS];
	if(!(atom=HOF((LIST)I_GET(clause=F_ELEM(0l,cclause)))))
	  atom=HOF(TOF((LIST)I_GET(clause)));
        psym=PSYM(atom);
	LIST_DO(atom1,clause)
	  b_add(PSYM(atom1),allpsyms);
	LIST_END
	if(!libq&&b_memq(psym,lib1)) {	/* Library predicate */
	    printf("[<"); ccl_fwrite(ttyout,cclause,(BIND)NULL);
	    printf("> not added to library predicate]\n");
	    result=FALSE;
	}
	else {			/* User definition */
	  ccl_swrite(mess,cclause);	/* Normalises variable names */
	  cno=b_num(cclause,spcls);
	  if(!(*(entry=f_ins(psym,ptab)))) *entry=L_EMPTY;
	  if(!(*(bentry=f_ins(psym,bptab)))) *bentry=B_EMPTY;
	  if(reconsult && pseen && !b_memq(psym,pseen)) {
	    BIT_DO(cno1,*bentry)
	      *y_ins(cno1,costs)=0l;
	    BIT_END
	    b_sub(bclauses,*bentry);
	    i_deletes(*entry,*bentry,(ITEM)I_TERM);
	    *entry=L_EMPTY; *bentry=B_EMPTY;
	  }
	  if(pseen) b_add(psym,pseen);
	  clen=(psym==pfalse0?l_length(clause)-1l:l_length(clause));
	  *y_ins(cno,costs)+=clen;
	  if(!b_memq(cno,bclauses)) {
	    b_add(cno,bclauses); b_add(cno,*bentry);
	    if(!last && !L_EMPTYQ(*entry)) l_push(cclause,*entry);
	    else l_suf(cclause,*entry);
	    if(sort) i_sort(*entry);
	  }
	}
	if(update) cl_pfirstarg(psym);
	return(result);
	}

/*
 * cl_mdeclare/1 - make mode declaration. Mode should have a form such
 *	as mode(1,append(+list,+list,-list)), meaning recallable once (1),
 *	the first 2 args are input lists and the last is an output list.
 *	Mode table indexed by predicate symbol. Each entry is
 *	a list of mode records. A mode record has the form
 *		call-clause	- [(_ p(@0 @1 ..)) 5]
 *		in-out		- ([+ 'int'] [+ 'list'] ..)
 */

ITEM cl_mdeclare1();

PREDICATE
cl_mdeclare(det,mode,modes)
	ITEM det,mode,modes;
	{
	LONG vno=0l,psym;
	ITEM moderec,atom,iolist=L_EMPTY,clause,call,*entry;
	PREDICATE result=TRUE,head=(modes==hmodes);
	if(det->item_type != 'i') {
	  if(det->item_type == 'h' && (LONG)I_GET(det)==ptimes0) {
	    det->item_type= 'i';
	    I_GET(det)=(POINTER)100l;
	  }
	  else return(FALSE);
	}
	if(reconsult && !mseen) {
	  i_deletes(hmodes,bmodes,(ITEM)I_TERM);
	  hmodes=F_EMPTY; bmodes=F_EMPTY;
	  modes=(head?hmodes:bmodes); mseen=TRUE;
	}
	if (!(*(entry=f_ins(psym=PSYM(mode),modes))))
	  *entry=L_EMPTY;
	b_add(psym,allpsyms);
	if(mode->item_type=='f') {
	  if(!(atom=cl_mdeclare1(mode,iolist,&vno,0l))) {
	    i_delete(iolist);
	    printf("[Bad mode declaration - ");
	    p_fwrite(ttyout,mode);
	    printf("]\n");
	    return(FALSE);
	  }
	}
	else atom=i_inc(mode);
	clause=l_push((ITEM)NULL,l_push(atom,L_EMPTY));
	call=i_tup4(clause,i_dec(I_INT(vno)),(ITEM)NULL,(ITEM)NULL);
	moderec=i_tup3(call,iolist,det);
	l_push(moderec,*entry);
	i_sort(*entry);
	if(modes==hmodes) cl_mgenerate(call,iolist);
	i_deletes(atom,clause,call,moderec,iolist,(ITEM)I_TERM);
	return(result);
}

ITEM
cl_mdeclare1(mode,iolist,vno,depth)
	ITEM mode,iolist;
	LONG *vno,depth;
	{
	ITEM result,*felem1,*felem2,type;
	FUNC f1,f2;
	LONG pno,sym1;
	switch(mode->item_type) {
	  case 'f':
	    if(depth&&(((pno=(LONG)I_GET(F_ELEM(0l,mode)))==pplus1)||
		(pno==pminus1)||(pno==phash1))) {
	      if((type=F_ELEM(1l,mode))->item_type != 'h') return((ITEM)NULL);
	      result=i_create('v',(POINTER)(*vno)++);
	      if(pno==pplus1) OFF(OUT,result->extra);
	      else ON(OUT,result->extra);
	      if(pno==phash1) ON(CONST,result->extra);
	      else OFF(CONST,result->extra);
	      l_suf(mode,iolist);
	      b_add(QP_ston(QP_ntos((LONG)I_GET(type)),1l),types);
	    }
	    else {
	      result=i_create('f',
		(POINTER)f_zero(f_create(((FUNC)I_GET(mode))->arr_size)));
	      f1=(FUNC)I_GET(result); f2=(FUNC)I_GET(mode);
	      FNAME(f1)=i_inc(FNAME(f2));
	      ARG_LOOP2(felem1,felem2,f1,f2)
		if(!(*felem1= cl_mdeclare1(*felem2,iolist,vno,++depth))) {
		  i_delete(result);
		  return((ITEM)NULL);
		}
	    }
	    break;
	  case 'h':
	    if((pno=(LONG)I_GET(mode))==pplus||(pno==pminus)||(pno==phash)) {
	      result=i_create('v',(POINTER)(*vno)++);
	      if(pno==pplus) {OFF(OUT,result->extra); sym1=pplus1;}
	      else {ON(OUT,result->extra); sym1=(pno==pminus?pminus1:phash1);}
	      if(pno==phash) ON(CONST,result->extra);
	      else OFF(CONST,result->extra);
	      l_suf(i_dec(i_tup2(i_dec(i_create('h',(POINTER)sym1)),	
		i_dec(i_create('h',(POINTER)QP_ston("any",0l))))),iolist);
	      b_add(QP_ston("any",1l),types);
	    }
	    else result=i_inc(mode);
	    break;
	  case 'i': case 'r': case 'k':
	    result=i_inc(mode);
	    break;
	  default:
	    result=(ITEM)NULL;
	}
	return(result);
}

/*
 * cl_mgenerate - constructs generator clauses for head mode
 *	declarations. Used for random generation of example set.
 */

cl_mgenerate(call,iolist)
	ITEM call,iolist;
	{
	ITEM ccl=i_copy(call),cl=F_ELEM(0l,ccl),head,term,var,pred;
	BLOCK ptogp;
	LONG psym,cnt=0l;
	char starname[MAXMESS];
	l_pop(cl);
	head=HOF((LIST)I_GET(cl));
	F_ELEM(2l,ccl)=i_create('h',(POINTER)pdot0);
	F_ELEM(3l,ccl)=h_create(3l);
	/* Alter pred sym to be generator version of mode pred sym */
	if(!(*(ptogp=y_ins(psym=PSYM(head),ptog)))) {
	  /* Update generator preds */
	  sprintf(starname,"*%s",QP_ntos(psym));
	  *ptogp=(unsigned long int)QP_ston(starname,QP_ntoa(psym));
	}
	if(head->item_type== 'f') I_GET(F_ELEM(0l,head))=(POINTER)*ptogp;
	else I_GET(head)=(POINTER)*ptogp;
	/* Add type atom to body for each element of iolist */
	LIST_DO(term,iolist)
	    pred=i_create('h',QP_ston(QP_ntos((LONG)I_GET(F_ELEM(1l,term))),1));
	    var=i_create('v',(POINTER)cnt++);
	    l_suf(i_dec(i_tup2(i_dec(pred),i_dec(var))),cl);
	LIST_END
	/* Assert clause */
	cl_assert(ccl,FALSE,TRUE,TRUE,FALSE,NULL);
	i_delete(ccl);
}

/*
 * cl_ddeclare/2 - declare determination.
 */

PREDICATE
cl_ddeclare(pred,subpred)
	LONG pred,subpred;
	{
	ITEM *entry;
	PREDICATE result=TRUE;
	if (!(*(entry=f_ins(pred,determs))))
		*entry=B_EMPTY;
	b_add(subpred,*entry);
	return(result);
}

/* cl_psfirstargs(pseen) - updates clauses indexed on first argument for
 *	given bitset of predicates pseen.
 */

cl_psfirstarg(pseen)
	ITEM pseen;
	{
	register LONG psym;
	BIT_DO(psym,pseen)
	  cl_pfirstarg(psym);
	BIT_END
}

/* cl_pfirstargs(psym) - updates clauses indexed on first argument for
 *	given predicate symbol.
 */

cl_pfirstarg(psym)
	LONG psym;
	{
	register ITEM def,ccl,*entry,*entry1,*entry2,head,first,pfseen;
	register ULONG *pf,pf1;
	if(!(def= *f_ins(psym,ptab))) return;
	if(*(entry=f_ins(psym,ptopf)))	/* Delete the old indexed clauses */
	  Y_DO(pf,*entry)
	    i_delete(*(entry1=f_ins((LONG)*pf,pftab)));
	    *entry1=(ITEM)NULL;
	  Y_END
	i_delete(*(entry2=f_ins(psym,pvtab)));
	*entry2=L_EMPTY;
	b_add(psym,indexed); pfseen=B_EMPTY;
	LIST_DO(ccl,def)	/* Update pf pairs */
	  if((head=CCHEAD(ccl))&&(first=FIRSTARG(head))&&
		(first->item_type!= 'v'))
	    b_add(pf_ins(PSYM(head),PSYM(first),TRUE),pfseen);
	LIST_END
	LIST_DO(ccl,def)	/* Add in indexed clauses */
	  if((head=CCHEAD(ccl))&&(first=FIRSTARG(head)))
	    if(first->item_type== 'v') {
	      BIT_DO(pf1,pfseen)
		if(!(*(entry1=f_ins(pf1,pftab)))) *entry1=L_EMPTY;
		l_suf(ccl,*entry1);
	      BIT_END
	      l_suf(ccl,*entry2);
	    }
	    else {	/* Non-variable first argument */
	      if(!(*(entry1=f_ins(pf_ins(PSYM(head),PSYM(first),TRUE),pftab))))
		*entry1=L_EMPTY;
	      l_suf(ccl,*entry1);
	    }
	LIST_END
	i_delete(pfseen);
}

/*
 * cl_readrls(fname) - read rules from file into rules database.
 */

PREDICATE
cl_readrls(fname)
	STRING fname;
	{
	FILEREC *in;
	ITEM i,pseen;
	double start;
	char mess[MAXMESS],mess1[MAXMESS];
	if (!(in=frecopen(fname,"r"))) {
		printf("[Cannot find %s]\n",fname);
		return(FALSE);
	}
	pseen=B_EMPTY;
	if(reconsult) {i_delete(comms); comms=L_EMPTY;}
	while((i=ccl_fread(in))!=(ITEM)I_TERM) {
	    if(i==(ITEM)I_ERROR) continue;
	    else if(CTYPE(i)==(POINTER)pquest) {	/* Headless clause */
		start=cputime();
		interp_quest(i);
		ccl_swrite(mess,i);
		sprintf(mess1,"%s - Time taken %.2lfs",mess,
			fabs(cputime()-start));
		g_message(1l,mess1);
		l_push(i,comms);
	    }
	    else cl_assert(i,FALSE,TRUE,FALSE,FALSE,pseen);
	    i_delete(i);
	}
	cl_psfirstarg(pseen);
	i_delete(pseen);
	freclose(in);
	CONTRA
	return(TRUE);
}

PREDICATE
cl_writerls(fname)
	STRING fname;
	{
	FILEREC *out;
	ITEM comm,userp,*clauses,clause;
	LONG psym;
	if(!(out=frecopen(fname,"w"))) {
	  printf("[Cannot open file %s]\n",fname);
	  return(FALSE);
	}
	l_reverse(comms);
	LIST_DO(comm,comms)
	  ccl_fwrite(out,comm,(BIND)NULL); i_fnl(out);
	LIST_END
	l_reverse(comms);
	userp=b_sub(b_copy(allpsyms),lib1);
	BIT_DO(psym,userp)
	  clauses=f_ins(psym,ptab);
	  if(*clauses) {
	    i_fnl(out);
	    if(*clauses)
	      LIST_DO(clause,*clauses)
		ccl_fwrite(out,clause,NULL);
		i_fnl(out);
	      LIST_END
	  }
	BIT_END
	i_delete(userp);
	freclose(out);
	return(TRUE);
}
