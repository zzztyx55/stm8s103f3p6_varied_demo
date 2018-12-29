   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     .const:	section	.text
  16  0000               _HSIDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004               _CLKPrescTable:
  22  0004 01            	dc.b	1
  23  0005 02            	dc.b	2
  24  0006 04            	dc.b	4
  25  0007 08            	dc.b	8
  26  0008 0a            	dc.b	10
  27  0009 10            	dc.b	16
  28  000a 14            	dc.b	20
  29  000b 28            	dc.b	40
  58                     ; 66 void CLK_DeInit(void)
  58                     ; 67 {
  60                     	switch	.text
  61  0000               _CLK_DeInit:
  65                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  67  0000 350150c0      	mov	20672,#1
  68                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  70  0004 725f50c1      	clr	20673
  71                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  73  0008 35e150c4      	mov	20676,#225
  74                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  76  000c 725f50c5      	clr	20677
  77                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  79  0010 351850c6      	mov	20678,#24
  80                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  82  0014 35ff50c7      	mov	20679,#255
  83                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  85  0018 35ff50ca      	mov	20682,#255
  86                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  88  001c 725f50c8      	clr	20680
  89                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  0020 725f50c9      	clr	20681
  93  0024               L52:
  94                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  96  0024 c650c9        	ld	a,20681
  97  0027 a501          	bcp	a,#1
  98  0029 26f9          	jrne	L52
  99                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 101  002b 725f50c9      	clr	20681
 102                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 104  002f 725f50cc      	clr	20684
 105                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 107  0033 725f50cd      	clr	20685
 108                     ; 84 }
 111  0037 81            	ret
 168                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 168                     ; 96 {
 169                     	switch	.text
 170  0038               _CLK_FastHaltWakeUpCmd:
 172  0038 88            	push	a
 173       00000000      OFST:	set	0
 176                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 178  0039 4d            	tnz	a
 179  003a 2704          	jreq	L21
 180  003c a101          	cp	a,#1
 181  003e 2603          	jrne	L01
 182  0040               L21:
 183  0040 4f            	clr	a
 184  0041 2010          	jra	L41
 185  0043               L01:
 186  0043 ae0063        	ldw	x,#99
 187  0046 89            	pushw	x
 188  0047 ae0000        	ldw	x,#0
 189  004a 89            	pushw	x
 190  004b ae000c        	ldw	x,#L75
 191  004e cd0000        	call	_assert_failed
 193  0051 5b04          	addw	sp,#4
 194  0053               L41:
 195                     ; 101     if (NewState != DISABLE)
 197  0053 0d01          	tnz	(OFST+1,sp)
 198  0055 2706          	jreq	L16
 199                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 201  0057 721450c0      	bset	20672,#2
 203  005b 2004          	jra	L36
 204  005d               L16:
 205                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 207  005d 721550c0      	bres	20672,#2
 208  0061               L36:
 209                     ; 112 }
 212  0061 84            	pop	a
 213  0062 81            	ret
 249                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 249                     ; 120 {
 250                     	switch	.text
 251  0063               _CLK_HSECmd:
 253  0063 88            	push	a
 254       00000000      OFST:	set	0
 257                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 259  0064 4d            	tnz	a
 260  0065 2704          	jreq	L22
 261  0067 a101          	cp	a,#1
 262  0069 2603          	jrne	L02
 263  006b               L22:
 264  006b 4f            	clr	a
 265  006c 2010          	jra	L42
 266  006e               L02:
 267  006e ae007b        	ldw	x,#123
 268  0071 89            	pushw	x
 269  0072 ae0000        	ldw	x,#0
 270  0075 89            	pushw	x
 271  0076 ae000c        	ldw	x,#L75
 272  0079 cd0000        	call	_assert_failed
 274  007c 5b04          	addw	sp,#4
 275  007e               L42:
 276                     ; 125     if (NewState != DISABLE)
 278  007e 0d01          	tnz	(OFST+1,sp)
 279  0080 2706          	jreq	L301
 280                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 282  0082 721050c1      	bset	20673,#0
 284  0086 2004          	jra	L501
 285  0088               L301:
 286                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 288  0088 721150c1      	bres	20673,#0
 289  008c               L501:
 290                     ; 136 }
 293  008c 84            	pop	a
 294  008d 81            	ret
 330                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 330                     ; 144 {
 331                     	switch	.text
 332  008e               _CLK_HSICmd:
 334  008e 88            	push	a
 335       00000000      OFST:	set	0
 338                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 340  008f 4d            	tnz	a
 341  0090 2704          	jreq	L23
 342  0092 a101          	cp	a,#1
 343  0094 2603          	jrne	L03
 344  0096               L23:
 345  0096 4f            	clr	a
 346  0097 2010          	jra	L43
 347  0099               L03:
 348  0099 ae0093        	ldw	x,#147
 349  009c 89            	pushw	x
 350  009d ae0000        	ldw	x,#0
 351  00a0 89            	pushw	x
 352  00a1 ae000c        	ldw	x,#L75
 353  00a4 cd0000        	call	_assert_failed
 355  00a7 5b04          	addw	sp,#4
 356  00a9               L43:
 357                     ; 149     if (NewState != DISABLE)
 359  00a9 0d01          	tnz	(OFST+1,sp)
 360  00ab 2706          	jreq	L521
 361                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 363  00ad 721050c0      	bset	20672,#0
 365  00b1 2004          	jra	L721
 366  00b3               L521:
 367                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 369  00b3 721150c0      	bres	20672,#0
 370  00b7               L721:
 371                     ; 160 }
 374  00b7 84            	pop	a
 375  00b8 81            	ret
 411                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 411                     ; 168 {
 412                     	switch	.text
 413  00b9               _CLK_LSICmd:
 415  00b9 88            	push	a
 416       00000000      OFST:	set	0
 419                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 421  00ba 4d            	tnz	a
 422  00bb 2704          	jreq	L24
 423  00bd a101          	cp	a,#1
 424  00bf 2603          	jrne	L04
 425  00c1               L24:
 426  00c1 4f            	clr	a
 427  00c2 2010          	jra	L44
 428  00c4               L04:
 429  00c4 ae00ab        	ldw	x,#171
 430  00c7 89            	pushw	x
 431  00c8 ae0000        	ldw	x,#0
 432  00cb 89            	pushw	x
 433  00cc ae000c        	ldw	x,#L75
 434  00cf cd0000        	call	_assert_failed
 436  00d2 5b04          	addw	sp,#4
 437  00d4               L44:
 438                     ; 173     if (NewState != DISABLE)
 440  00d4 0d01          	tnz	(OFST+1,sp)
 441  00d6 2706          	jreq	L741
 442                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 444  00d8 721650c0      	bset	20672,#3
 446  00dc 2004          	jra	L151
 447  00de               L741:
 448                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 450  00de 721750c0      	bres	20672,#3
 451  00e2               L151:
 452                     ; 184 }
 455  00e2 84            	pop	a
 456  00e3 81            	ret
 492                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 492                     ; 193 {
 493                     	switch	.text
 494  00e4               _CLK_CCOCmd:
 496  00e4 88            	push	a
 497       00000000      OFST:	set	0
 500                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 502  00e5 4d            	tnz	a
 503  00e6 2704          	jreq	L25
 504  00e8 a101          	cp	a,#1
 505  00ea 2603          	jrne	L05
 506  00ec               L25:
 507  00ec 4f            	clr	a
 508  00ed 2010          	jra	L45
 509  00ef               L05:
 510  00ef ae00c4        	ldw	x,#196
 511  00f2 89            	pushw	x
 512  00f3 ae0000        	ldw	x,#0
 513  00f6 89            	pushw	x
 514  00f7 ae000c        	ldw	x,#L75
 515  00fa cd0000        	call	_assert_failed
 517  00fd 5b04          	addw	sp,#4
 518  00ff               L45:
 519                     ; 198     if (NewState != DISABLE)
 521  00ff 0d01          	tnz	(OFST+1,sp)
 522  0101 2706          	jreq	L171
 523                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 525  0103 721050c9      	bset	20681,#0
 527  0107 2004          	jra	L371
 528  0109               L171:
 529                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 531  0109 721150c9      	bres	20681,#0
 532  010d               L371:
 533                     ; 209 }
 536  010d 84            	pop	a
 537  010e 81            	ret
 573                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 573                     ; 219 {
 574                     	switch	.text
 575  010f               _CLK_ClockSwitchCmd:
 577  010f 88            	push	a
 578       00000000      OFST:	set	0
 581                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 583  0110 4d            	tnz	a
 584  0111 2704          	jreq	L26
 585  0113 a101          	cp	a,#1
 586  0115 2603          	jrne	L06
 587  0117               L26:
 588  0117 4f            	clr	a
 589  0118 2010          	jra	L46
 590  011a               L06:
 591  011a ae00de        	ldw	x,#222
 592  011d 89            	pushw	x
 593  011e ae0000        	ldw	x,#0
 594  0121 89            	pushw	x
 595  0122 ae000c        	ldw	x,#L75
 596  0125 cd0000        	call	_assert_failed
 598  0128 5b04          	addw	sp,#4
 599  012a               L46:
 600                     ; 224     if (NewState != DISABLE )
 602  012a 0d01          	tnz	(OFST+1,sp)
 603  012c 2706          	jreq	L312
 604                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 606  012e 721250c5      	bset	20677,#1
 608  0132 2004          	jra	L512
 609  0134               L312:
 610                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 612  0134 721350c5      	bres	20677,#1
 613  0138               L512:
 614                     ; 235 }
 617  0138 84            	pop	a
 618  0139 81            	ret
 655                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 655                     ; 246 {
 656                     	switch	.text
 657  013a               _CLK_SlowActiveHaltWakeUpCmd:
 659  013a 88            	push	a
 660       00000000      OFST:	set	0
 663                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 665  013b 4d            	tnz	a
 666  013c 2704          	jreq	L27
 667  013e a101          	cp	a,#1
 668  0140 2603          	jrne	L07
 669  0142               L27:
 670  0142 4f            	clr	a
 671  0143 2010          	jra	L47
 672  0145               L07:
 673  0145 ae00f9        	ldw	x,#249
 674  0148 89            	pushw	x
 675  0149 ae0000        	ldw	x,#0
 676  014c 89            	pushw	x
 677  014d ae000c        	ldw	x,#L75
 678  0150 cd0000        	call	_assert_failed
 680  0153 5b04          	addw	sp,#4
 681  0155               L47:
 682                     ; 251     if (NewState != DISABLE)
 684  0155 0d01          	tnz	(OFST+1,sp)
 685  0157 2706          	jreq	L532
 686                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 688  0159 721a50c0      	bset	20672,#5
 690  015d 2004          	jra	L732
 691  015f               L532:
 692                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 694  015f 721b50c0      	bres	20672,#5
 695  0163               L732:
 696                     ; 262 }
 699  0163 84            	pop	a
 700  0164 81            	ret
 860                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 860                     ; 273 {
 861                     	switch	.text
 862  0165               _CLK_PeripheralClockConfig:
 864  0165 89            	pushw	x
 865       00000000      OFST:	set	0
 868                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 870  0166 9f            	ld	a,xl
 871  0167 4d            	tnz	a
 872  0168 2705          	jreq	L201
 873  016a 9f            	ld	a,xl
 874  016b a101          	cp	a,#1
 875  016d 2603          	jrne	L001
 876  016f               L201:
 877  016f 4f            	clr	a
 878  0170 2010          	jra	L401
 879  0172               L001:
 880  0172 ae0114        	ldw	x,#276
 881  0175 89            	pushw	x
 882  0176 ae0000        	ldw	x,#0
 883  0179 89            	pushw	x
 884  017a ae000c        	ldw	x,#L75
 885  017d cd0000        	call	_assert_failed
 887  0180 5b04          	addw	sp,#4
 888  0182               L401:
 889                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 891  0182 0d01          	tnz	(OFST+1,sp)
 892  0184 274e          	jreq	L011
 893  0186 7b01          	ld	a,(OFST+1,sp)
 894  0188 a101          	cp	a,#1
 895  018a 2748          	jreq	L011
 896  018c 7b01          	ld	a,(OFST+1,sp)
 897  018e a103          	cp	a,#3
 898  0190 2742          	jreq	L011
 899  0192 7b01          	ld	a,(OFST+1,sp)
 900  0194 a103          	cp	a,#3
 901  0196 273c          	jreq	L011
 902  0198 7b01          	ld	a,(OFST+1,sp)
 903  019a a103          	cp	a,#3
 904  019c 2736          	jreq	L011
 905  019e 7b01          	ld	a,(OFST+1,sp)
 906  01a0 a104          	cp	a,#4
 907  01a2 2730          	jreq	L011
 908  01a4 7b01          	ld	a,(OFST+1,sp)
 909  01a6 a105          	cp	a,#5
 910  01a8 272a          	jreq	L011
 911  01aa 7b01          	ld	a,(OFST+1,sp)
 912  01ac a105          	cp	a,#5
 913  01ae 2724          	jreq	L011
 914  01b0 7b01          	ld	a,(OFST+1,sp)
 915  01b2 a104          	cp	a,#4
 916  01b4 271e          	jreq	L011
 917  01b6 7b01          	ld	a,(OFST+1,sp)
 918  01b8 a106          	cp	a,#6
 919  01ba 2718          	jreq	L011
 920  01bc 7b01          	ld	a,(OFST+1,sp)
 921  01be a107          	cp	a,#7
 922  01c0 2712          	jreq	L011
 923  01c2 7b01          	ld	a,(OFST+1,sp)
 924  01c4 a117          	cp	a,#23
 925  01c6 270c          	jreq	L011
 926  01c8 7b01          	ld	a,(OFST+1,sp)
 927  01ca a113          	cp	a,#19
 928  01cc 2706          	jreq	L011
 929  01ce 7b01          	ld	a,(OFST+1,sp)
 930  01d0 a112          	cp	a,#18
 931  01d2 2603          	jrne	L601
 932  01d4               L011:
 933  01d4 4f            	clr	a
 934  01d5 2010          	jra	L211
 935  01d7               L601:
 936  01d7 ae0115        	ldw	x,#277
 937  01da 89            	pushw	x
 938  01db ae0000        	ldw	x,#0
 939  01de 89            	pushw	x
 940  01df ae000c        	ldw	x,#L75
 941  01e2 cd0000        	call	_assert_failed
 943  01e5 5b04          	addw	sp,#4
 944  01e7               L211:
 945                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 947  01e7 7b01          	ld	a,(OFST+1,sp)
 948  01e9 a510          	bcp	a,#16
 949  01eb 2633          	jrne	L323
 950                     ; 281         if (NewState != DISABLE)
 952  01ed 0d02          	tnz	(OFST+2,sp)
 953  01ef 2717          	jreq	L523
 954                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 956  01f1 7b01          	ld	a,(OFST+1,sp)
 957  01f3 a40f          	and	a,#15
 958  01f5 5f            	clrw	x
 959  01f6 97            	ld	xl,a
 960  01f7 a601          	ld	a,#1
 961  01f9 5d            	tnzw	x
 962  01fa 2704          	jreq	L411
 963  01fc               L611:
 964  01fc 48            	sll	a
 965  01fd 5a            	decw	x
 966  01fe 26fc          	jrne	L611
 967  0200               L411:
 968  0200 ca50c7        	or	a,20679
 969  0203 c750c7        	ld	20679,a
 971  0206 2049          	jra	L133
 972  0208               L523:
 973                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 975  0208 7b01          	ld	a,(OFST+1,sp)
 976  020a a40f          	and	a,#15
 977  020c 5f            	clrw	x
 978  020d 97            	ld	xl,a
 979  020e a601          	ld	a,#1
 980  0210 5d            	tnzw	x
 981  0211 2704          	jreq	L021
 982  0213               L221:
 983  0213 48            	sll	a
 984  0214 5a            	decw	x
 985  0215 26fc          	jrne	L221
 986  0217               L021:
 987  0217 43            	cpl	a
 988  0218 c450c7        	and	a,20679
 989  021b c750c7        	ld	20679,a
 990  021e 2031          	jra	L133
 991  0220               L323:
 992                     ; 294         if (NewState != DISABLE)
 994  0220 0d02          	tnz	(OFST+2,sp)
 995  0222 2717          	jreq	L333
 996                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 998  0224 7b01          	ld	a,(OFST+1,sp)
 999  0226 a40f          	and	a,#15
1000  0228 5f            	clrw	x
1001  0229 97            	ld	xl,a
1002  022a a601          	ld	a,#1
1003  022c 5d            	tnzw	x
1004  022d 2704          	jreq	L421
1005  022f               L621:
1006  022f 48            	sll	a
1007  0230 5a            	decw	x
1008  0231 26fc          	jrne	L621
1009  0233               L421:
1010  0233 ca50ca        	or	a,20682
1011  0236 c750ca        	ld	20682,a
1013  0239 2016          	jra	L133
1014  023b               L333:
1015                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1017  023b 7b01          	ld	a,(OFST+1,sp)
1018  023d a40f          	and	a,#15
1019  023f 5f            	clrw	x
1020  0240 97            	ld	xl,a
1021  0241 a601          	ld	a,#1
1022  0243 5d            	tnzw	x
1023  0244 2704          	jreq	L031
1024  0246               L231:
1025  0246 48            	sll	a
1026  0247 5a            	decw	x
1027  0248 26fc          	jrne	L231
1028  024a               L031:
1029  024a 43            	cpl	a
1030  024b c450ca        	and	a,20682
1031  024e c750ca        	ld	20682,a
1032  0251               L133:
1033                     ; 306 }
1036  0251 85            	popw	x
1037  0252 81            	ret
1226                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1226                     ; 320 {
1227                     	switch	.text
1228  0253               _CLK_ClockSwitchConfig:
1230  0253 89            	pushw	x
1231  0254 5204          	subw	sp,#4
1232       00000004      OFST:	set	4
1235                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1237  0256 ae0491        	ldw	x,#1169
1238  0259 1f03          	ldw	(OFST-1,sp),x
1239                     ; 324     ErrorStatus Swif = ERROR;
1241                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1243  025b 7b06          	ld	a,(OFST+2,sp)
1244  025d a1e1          	cp	a,#225
1245  025f 270c          	jreq	L041
1246  0261 7b06          	ld	a,(OFST+2,sp)
1247  0263 a1d2          	cp	a,#210
1248  0265 2706          	jreq	L041
1249  0267 7b06          	ld	a,(OFST+2,sp)
1250  0269 a1b4          	cp	a,#180
1251  026b 2603          	jrne	L631
1252  026d               L041:
1253  026d 4f            	clr	a
1254  026e 2010          	jra	L241
1255  0270               L631:
1256  0270 ae0147        	ldw	x,#327
1257  0273 89            	pushw	x
1258  0274 ae0000        	ldw	x,#0
1259  0277 89            	pushw	x
1260  0278 ae000c        	ldw	x,#L75
1261  027b cd0000        	call	_assert_failed
1263  027e 5b04          	addw	sp,#4
1264  0280               L241:
1265                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1267  0280 0d05          	tnz	(OFST+1,sp)
1268  0282 2706          	jreq	L641
1269  0284 7b05          	ld	a,(OFST+1,sp)
1270  0286 a101          	cp	a,#1
1271  0288 2603          	jrne	L441
1272  028a               L641:
1273  028a 4f            	clr	a
1274  028b 2010          	jra	L051
1275  028d               L441:
1276  028d ae0148        	ldw	x,#328
1277  0290 89            	pushw	x
1278  0291 ae0000        	ldw	x,#0
1279  0294 89            	pushw	x
1280  0295 ae000c        	ldw	x,#L75
1281  0298 cd0000        	call	_assert_failed
1283  029b 5b04          	addw	sp,#4
1284  029d               L051:
1285                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1287  029d 0d09          	tnz	(OFST+5,sp)
1288  029f 2706          	jreq	L451
1289  02a1 7b09          	ld	a,(OFST+5,sp)
1290  02a3 a101          	cp	a,#1
1291  02a5 2603          	jrne	L251
1292  02a7               L451:
1293  02a7 4f            	clr	a
1294  02a8 2010          	jra	L651
1295  02aa               L251:
1296  02aa ae0149        	ldw	x,#329
1297  02ad 89            	pushw	x
1298  02ae ae0000        	ldw	x,#0
1299  02b1 89            	pushw	x
1300  02b2 ae000c        	ldw	x,#L75
1301  02b5 cd0000        	call	_assert_failed
1303  02b8 5b04          	addw	sp,#4
1304  02ba               L651:
1305                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1307  02ba 0d0a          	tnz	(OFST+6,sp)
1308  02bc 2706          	jreq	L261
1309  02be 7b0a          	ld	a,(OFST+6,sp)
1310  02c0 a101          	cp	a,#1
1311  02c2 2603          	jrne	L061
1312  02c4               L261:
1313  02c4 4f            	clr	a
1314  02c5 2010          	jra	L461
1315  02c7               L061:
1316  02c7 ae014a        	ldw	x,#330
1317  02ca 89            	pushw	x
1318  02cb ae0000        	ldw	x,#0
1319  02ce 89            	pushw	x
1320  02cf ae000c        	ldw	x,#L75
1321  02d2 cd0000        	call	_assert_failed
1323  02d5 5b04          	addw	sp,#4
1324  02d7               L461:
1325                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1327  02d7 c650c3        	ld	a,20675
1328  02da 6b01          	ld	(OFST-3,sp),a
1329                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1331  02dc 7b05          	ld	a,(OFST+1,sp)
1332  02de a101          	cp	a,#1
1333  02e0 2639          	jrne	L744
1334                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1336  02e2 721250c5      	bset	20677,#1
1337                     ; 343         if (ITState != DISABLE)
1339  02e6 0d09          	tnz	(OFST+5,sp)
1340  02e8 2706          	jreq	L154
1341                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1343  02ea 721450c5      	bset	20677,#2
1345  02ee 2004          	jra	L354
1346  02f0               L154:
1347                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1349  02f0 721550c5      	bres	20677,#2
1350  02f4               L354:
1351                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1353  02f4 7b06          	ld	a,(OFST+2,sp)
1354  02f6 c750c4        	ld	20676,a
1356  02f9 2007          	jra	L164
1357  02fb               L554:
1358                     ; 357             DownCounter--;
1360  02fb 1e03          	ldw	x,(OFST-1,sp)
1361  02fd 1d0001        	subw	x,#1
1362  0300 1f03          	ldw	(OFST-1,sp),x
1363  0302               L164:
1364                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1366  0302 c650c5        	ld	a,20677
1367  0305 a501          	bcp	a,#1
1368  0307 2704          	jreq	L564
1370  0309 1e03          	ldw	x,(OFST-1,sp)
1371  030b 26ee          	jrne	L554
1372  030d               L564:
1373                     ; 360         if (DownCounter != 0)
1375  030d 1e03          	ldw	x,(OFST-1,sp)
1376  030f 2706          	jreq	L764
1377                     ; 362             Swif = SUCCESS;
1379  0311 a601          	ld	a,#1
1380  0313 6b02          	ld	(OFST-2,sp),a
1382  0315 201b          	jra	L374
1383  0317               L764:
1384                     ; 366             Swif = ERROR;
1386  0317 0f02          	clr	(OFST-2,sp)
1387  0319 2017          	jra	L374
1388  031b               L744:
1389                     ; 374         if (ITState != DISABLE)
1391  031b 0d09          	tnz	(OFST+5,sp)
1392  031d 2706          	jreq	L574
1393                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1395  031f 721450c5      	bset	20677,#2
1397  0323 2004          	jra	L774
1398  0325               L574:
1399                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1401  0325 721550c5      	bres	20677,#2
1402  0329               L774:
1403                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1405  0329 7b06          	ld	a,(OFST+2,sp)
1406  032b c750c4        	ld	20676,a
1407                     ; 388         Swif = SUCCESS;
1409  032e a601          	ld	a,#1
1410  0330 6b02          	ld	(OFST-2,sp),a
1411  0332               L374:
1412                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1414  0332 0d0a          	tnz	(OFST+6,sp)
1415  0334 260c          	jrne	L105
1417  0336 7b01          	ld	a,(OFST-3,sp)
1418  0338 a1e1          	cp	a,#225
1419  033a 2606          	jrne	L105
1420                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1422  033c 721150c0      	bres	20672,#0
1424  0340 201e          	jra	L305
1425  0342               L105:
1426                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1428  0342 0d0a          	tnz	(OFST+6,sp)
1429  0344 260c          	jrne	L505
1431  0346 7b01          	ld	a,(OFST-3,sp)
1432  0348 a1d2          	cp	a,#210
1433  034a 2606          	jrne	L505
1434                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1436  034c 721750c0      	bres	20672,#3
1438  0350 200e          	jra	L305
1439  0352               L505:
1440                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1442  0352 0d0a          	tnz	(OFST+6,sp)
1443  0354 260a          	jrne	L305
1445  0356 7b01          	ld	a,(OFST-3,sp)
1446  0358 a1b4          	cp	a,#180
1447  035a 2604          	jrne	L305
1448                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1450  035c 721150c1      	bres	20673,#0
1451  0360               L305:
1452                     ; 406     return(Swif);
1454  0360 7b02          	ld	a,(OFST-2,sp)
1457  0362 5b06          	addw	sp,#6
1458  0364 81            	ret
1597                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1597                     ; 417 {
1598                     	switch	.text
1599  0365               _CLK_HSIPrescalerConfig:
1601  0365 88            	push	a
1602       00000000      OFST:	set	0
1605                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1607  0366 4d            	tnz	a
1608  0367 270c          	jreq	L271
1609  0369 a108          	cp	a,#8
1610  036b 2708          	jreq	L271
1611  036d a110          	cp	a,#16
1612  036f 2704          	jreq	L271
1613  0371 a118          	cp	a,#24
1614  0373 2603          	jrne	L071
1615  0375               L271:
1616  0375 4f            	clr	a
1617  0376 2010          	jra	L471
1618  0378               L071:
1619  0378 ae01a4        	ldw	x,#420
1620  037b 89            	pushw	x
1621  037c ae0000        	ldw	x,#0
1622  037f 89            	pushw	x
1623  0380 ae000c        	ldw	x,#L75
1624  0383 cd0000        	call	_assert_failed
1626  0386 5b04          	addw	sp,#4
1627  0388               L471:
1628                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1630  0388 c650c6        	ld	a,20678
1631  038b a4e7          	and	a,#231
1632  038d c750c6        	ld	20678,a
1633                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1635  0390 c650c6        	ld	a,20678
1636  0393 1a01          	or	a,(OFST+1,sp)
1637  0395 c750c6        	ld	20678,a
1638                     ; 428 }
1641  0398 84            	pop	a
1642  0399 81            	ret
1778                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1778                     ; 440 {
1779                     	switch	.text
1780  039a               _CLK_CCOConfig:
1782  039a 88            	push	a
1783       00000000      OFST:	set	0
1786                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1788  039b 4d            	tnz	a
1789  039c 2730          	jreq	L202
1790  039e a104          	cp	a,#4
1791  03a0 272c          	jreq	L202
1792  03a2 a102          	cp	a,#2
1793  03a4 2728          	jreq	L202
1794  03a6 a108          	cp	a,#8
1795  03a8 2724          	jreq	L202
1796  03aa a10a          	cp	a,#10
1797  03ac 2720          	jreq	L202
1798  03ae a10c          	cp	a,#12
1799  03b0 271c          	jreq	L202
1800  03b2 a10e          	cp	a,#14
1801  03b4 2718          	jreq	L202
1802  03b6 a110          	cp	a,#16
1803  03b8 2714          	jreq	L202
1804  03ba a112          	cp	a,#18
1805  03bc 2710          	jreq	L202
1806  03be a114          	cp	a,#20
1807  03c0 270c          	jreq	L202
1808  03c2 a116          	cp	a,#22
1809  03c4 2708          	jreq	L202
1810  03c6 a118          	cp	a,#24
1811  03c8 2704          	jreq	L202
1812  03ca a11a          	cp	a,#26
1813  03cc 2603          	jrne	L002
1814  03ce               L202:
1815  03ce 4f            	clr	a
1816  03cf 2010          	jra	L402
1817  03d1               L002:
1818  03d1 ae01bb        	ldw	x,#443
1819  03d4 89            	pushw	x
1820  03d5 ae0000        	ldw	x,#0
1821  03d8 89            	pushw	x
1822  03d9 ae000c        	ldw	x,#L75
1823  03dc cd0000        	call	_assert_failed
1825  03df 5b04          	addw	sp,#4
1826  03e1               L402:
1827                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1829  03e1 c650c9        	ld	a,20681
1830  03e4 a4e1          	and	a,#225
1831  03e6 c750c9        	ld	20681,a
1832                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1834  03e9 c650c9        	ld	a,20681
1835  03ec 1a01          	or	a,(OFST+1,sp)
1836  03ee c750c9        	ld	20681,a
1837                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1839  03f1 721050c9      	bset	20681,#0
1840                     ; 454 }
1843  03f5 84            	pop	a
1844  03f6 81            	ret
1910                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1910                     ; 465 {
1911                     	switch	.text
1912  03f7               _CLK_ITConfig:
1914  03f7 89            	pushw	x
1915       00000000      OFST:	set	0
1918                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1920  03f8 9f            	ld	a,xl
1921  03f9 4d            	tnz	a
1922  03fa 2705          	jreq	L212
1923  03fc 9f            	ld	a,xl
1924  03fd a101          	cp	a,#1
1925  03ff 2603          	jrne	L012
1926  0401               L212:
1927  0401 4f            	clr	a
1928  0402 2010          	jra	L412
1929  0404               L012:
1930  0404 ae01d4        	ldw	x,#468
1931  0407 89            	pushw	x
1932  0408 ae0000        	ldw	x,#0
1933  040b 89            	pushw	x
1934  040c ae000c        	ldw	x,#L75
1935  040f cd0000        	call	_assert_failed
1937  0412 5b04          	addw	sp,#4
1938  0414               L412:
1939                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1941  0414 7b01          	ld	a,(OFST+1,sp)
1942  0416 a10c          	cp	a,#12
1943  0418 2706          	jreq	L022
1944  041a 7b01          	ld	a,(OFST+1,sp)
1945  041c a11c          	cp	a,#28
1946  041e 2603          	jrne	L612
1947  0420               L022:
1948  0420 4f            	clr	a
1949  0421 2010          	jra	L222
1950  0423               L612:
1951  0423 ae01d5        	ldw	x,#469
1952  0426 89            	pushw	x
1953  0427 ae0000        	ldw	x,#0
1954  042a 89            	pushw	x
1955  042b ae000c        	ldw	x,#L75
1956  042e cd0000        	call	_assert_failed
1958  0431 5b04          	addw	sp,#4
1959  0433               L222:
1960                     ; 471     if (NewState != DISABLE)
1962  0433 0d02          	tnz	(OFST+2,sp)
1963  0435 271a          	jreq	L707
1964                     ; 473         switch (CLK_IT)
1966  0437 7b01          	ld	a,(OFST+1,sp)
1968                     ; 481         default:
1968                     ; 482             break;
1969  0439 a00c          	sub	a,#12
1970  043b 270a          	jreq	L346
1971  043d a010          	sub	a,#16
1972  043f 2624          	jrne	L517
1973                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1973                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1975  0441 721450c5      	bset	20677,#2
1976                     ; 477             break;
1978  0445 201e          	jra	L517
1979  0447               L346:
1980                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1980                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1982  0447 721450c8      	bset	20680,#2
1983                     ; 480             break;
1985  044b 2018          	jra	L517
1986  044d               L546:
1987                     ; 481         default:
1987                     ; 482             break;
1989  044d 2016          	jra	L517
1990  044f               L317:
1992  044f 2014          	jra	L517
1993  0451               L707:
1994                     ; 487         switch (CLK_IT)
1996  0451 7b01          	ld	a,(OFST+1,sp)
1998                     ; 495         default:
1998                     ; 496             break;
1999  0453 a00c          	sub	a,#12
2000  0455 270a          	jreq	L156
2001  0457 a010          	sub	a,#16
2002  0459 260a          	jrne	L517
2003                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
2003                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2005  045b 721550c5      	bres	20677,#2
2006                     ; 491             break;
2008  045f 2004          	jra	L517
2009  0461               L156:
2010                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
2010                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2012  0461 721550c8      	bres	20680,#2
2013                     ; 494             break;
2014  0465               L517:
2015                     ; 500 }
2018  0465 85            	popw	x
2019  0466 81            	ret
2020  0467               L356:
2021                     ; 495         default:
2021                     ; 496             break;
2023  0467 20fc          	jra	L517
2024  0469               L127:
2025  0469 20fa          	jra	L517
2061                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
2061                     ; 508 {
2062                     	switch	.text
2063  046b               _CLK_SYSCLKConfig:
2065  046b 88            	push	a
2066       00000000      OFST:	set	0
2069                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
2071  046c 4d            	tnz	a
2072  046d 272c          	jreq	L032
2073  046f a108          	cp	a,#8
2074  0471 2728          	jreq	L032
2075  0473 a110          	cp	a,#16
2076  0475 2724          	jreq	L032
2077  0477 a118          	cp	a,#24
2078  0479 2720          	jreq	L032
2079  047b a180          	cp	a,#128
2080  047d 271c          	jreq	L032
2081  047f a181          	cp	a,#129
2082  0481 2718          	jreq	L032
2083  0483 a182          	cp	a,#130
2084  0485 2714          	jreq	L032
2085  0487 a183          	cp	a,#131
2086  0489 2710          	jreq	L032
2087  048b a184          	cp	a,#132
2088  048d 270c          	jreq	L032
2089  048f a185          	cp	a,#133
2090  0491 2708          	jreq	L032
2091  0493 a186          	cp	a,#134
2092  0495 2704          	jreq	L032
2093  0497 a187          	cp	a,#135
2094  0499 2603          	jrne	L622
2095  049b               L032:
2096  049b 4f            	clr	a
2097  049c 2010          	jra	L232
2098  049e               L622:
2099  049e ae01ff        	ldw	x,#511
2100  04a1 89            	pushw	x
2101  04a2 ae0000        	ldw	x,#0
2102  04a5 89            	pushw	x
2103  04a6 ae000c        	ldw	x,#L75
2104  04a9 cd0000        	call	_assert_failed
2106  04ac 5b04          	addw	sp,#4
2107  04ae               L232:
2108                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2110  04ae 7b01          	ld	a,(OFST+1,sp)
2111  04b0 a580          	bcp	a,#128
2112  04b2 2614          	jrne	L147
2113                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2115  04b4 c650c6        	ld	a,20678
2116  04b7 a4e7          	and	a,#231
2117  04b9 c750c6        	ld	20678,a
2118                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2120  04bc 7b01          	ld	a,(OFST+1,sp)
2121  04be a418          	and	a,#24
2122  04c0 ca50c6        	or	a,20678
2123  04c3 c750c6        	ld	20678,a
2125  04c6 2012          	jra	L347
2126  04c8               L147:
2127                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2129  04c8 c650c6        	ld	a,20678
2130  04cb a4f8          	and	a,#248
2131  04cd c750c6        	ld	20678,a
2132                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2134  04d0 7b01          	ld	a,(OFST+1,sp)
2135  04d2 a407          	and	a,#7
2136  04d4 ca50c6        	or	a,20678
2137  04d7 c750c6        	ld	20678,a
2138  04da               L347:
2139                     ; 524 }
2142  04da 84            	pop	a
2143  04db 81            	ret
2200                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2200                     ; 532 {
2201                     	switch	.text
2202  04dc               _CLK_SWIMConfig:
2204  04dc 88            	push	a
2205       00000000      OFST:	set	0
2208                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2210  04dd 4d            	tnz	a
2211  04de 2704          	jreq	L042
2212  04e0 a101          	cp	a,#1
2213  04e2 2603          	jrne	L632
2214  04e4               L042:
2215  04e4 4f            	clr	a
2216  04e5 2010          	jra	L242
2217  04e7               L632:
2218  04e7 ae0217        	ldw	x,#535
2219  04ea 89            	pushw	x
2220  04eb ae0000        	ldw	x,#0
2221  04ee 89            	pushw	x
2222  04ef ae000c        	ldw	x,#L75
2223  04f2 cd0000        	call	_assert_failed
2225  04f5 5b04          	addw	sp,#4
2226  04f7               L242:
2227                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2229  04f7 0d01          	tnz	(OFST+1,sp)
2230  04f9 2706          	jreq	L377
2231                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2233  04fb 721050cd      	bset	20685,#0
2235  04ff 2004          	jra	L577
2236  0501               L377:
2237                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2239  0501 721150cd      	bres	20685,#0
2240  0505               L577:
2241                     ; 548 }
2244  0505 84            	pop	a
2245  0506 81            	ret
2269                     ; 557 void CLK_ClockSecuritySystemEnable(void)
2269                     ; 558 {
2270                     	switch	.text
2271  0507               _CLK_ClockSecuritySystemEnable:
2275                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
2277  0507 721050c8      	bset	20680,#0
2278                     ; 561 }
2281  050b 81            	ret
2306                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2306                     ; 570 {
2307                     	switch	.text
2308  050c               _CLK_GetSYSCLKSource:
2312                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
2314  050c c650c3        	ld	a,20675
2317  050f 81            	ret
2380                     ; 579 uint32_t CLK_GetClockFreq(void)
2380                     ; 580 {
2381                     	switch	.text
2382  0510               _CLK_GetClockFreq:
2384  0510 5209          	subw	sp,#9
2385       00000009      OFST:	set	9
2388                     ; 582     uint32_t clockfrequency = 0;
2390                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2392                     ; 584     uint8_t tmp = 0, presc = 0;
2396                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2398  0512 c650c3        	ld	a,20675
2399  0515 6b09          	ld	(OFST+0,sp),a
2400                     ; 589     if (clocksource == CLK_SOURCE_HSI)
2402  0517 7b09          	ld	a,(OFST+0,sp)
2403  0519 a1e1          	cp	a,#225
2404  051b 2641          	jrne	L1501
2405                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2407  051d c650c6        	ld	a,20678
2408  0520 a418          	and	a,#24
2409  0522 6b09          	ld	(OFST+0,sp),a
2410                     ; 592         tmp = (uint8_t)(tmp >> 3);
2412  0524 0409          	srl	(OFST+0,sp)
2413  0526 0409          	srl	(OFST+0,sp)
2414  0528 0409          	srl	(OFST+0,sp)
2415                     ; 593         presc = HSIDivFactor[tmp];
2417  052a 7b09          	ld	a,(OFST+0,sp)
2418  052c 5f            	clrw	x
2419  052d 97            	ld	xl,a
2420  052e d60000        	ld	a,(_HSIDivFactor,x)
2421  0531 6b09          	ld	(OFST+0,sp),a
2422                     ; 594         clockfrequency = HSI_VALUE / presc;
2424  0533 7b09          	ld	a,(OFST+0,sp)
2425  0535 b703          	ld	c_lreg+3,a
2426  0537 3f02          	clr	c_lreg+2
2427  0539 3f01          	clr	c_lreg+1
2428  053b 3f00          	clr	c_lreg
2429  053d 96            	ldw	x,sp
2430  053e 1c0001        	addw	x,#OFST-8
2431  0541 cd0000        	call	c_rtol
2433  0544 ae2400        	ldw	x,#9216
2434  0547 bf02          	ldw	c_lreg+2,x
2435  0549 ae00f4        	ldw	x,#244
2436  054c bf00          	ldw	c_lreg,x
2437  054e 96            	ldw	x,sp
2438  054f 1c0001        	addw	x,#OFST-8
2439  0552 cd0000        	call	c_ludv
2441  0555 96            	ldw	x,sp
2442  0556 1c0005        	addw	x,#OFST-4
2443  0559 cd0000        	call	c_rtol
2446  055c 201c          	jra	L3501
2447  055e               L1501:
2448                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
2450  055e 7b09          	ld	a,(OFST+0,sp)
2451  0560 a1d2          	cp	a,#210
2452  0562 260c          	jrne	L5501
2453                     ; 598         clockfrequency = LSI_VALUE;
2455  0564 aef400        	ldw	x,#62464
2456  0567 1f07          	ldw	(OFST-2,sp),x
2457  0569 ae0001        	ldw	x,#1
2458  056c 1f05          	ldw	(OFST-4,sp),x
2460  056e 200a          	jra	L3501
2461  0570               L5501:
2462                     ; 602         clockfrequency = HSE_VALUE;
2464  0570 ae2400        	ldw	x,#9216
2465  0573 1f07          	ldw	(OFST-2,sp),x
2466  0575 ae00f4        	ldw	x,#244
2467  0578 1f05          	ldw	(OFST-4,sp),x
2468  057a               L3501:
2469                     ; 605     return((uint32_t)clockfrequency);
2471  057a 96            	ldw	x,sp
2472  057b 1c0005        	addw	x,#OFST-4
2473  057e cd0000        	call	c_ltor
2477  0581 5b09          	addw	sp,#9
2478  0583 81            	ret
2578                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2578                     ; 617 {
2579                     	switch	.text
2580  0584               _CLK_AdjustHSICalibrationValue:
2582  0584 88            	push	a
2583       00000000      OFST:	set	0
2586                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2588  0585 4d            	tnz	a
2589  0586 271c          	jreq	L652
2590  0588 a101          	cp	a,#1
2591  058a 2718          	jreq	L652
2592  058c a102          	cp	a,#2
2593  058e 2714          	jreq	L652
2594  0590 a103          	cp	a,#3
2595  0592 2710          	jreq	L652
2596  0594 a104          	cp	a,#4
2597  0596 270c          	jreq	L652
2598  0598 a105          	cp	a,#5
2599  059a 2708          	jreq	L652
2600  059c a106          	cp	a,#6
2601  059e 2704          	jreq	L652
2602  05a0 a107          	cp	a,#7
2603  05a2 2603          	jrne	L452
2604  05a4               L652:
2605  05a4 4f            	clr	a
2606  05a5 2010          	jra	L062
2607  05a7               L452:
2608  05a7 ae026c        	ldw	x,#620
2609  05aa 89            	pushw	x
2610  05ab ae0000        	ldw	x,#0
2611  05ae 89            	pushw	x
2612  05af ae000c        	ldw	x,#L75
2613  05b2 cd0000        	call	_assert_failed
2615  05b5 5b04          	addw	sp,#4
2616  05b7               L062:
2617                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2619  05b7 c650cc        	ld	a,20684
2620  05ba a4f8          	and	a,#248
2621  05bc 1a01          	or	a,(OFST+1,sp)
2622  05be c750cc        	ld	20684,a
2623                     ; 625 }
2626  05c1 84            	pop	a
2627  05c2 81            	ret
2651                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2651                     ; 637 {
2652                     	switch	.text
2653  05c3               _CLK_SYSCLKEmergencyClear:
2657                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2659  05c3 721150c5      	bres	20677,#0
2660                     ; 639 }
2663  05c7 81            	ret
2817                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2817                     ; 649 {
2818                     	switch	.text
2819  05c8               _CLK_GetFlagStatus:
2821  05c8 89            	pushw	x
2822  05c9 5203          	subw	sp,#3
2823       00000003      OFST:	set	3
2826                     ; 651     uint16_t statusreg = 0;
2828                     ; 652     uint8_t tmpreg = 0;
2830                     ; 653     FlagStatus bitstatus = RESET;
2832                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2834  05cb a30110        	cpw	x,#272
2835  05ce 2728          	jreq	L072
2836  05d0 a30102        	cpw	x,#258
2837  05d3 2723          	jreq	L072
2838  05d5 a30202        	cpw	x,#514
2839  05d8 271e          	jreq	L072
2840  05da a30308        	cpw	x,#776
2841  05dd 2719          	jreq	L072
2842  05df a30301        	cpw	x,#769
2843  05e2 2714          	jreq	L072
2844  05e4 a30408        	cpw	x,#1032
2845  05e7 270f          	jreq	L072
2846  05e9 a30402        	cpw	x,#1026
2847  05ec 270a          	jreq	L072
2848  05ee a30504        	cpw	x,#1284
2849  05f1 2705          	jreq	L072
2850  05f3 a30502        	cpw	x,#1282
2851  05f6 2603          	jrne	L662
2852  05f8               L072:
2853  05f8 4f            	clr	a
2854  05f9 2010          	jra	L272
2855  05fb               L662:
2856  05fb ae0290        	ldw	x,#656
2857  05fe 89            	pushw	x
2858  05ff ae0000        	ldw	x,#0
2859  0602 89            	pushw	x
2860  0603 ae000c        	ldw	x,#L75
2861  0606 cd0000        	call	_assert_failed
2863  0609 5b04          	addw	sp,#4
2864  060b               L272:
2865                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2867  060b 7b04          	ld	a,(OFST+1,sp)
2868  060d 97            	ld	xl,a
2869  060e 7b05          	ld	a,(OFST+2,sp)
2870  0610 9f            	ld	a,xl
2871  0611 a4ff          	and	a,#255
2872  0613 97            	ld	xl,a
2873  0614 4f            	clr	a
2874  0615 02            	rlwa	x,a
2875  0616 1f01          	ldw	(OFST-2,sp),x
2876  0618 01            	rrwa	x,a
2877                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2879  0619 1e01          	ldw	x,(OFST-2,sp)
2880  061b a30100        	cpw	x,#256
2881  061e 2607          	jrne	L3221
2882                     ; 664         tmpreg = CLK->ICKR;
2884  0620 c650c0        	ld	a,20672
2885  0623 6b03          	ld	(OFST+0,sp),a
2887  0625 202f          	jra	L5221
2888  0627               L3221:
2889                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2891  0627 1e01          	ldw	x,(OFST-2,sp)
2892  0629 a30200        	cpw	x,#512
2893  062c 2607          	jrne	L7221
2894                     ; 668         tmpreg = CLK->ECKR;
2896  062e c650c1        	ld	a,20673
2897  0631 6b03          	ld	(OFST+0,sp),a
2899  0633 2021          	jra	L5221
2900  0635               L7221:
2901                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2903  0635 1e01          	ldw	x,(OFST-2,sp)
2904  0637 a30300        	cpw	x,#768
2905  063a 2607          	jrne	L3321
2906                     ; 672         tmpreg = CLK->SWCR;
2908  063c c650c5        	ld	a,20677
2909  063f 6b03          	ld	(OFST+0,sp),a
2911  0641 2013          	jra	L5221
2912  0643               L3321:
2913                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2915  0643 1e01          	ldw	x,(OFST-2,sp)
2916  0645 a30400        	cpw	x,#1024
2917  0648 2607          	jrne	L7321
2918                     ; 676         tmpreg = CLK->CSSR;
2920  064a c650c8        	ld	a,20680
2921  064d 6b03          	ld	(OFST+0,sp),a
2923  064f 2005          	jra	L5221
2924  0651               L7321:
2925                     ; 680         tmpreg = CLK->CCOR;
2927  0651 c650c9        	ld	a,20681
2928  0654 6b03          	ld	(OFST+0,sp),a
2929  0656               L5221:
2930                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2932  0656 7b05          	ld	a,(OFST+2,sp)
2933  0658 1503          	bcp	a,(OFST+0,sp)
2934  065a 2706          	jreq	L3421
2935                     ; 685         bitstatus = SET;
2937  065c a601          	ld	a,#1
2938  065e 6b03          	ld	(OFST+0,sp),a
2940  0660 2002          	jra	L5421
2941  0662               L3421:
2942                     ; 689         bitstatus = RESET;
2944  0662 0f03          	clr	(OFST+0,sp)
2945  0664               L5421:
2946                     ; 693     return((FlagStatus)bitstatus);
2948  0664 7b03          	ld	a,(OFST+0,sp)
2951  0666 5b05          	addw	sp,#5
2952  0668 81            	ret
2999                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2999                     ; 704 {
3000                     	switch	.text
3001  0669               _CLK_GetITStatus:
3003  0669 88            	push	a
3004  066a 88            	push	a
3005       00000001      OFST:	set	1
3008                     ; 706     ITStatus bitstatus = RESET;
3010                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
3012  066b a10c          	cp	a,#12
3013  066d 2704          	jreq	L003
3014  066f a11c          	cp	a,#28
3015  0671 2603          	jrne	L672
3016  0673               L003:
3017  0673 4f            	clr	a
3018  0674 2010          	jra	L203
3019  0676               L672:
3020  0676 ae02c5        	ldw	x,#709
3021  0679 89            	pushw	x
3022  067a ae0000        	ldw	x,#0
3023  067d 89            	pushw	x
3024  067e ae000c        	ldw	x,#L75
3025  0681 cd0000        	call	_assert_failed
3027  0684 5b04          	addw	sp,#4
3028  0686               L203:
3029                     ; 711     if (CLK_IT == CLK_IT_SWIF)
3031  0686 7b02          	ld	a,(OFST+1,sp)
3032  0688 a11c          	cp	a,#28
3033  068a 2613          	jrne	L1721
3034                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3036  068c c650c5        	ld	a,20677
3037  068f 1402          	and	a,(OFST+1,sp)
3038  0691 a10c          	cp	a,#12
3039  0693 2606          	jrne	L3721
3040                     ; 716             bitstatus = SET;
3042  0695 a601          	ld	a,#1
3043  0697 6b01          	ld	(OFST+0,sp),a
3045  0699 2015          	jra	L7721
3046  069b               L3721:
3047                     ; 720             bitstatus = RESET;
3049  069b 0f01          	clr	(OFST+0,sp)
3050  069d 2011          	jra	L7721
3051  069f               L1721:
3052                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3054  069f c650c8        	ld	a,20680
3055  06a2 1402          	and	a,(OFST+1,sp)
3056  06a4 a10c          	cp	a,#12
3057  06a6 2606          	jrne	L1031
3058                     ; 728             bitstatus = SET;
3060  06a8 a601          	ld	a,#1
3061  06aa 6b01          	ld	(OFST+0,sp),a
3063  06ac 2002          	jra	L7721
3064  06ae               L1031:
3065                     ; 732             bitstatus = RESET;
3067  06ae 0f01          	clr	(OFST+0,sp)
3068  06b0               L7721:
3069                     ; 737     return bitstatus;
3071  06b0 7b01          	ld	a,(OFST+0,sp)
3074  06b2 85            	popw	x
3075  06b3 81            	ret
3112                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
3112                     ; 748 {
3113                     	switch	.text
3114  06b4               _CLK_ClearITPendingBit:
3116  06b4 88            	push	a
3117       00000000      OFST:	set	0
3120                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
3122  06b5 a10c          	cp	a,#12
3123  06b7 2704          	jreq	L013
3124  06b9 a11c          	cp	a,#28
3125  06bb 2603          	jrne	L603
3126  06bd               L013:
3127  06bd 4f            	clr	a
3128  06be 2010          	jra	L213
3129  06c0               L603:
3130  06c0 ae02ef        	ldw	x,#751
3131  06c3 89            	pushw	x
3132  06c4 ae0000        	ldw	x,#0
3133  06c7 89            	pushw	x
3134  06c8 ae000c        	ldw	x,#L75
3135  06cb cd0000        	call	_assert_failed
3137  06ce 5b04          	addw	sp,#4
3138  06d0               L213:
3139                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
3141  06d0 7b01          	ld	a,(OFST+1,sp)
3142  06d2 a10c          	cp	a,#12
3143  06d4 2606          	jrne	L3231
3144                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3146  06d6 721750c8      	bres	20680,#3
3148  06da 2004          	jra	L5231
3149  06dc               L3231:
3150                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3152  06dc 721750c5      	bres	20677,#3
3153  06e0               L5231:
3154                     ; 764 }
3157  06e0 84            	pop	a
3158  06e1 81            	ret
3193                     	xdef	_CLKPrescTable
3194                     	xdef	_HSIDivFactor
3195                     	xdef	_CLK_ClearITPendingBit
3196                     	xdef	_CLK_GetITStatus
3197                     	xdef	_CLK_GetFlagStatus
3198                     	xdef	_CLK_GetSYSCLKSource
3199                     	xdef	_CLK_GetClockFreq
3200                     	xdef	_CLK_AdjustHSICalibrationValue
3201                     	xdef	_CLK_SYSCLKEmergencyClear
3202                     	xdef	_CLK_ClockSecuritySystemEnable
3203                     	xdef	_CLK_SWIMConfig
3204                     	xdef	_CLK_SYSCLKConfig
3205                     	xdef	_CLK_ITConfig
3206                     	xdef	_CLK_CCOConfig
3207                     	xdef	_CLK_HSIPrescalerConfig
3208                     	xdef	_CLK_ClockSwitchConfig
3209                     	xdef	_CLK_PeripheralClockConfig
3210                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3211                     	xdef	_CLK_FastHaltWakeUpCmd
3212                     	xdef	_CLK_ClockSwitchCmd
3213                     	xdef	_CLK_CCOCmd
3214                     	xdef	_CLK_LSICmd
3215                     	xdef	_CLK_HSICmd
3216                     	xdef	_CLK_HSECmd
3217                     	xdef	_CLK_DeInit
3218                     	xref	_assert_failed
3219                     	switch	.const
3220  000c               L75:
3221  000c 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_c"
3222  001e 6c6b2e6300    	dc.b	"lk.c",0
3223                     	xref.b	c_lreg
3224                     	xref.b	c_x
3244                     	xref	c_ltor
3245                     	xref	c_ludv
3246                     	xref	c_rtol
3247                     	end
