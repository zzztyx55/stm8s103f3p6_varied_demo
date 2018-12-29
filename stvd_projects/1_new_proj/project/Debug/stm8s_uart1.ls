   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 46 void UART1_DeInit(void)
  43                     ; 47 {
  45                     	switch	.text
  46  0000               _UART1_DeInit:
  50                     ; 50     (void)UART1->SR;
  52  0000 c65230        	ld	a,21040
  53                     ; 51     (void)UART1->DR;
  55  0003 c65231        	ld	a,21041
  56                     ; 53     UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  58  0006 725f5233      	clr	21043
  59                     ; 54     UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  61  000a 725f5232      	clr	21042
  62                     ; 56     UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  64  000e 725f5234      	clr	21044
  65                     ; 57     UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  67  0012 725f5235      	clr	21045
  68                     ; 58     UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  70  0016 725f5236      	clr	21046
  71                     ; 59     UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  73  001a 725f5237      	clr	21047
  74                     ; 60     UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  76  001e 725f5238      	clr	21048
  77                     ; 62     UART1->GTR = UART1_GTR_RESET_VALUE;
  79  0022 725f5239      	clr	21049
  80                     ; 63     UART1->PSCR = UART1_PSCR_RESET_VALUE;
  82  0026 725f523a      	clr	21050
  83                     ; 64 }
  86  002a 81            	ret
 390                     .const:	section	.text
 391  0000               L21:
 392  0000 00098969      	dc.l	625001
 393  0004               L25:
 394  0004 00000064      	dc.l	100
 395                     ; 83 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 395                     ; 84                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 395                     ; 85                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 395                     ; 86 {
 396                     	switch	.text
 397  002b               _UART1_Init:
 399  002b 520c          	subw	sp,#12
 400       0000000c      OFST:	set	12
 403                     ; 87     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 407                     ; 90     assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 409  002d 96            	ldw	x,sp
 410  002e 1c000f        	addw	x,#OFST+3
 411  0031 cd0000        	call	c_ltor
 413  0034 ae0000        	ldw	x,#L21
 414  0037 cd0000        	call	c_lcmp
 416  003a 2403          	jruge	L01
 417  003c 4f            	clr	a
 418  003d 2010          	jra	L41
 419  003f               L01:
 420  003f ae005a        	ldw	x,#90
 421  0042 89            	pushw	x
 422  0043 ae0000        	ldw	x,#0
 423  0046 89            	pushw	x
 424  0047 ae0008        	ldw	x,#L371
 425  004a cd0000        	call	_assert_failed
 427  004d 5b04          	addw	sp,#4
 428  004f               L41:
 429                     ; 91     assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 431  004f 0d13          	tnz	(OFST+7,sp)
 432  0051 2706          	jreq	L02
 433  0053 7b13          	ld	a,(OFST+7,sp)
 434  0055 a110          	cp	a,#16
 435  0057 2603          	jrne	L61
 436  0059               L02:
 437  0059 4f            	clr	a
 438  005a 2010          	jra	L22
 439  005c               L61:
 440  005c ae005b        	ldw	x,#91
 441  005f 89            	pushw	x
 442  0060 ae0000        	ldw	x,#0
 443  0063 89            	pushw	x
 444  0064 ae0008        	ldw	x,#L371
 445  0067 cd0000        	call	_assert_failed
 447  006a 5b04          	addw	sp,#4
 448  006c               L22:
 449                     ; 92     assert_param(IS_UART1_STOPBITS_OK(StopBits));
 451  006c 0d14          	tnz	(OFST+8,sp)
 452  006e 2712          	jreq	L62
 453  0070 7b14          	ld	a,(OFST+8,sp)
 454  0072 a110          	cp	a,#16
 455  0074 270c          	jreq	L62
 456  0076 7b14          	ld	a,(OFST+8,sp)
 457  0078 a120          	cp	a,#32
 458  007a 2706          	jreq	L62
 459  007c 7b14          	ld	a,(OFST+8,sp)
 460  007e a130          	cp	a,#48
 461  0080 2603          	jrne	L42
 462  0082               L62:
 463  0082 4f            	clr	a
 464  0083 2010          	jra	L03
 465  0085               L42:
 466  0085 ae005c        	ldw	x,#92
 467  0088 89            	pushw	x
 468  0089 ae0000        	ldw	x,#0
 469  008c 89            	pushw	x
 470  008d ae0008        	ldw	x,#L371
 471  0090 cd0000        	call	_assert_failed
 473  0093 5b04          	addw	sp,#4
 474  0095               L03:
 475                     ; 93     assert_param(IS_UART1_PARITY_OK(Parity));
 477  0095 0d15          	tnz	(OFST+9,sp)
 478  0097 270c          	jreq	L43
 479  0099 7b15          	ld	a,(OFST+9,sp)
 480  009b a104          	cp	a,#4
 481  009d 2706          	jreq	L43
 482  009f 7b15          	ld	a,(OFST+9,sp)
 483  00a1 a106          	cp	a,#6
 484  00a3 2603          	jrne	L23
 485  00a5               L43:
 486  00a5 4f            	clr	a
 487  00a6 2010          	jra	L63
 488  00a8               L23:
 489  00a8 ae005d        	ldw	x,#93
 490  00ab 89            	pushw	x
 491  00ac ae0000        	ldw	x,#0
 492  00af 89            	pushw	x
 493  00b0 ae0008        	ldw	x,#L371
 494  00b3 cd0000        	call	_assert_failed
 496  00b6 5b04          	addw	sp,#4
 497  00b8               L63:
 498                     ; 94     assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 500  00b8 7b17          	ld	a,(OFST+11,sp)
 501  00ba a108          	cp	a,#8
 502  00bc 2730          	jreq	L24
 503  00be 7b17          	ld	a,(OFST+11,sp)
 504  00c0 a140          	cp	a,#64
 505  00c2 272a          	jreq	L24
 506  00c4 7b17          	ld	a,(OFST+11,sp)
 507  00c6 a104          	cp	a,#4
 508  00c8 2724          	jreq	L24
 509  00ca 7b17          	ld	a,(OFST+11,sp)
 510  00cc a180          	cp	a,#128
 511  00ce 271e          	jreq	L24
 512  00d0 7b17          	ld	a,(OFST+11,sp)
 513  00d2 a10c          	cp	a,#12
 514  00d4 2718          	jreq	L24
 515  00d6 7b17          	ld	a,(OFST+11,sp)
 516  00d8 a10c          	cp	a,#12
 517  00da 2712          	jreq	L24
 518  00dc 7b17          	ld	a,(OFST+11,sp)
 519  00de a144          	cp	a,#68
 520  00e0 270c          	jreq	L24
 521  00e2 7b17          	ld	a,(OFST+11,sp)
 522  00e4 a1c0          	cp	a,#192
 523  00e6 2706          	jreq	L24
 524  00e8 7b17          	ld	a,(OFST+11,sp)
 525  00ea a188          	cp	a,#136
 526  00ec 2603          	jrne	L04
 527  00ee               L24:
 528  00ee 4f            	clr	a
 529  00ef 2010          	jra	L44
 530  00f1               L04:
 531  00f1 ae005e        	ldw	x,#94
 532  00f4 89            	pushw	x
 533  00f5 ae0000        	ldw	x,#0
 534  00f8 89            	pushw	x
 535  00f9 ae0008        	ldw	x,#L371
 536  00fc cd0000        	call	_assert_failed
 538  00ff 5b04          	addw	sp,#4
 539  0101               L44:
 540                     ; 95     assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 542  0101 7b16          	ld	a,(OFST+10,sp)
 543  0103 a488          	and	a,#136
 544  0105 a188          	cp	a,#136
 545  0107 271b          	jreq	L64
 546  0109 7b16          	ld	a,(OFST+10,sp)
 547  010b a444          	and	a,#68
 548  010d a144          	cp	a,#68
 549  010f 2713          	jreq	L64
 550  0111 7b16          	ld	a,(OFST+10,sp)
 551  0113 a422          	and	a,#34
 552  0115 a122          	cp	a,#34
 553  0117 270b          	jreq	L64
 554  0119 7b16          	ld	a,(OFST+10,sp)
 555  011b a411          	and	a,#17
 556  011d a111          	cp	a,#17
 557  011f 2703          	jreq	L64
 558  0121 4f            	clr	a
 559  0122 2010          	jra	L05
 560  0124               L64:
 561  0124 ae005f        	ldw	x,#95
 562  0127 89            	pushw	x
 563  0128 ae0000        	ldw	x,#0
 564  012b 89            	pushw	x
 565  012c ae0008        	ldw	x,#L371
 566  012f cd0000        	call	_assert_failed
 568  0132 5b04          	addw	sp,#4
 569  0134               L05:
 570                     ; 98     UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 572  0134 72195234      	bres	21044,#4
 573                     ; 101     UART1->CR1 |= (uint8_t)WordLength;
 575  0138 c65234        	ld	a,21044
 576  013b 1a13          	or	a,(OFST+7,sp)
 577  013d c75234        	ld	21044,a
 578                     ; 104     UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 580  0140 c65236        	ld	a,21046
 581  0143 a4cf          	and	a,#207
 582  0145 c75236        	ld	21046,a
 583                     ; 106     UART1->CR3 |= (uint8_t)StopBits;  
 585  0148 c65236        	ld	a,21046
 586  014b 1a14          	or	a,(OFST+8,sp)
 587  014d c75236        	ld	21046,a
 588                     ; 109     UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 590  0150 c65234        	ld	a,21044
 591  0153 a4f9          	and	a,#249
 592  0155 c75234        	ld	21044,a
 593                     ; 111     UART1->CR1 |= (uint8_t)Parity;  
 595  0158 c65234        	ld	a,21044
 596  015b 1a15          	or	a,(OFST+9,sp)
 597  015d c75234        	ld	21044,a
 598                     ; 114     UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 600  0160 725f5232      	clr	21042
 601                     ; 116     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 603  0164 c65233        	ld	a,21043
 604  0167 a40f          	and	a,#15
 605  0169 c75233        	ld	21043,a
 606                     ; 118     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 608  016c c65233        	ld	a,21043
 609  016f a4f0          	and	a,#240
 610  0171 c75233        	ld	21043,a
 611                     ; 121     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 613  0174 96            	ldw	x,sp
 614  0175 1c000f        	addw	x,#OFST+3
 615  0178 cd0000        	call	c_ltor
 617  017b a604          	ld	a,#4
 618  017d cd0000        	call	c_llsh
 620  0180 96            	ldw	x,sp
 621  0181 1c0001        	addw	x,#OFST-11
 622  0184 cd0000        	call	c_rtol
 624  0187 cd0000        	call	_CLK_GetClockFreq
 626  018a 96            	ldw	x,sp
 627  018b 1c0001        	addw	x,#OFST-11
 628  018e cd0000        	call	c_ludv
 630  0191 96            	ldw	x,sp
 631  0192 1c0009        	addw	x,#OFST-3
 632  0195 cd0000        	call	c_rtol
 634                     ; 122     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 636  0198 96            	ldw	x,sp
 637  0199 1c000f        	addw	x,#OFST+3
 638  019c cd0000        	call	c_ltor
 640  019f a604          	ld	a,#4
 641  01a1 cd0000        	call	c_llsh
 643  01a4 96            	ldw	x,sp
 644  01a5 1c0001        	addw	x,#OFST-11
 645  01a8 cd0000        	call	c_rtol
 647  01ab cd0000        	call	_CLK_GetClockFreq
 649  01ae a664          	ld	a,#100
 650  01b0 cd0000        	call	c_smul
 652  01b3 96            	ldw	x,sp
 653  01b4 1c0001        	addw	x,#OFST-11
 654  01b7 cd0000        	call	c_ludv
 656  01ba 96            	ldw	x,sp
 657  01bb 1c0005        	addw	x,#OFST-7
 658  01be cd0000        	call	c_rtol
 660                     ; 124     UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 662  01c1 96            	ldw	x,sp
 663  01c2 1c0009        	addw	x,#OFST-3
 664  01c5 cd0000        	call	c_ltor
 666  01c8 a664          	ld	a,#100
 667  01ca cd0000        	call	c_smul
 669  01cd 96            	ldw	x,sp
 670  01ce 1c0001        	addw	x,#OFST-11
 671  01d1 cd0000        	call	c_rtol
 673  01d4 96            	ldw	x,sp
 674  01d5 1c0005        	addw	x,#OFST-7
 675  01d8 cd0000        	call	c_ltor
 677  01db 96            	ldw	x,sp
 678  01dc 1c0001        	addw	x,#OFST-11
 679  01df cd0000        	call	c_lsub
 681  01e2 a604          	ld	a,#4
 682  01e4 cd0000        	call	c_llsh
 684  01e7 ae0004        	ldw	x,#L25
 685  01ea cd0000        	call	c_ludv
 687  01ed b603          	ld	a,c_lreg+3
 688  01ef a40f          	and	a,#15
 689  01f1 ca5233        	or	a,21043
 690  01f4 c75233        	ld	21043,a
 691                     ; 126     UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 693  01f7 96            	ldw	x,sp
 694  01f8 1c0009        	addw	x,#OFST-3
 695  01fb cd0000        	call	c_ltor
 697  01fe a604          	ld	a,#4
 698  0200 cd0000        	call	c_lursh
 700  0203 b603          	ld	a,c_lreg+3
 701  0205 a4f0          	and	a,#240
 702  0207 b703          	ld	c_lreg+3,a
 703  0209 3f02          	clr	c_lreg+2
 704  020b 3f01          	clr	c_lreg+1
 705  020d 3f00          	clr	c_lreg
 706  020f b603          	ld	a,c_lreg+3
 707  0211 ca5233        	or	a,21043
 708  0214 c75233        	ld	21043,a
 709                     ; 128     UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 711  0217 c65232        	ld	a,21042
 712  021a 1a0c          	or	a,(OFST+0,sp)
 713  021c c75232        	ld	21042,a
 714                     ; 131     UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 716  021f c65235        	ld	a,21045
 717  0222 a4f3          	and	a,#243
 718  0224 c75235        	ld	21045,a
 719                     ; 133     UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 721  0227 c65236        	ld	a,21046
 722  022a a4f8          	and	a,#248
 723  022c c75236        	ld	21046,a
 724                     ; 135     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 724                     ; 136                                               UART1_CR3_CPHA | UART1_CR3_LBCL));  
 726  022f 7b16          	ld	a,(OFST+10,sp)
 727  0231 a407          	and	a,#7
 728  0233 ca5236        	or	a,21046
 729  0236 c75236        	ld	21046,a
 730                     ; 138     if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 732  0239 7b17          	ld	a,(OFST+11,sp)
 733  023b a504          	bcp	a,#4
 734  023d 2706          	jreq	L571
 735                     ; 141         UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 737  023f 72165235      	bset	21045,#3
 739  0243 2004          	jra	L771
 740  0245               L571:
 741                     ; 146         UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 743  0245 72175235      	bres	21045,#3
 744  0249               L771:
 745                     ; 148     if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 747  0249 7b17          	ld	a,(OFST+11,sp)
 748  024b a508          	bcp	a,#8
 749  024d 2706          	jreq	L102
 750                     ; 151         UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 752  024f 72145235      	bset	21045,#2
 754  0253 2004          	jra	L302
 755  0255               L102:
 756                     ; 156         UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 758  0255 72155235      	bres	21045,#2
 759  0259               L302:
 760                     ; 160     if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 762  0259 7b16          	ld	a,(OFST+10,sp)
 763  025b a580          	bcp	a,#128
 764  025d 2706          	jreq	L502
 765                     ; 163         UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 767  025f 72175236      	bres	21046,#3
 769  0263 200a          	jra	L702
 770  0265               L502:
 771                     ; 167         UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 773  0265 7b16          	ld	a,(OFST+10,sp)
 774  0267 a408          	and	a,#8
 775  0269 ca5236        	or	a,21046
 776  026c c75236        	ld	21046,a
 777  026f               L702:
 778                     ; 169 }
 781  026f 5b0c          	addw	sp,#12
 782  0271 81            	ret
 837                     ; 177 void UART1_Cmd(FunctionalState NewState)
 837                     ; 178 {
 838                     	switch	.text
 839  0272               _UART1_Cmd:
 843                     ; 179     if (NewState != DISABLE)
 845  0272 4d            	tnz	a
 846  0273 2706          	jreq	L732
 847                     ; 182         UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 849  0275 721b5234      	bres	21044,#5
 851  0279 2004          	jra	L142
 852  027b               L732:
 853                     ; 187         UART1->CR1 |= UART1_CR1_UARTD;  
 855  027b 721a5234      	bset	21044,#5
 856  027f               L142:
 857                     ; 189 }
 860  027f 81            	ret
 986                     ; 205 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 986                     ; 206 {
 987                     	switch	.text
 988  0280               _UART1_ITConfig:
 990  0280 89            	pushw	x
 991  0281 89            	pushw	x
 992       00000002      OFST:	set	2
 995                     ; 207     uint8_t uartreg = 0, itpos = 0x00;
 999                     ; 210     assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
1001  0282 a30100        	cpw	x,#256
1002  0285 2719          	jreq	L26
1003  0287 a30277        	cpw	x,#631
1004  028a 2714          	jreq	L26
1005  028c a30266        	cpw	x,#614
1006  028f 270f          	jreq	L26
1007  0291 a30205        	cpw	x,#517
1008  0294 270a          	jreq	L26
1009  0296 a30244        	cpw	x,#580
1010  0299 2705          	jreq	L26
1011  029b a30346        	cpw	x,#838
1012  029e 2603          	jrne	L06
1013  02a0               L26:
1014  02a0 4f            	clr	a
1015  02a1 2010          	jra	L46
1016  02a3               L06:
1017  02a3 ae00d2        	ldw	x,#210
1018  02a6 89            	pushw	x
1019  02a7 ae0000        	ldw	x,#0
1020  02aa 89            	pushw	x
1021  02ab ae0008        	ldw	x,#L371
1022  02ae cd0000        	call	_assert_failed
1024  02b1 5b04          	addw	sp,#4
1025  02b3               L46:
1026                     ; 211     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1028  02b3 0d07          	tnz	(OFST+5,sp)
1029  02b5 2706          	jreq	L07
1030  02b7 7b07          	ld	a,(OFST+5,sp)
1031  02b9 a101          	cp	a,#1
1032  02bb 2603          	jrne	L66
1033  02bd               L07:
1034  02bd 4f            	clr	a
1035  02be 2010          	jra	L27
1036  02c0               L66:
1037  02c0 ae00d3        	ldw	x,#211
1038  02c3 89            	pushw	x
1039  02c4 ae0000        	ldw	x,#0
1040  02c7 89            	pushw	x
1041  02c8 ae0008        	ldw	x,#L371
1042  02cb cd0000        	call	_assert_failed
1044  02ce 5b04          	addw	sp,#4
1045  02d0               L27:
1046                     ; 214     uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
1048  02d0 7b03          	ld	a,(OFST+1,sp)
1049  02d2 6b01          	ld	(OFST-1,sp),a
1050                     ; 216     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
1052  02d4 7b04          	ld	a,(OFST+2,sp)
1053  02d6 a40f          	and	a,#15
1054  02d8 5f            	clrw	x
1055  02d9 97            	ld	xl,a
1056  02da a601          	ld	a,#1
1057  02dc 5d            	tnzw	x
1058  02dd 2704          	jreq	L47
1059  02df               L67:
1060  02df 48            	sll	a
1061  02e0 5a            	decw	x
1062  02e1 26fc          	jrne	L67
1063  02e3               L47:
1064  02e3 6b02          	ld	(OFST+0,sp),a
1065                     ; 218     if (NewState != DISABLE)
1067  02e5 0d07          	tnz	(OFST+5,sp)
1068  02e7 272a          	jreq	L123
1069                     ; 221         if (uartreg == 0x01)
1071  02e9 7b01          	ld	a,(OFST-1,sp)
1072  02eb a101          	cp	a,#1
1073  02ed 260a          	jrne	L323
1074                     ; 223             UART1->CR1 |= itpos;
1076  02ef c65234        	ld	a,21044
1077  02f2 1a02          	or	a,(OFST+0,sp)
1078  02f4 c75234        	ld	21044,a
1080  02f7 2045          	jra	L333
1081  02f9               L323:
1082                     ; 225         else if (uartreg == 0x02)
1084  02f9 7b01          	ld	a,(OFST-1,sp)
1085  02fb a102          	cp	a,#2
1086  02fd 260a          	jrne	L723
1087                     ; 227             UART1->CR2 |= itpos;
1089  02ff c65235        	ld	a,21045
1090  0302 1a02          	or	a,(OFST+0,sp)
1091  0304 c75235        	ld	21045,a
1093  0307 2035          	jra	L333
1094  0309               L723:
1095                     ; 231             UART1->CR4 |= itpos;
1097  0309 c65237        	ld	a,21047
1098  030c 1a02          	or	a,(OFST+0,sp)
1099  030e c75237        	ld	21047,a
1100  0311 202b          	jra	L333
1101  0313               L123:
1102                     ; 237         if (uartreg == 0x01)
1104  0313 7b01          	ld	a,(OFST-1,sp)
1105  0315 a101          	cp	a,#1
1106  0317 260b          	jrne	L533
1107                     ; 239             UART1->CR1 &= (uint8_t)(~itpos);
1109  0319 7b02          	ld	a,(OFST+0,sp)
1110  031b 43            	cpl	a
1111  031c c45234        	and	a,21044
1112  031f c75234        	ld	21044,a
1114  0322 201a          	jra	L333
1115  0324               L533:
1116                     ; 241         else if (uartreg == 0x02)
1118  0324 7b01          	ld	a,(OFST-1,sp)
1119  0326 a102          	cp	a,#2
1120  0328 260b          	jrne	L143
1121                     ; 243             UART1->CR2 &= (uint8_t)(~itpos);
1123  032a 7b02          	ld	a,(OFST+0,sp)
1124  032c 43            	cpl	a
1125  032d c45235        	and	a,21045
1126  0330 c75235        	ld	21045,a
1128  0333 2009          	jra	L333
1129  0335               L143:
1130                     ; 247             UART1->CR4 &= (uint8_t)(~itpos);
1132  0335 7b02          	ld	a,(OFST+0,sp)
1133  0337 43            	cpl	a
1134  0338 c45237        	and	a,21047
1135  033b c75237        	ld	21047,a
1136  033e               L333:
1137                     ; 251 }
1140  033e 5b04          	addw	sp,#4
1141  0340 81            	ret
1178                     ; 258 void UART1_HalfDuplexCmd(FunctionalState NewState)
1178                     ; 259 {
1179                     	switch	.text
1180  0341               _UART1_HalfDuplexCmd:
1182  0341 88            	push	a
1183       00000000      OFST:	set	0
1186                     ; 260     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1188  0342 4d            	tnz	a
1189  0343 2704          	jreq	L401
1190  0345 a101          	cp	a,#1
1191  0347 2603          	jrne	L201
1192  0349               L401:
1193  0349 4f            	clr	a
1194  034a 2010          	jra	L601
1195  034c               L201:
1196  034c ae0104        	ldw	x,#260
1197  034f 89            	pushw	x
1198  0350 ae0000        	ldw	x,#0
1199  0353 89            	pushw	x
1200  0354 ae0008        	ldw	x,#L371
1201  0357 cd0000        	call	_assert_failed
1203  035a 5b04          	addw	sp,#4
1204  035c               L601:
1205                     ; 262     if (NewState != DISABLE)
1207  035c 0d01          	tnz	(OFST+1,sp)
1208  035e 2706          	jreq	L363
1209                     ; 264         UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1211  0360 72165238      	bset	21048,#3
1213  0364 2004          	jra	L563
1214  0366               L363:
1215                     ; 268         UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1217  0366 72175238      	bres	21048,#3
1218  036a               L563:
1219                     ; 270 }
1222  036a 84            	pop	a
1223  036b 81            	ret
1281                     ; 278 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1281                     ; 279 {
1282                     	switch	.text
1283  036c               _UART1_IrDAConfig:
1285  036c 88            	push	a
1286       00000000      OFST:	set	0
1289                     ; 280     assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1291  036d a101          	cp	a,#1
1292  036f 2703          	jreq	L411
1293  0371 4d            	tnz	a
1294  0372 2603          	jrne	L211
1295  0374               L411:
1296  0374 4f            	clr	a
1297  0375 2010          	jra	L611
1298  0377               L211:
1299  0377 ae0118        	ldw	x,#280
1300  037a 89            	pushw	x
1301  037b ae0000        	ldw	x,#0
1302  037e 89            	pushw	x
1303  037f ae0008        	ldw	x,#L371
1304  0382 cd0000        	call	_assert_failed
1306  0385 5b04          	addw	sp,#4
1307  0387               L611:
1308                     ; 282     if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1310  0387 0d01          	tnz	(OFST+1,sp)
1311  0389 2706          	jreq	L514
1312                     ; 284         UART1->CR5 |= UART1_CR5_IRLP;
1314  038b 72145238      	bset	21048,#2
1316  038f 2004          	jra	L714
1317  0391               L514:
1318                     ; 288         UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1320  0391 72155238      	bres	21048,#2
1321  0395               L714:
1322                     ; 290 }
1325  0395 84            	pop	a
1326  0396 81            	ret
1362                     ; 298 void UART1_IrDACmd(FunctionalState NewState)
1362                     ; 299 {
1363                     	switch	.text
1364  0397               _UART1_IrDACmd:
1366  0397 88            	push	a
1367       00000000      OFST:	set	0
1370                     ; 302     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1372  0398 4d            	tnz	a
1373  0399 2704          	jreq	L421
1374  039b a101          	cp	a,#1
1375  039d 2603          	jrne	L221
1376  039f               L421:
1377  039f 4f            	clr	a
1378  03a0 2010          	jra	L621
1379  03a2               L221:
1380  03a2 ae012e        	ldw	x,#302
1381  03a5 89            	pushw	x
1382  03a6 ae0000        	ldw	x,#0
1383  03a9 89            	pushw	x
1384  03aa ae0008        	ldw	x,#L371
1385  03ad cd0000        	call	_assert_failed
1387  03b0 5b04          	addw	sp,#4
1388  03b2               L621:
1389                     ; 304     if (NewState != DISABLE)
1391  03b2 0d01          	tnz	(OFST+1,sp)
1392  03b4 2706          	jreq	L734
1393                     ; 307         UART1->CR5 |= UART1_CR5_IREN;
1395  03b6 72125238      	bset	21048,#1
1397  03ba 2004          	jra	L144
1398  03bc               L734:
1399                     ; 312         UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1401  03bc 72135238      	bres	21048,#1
1402  03c0               L144:
1403                     ; 314 }
1406  03c0 84            	pop	a
1407  03c1 81            	ret
1467                     ; 323 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1467                     ; 324 {
1468                     	switch	.text
1469  03c2               _UART1_LINBreakDetectionConfig:
1471  03c2 88            	push	a
1472       00000000      OFST:	set	0
1475                     ; 325     assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1477  03c3 4d            	tnz	a
1478  03c4 2704          	jreq	L431
1479  03c6 a101          	cp	a,#1
1480  03c8 2603          	jrne	L231
1481  03ca               L431:
1482  03ca 4f            	clr	a
1483  03cb 2010          	jra	L631
1484  03cd               L231:
1485  03cd ae0145        	ldw	x,#325
1486  03d0 89            	pushw	x
1487  03d1 ae0000        	ldw	x,#0
1488  03d4 89            	pushw	x
1489  03d5 ae0008        	ldw	x,#L371
1490  03d8 cd0000        	call	_assert_failed
1492  03db 5b04          	addw	sp,#4
1493  03dd               L631:
1494                     ; 327     if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1496  03dd 0d01          	tnz	(OFST+1,sp)
1497  03df 2706          	jreq	L174
1498                     ; 329         UART1->CR4 |= UART1_CR4_LBDL;
1500  03e1 721a5237      	bset	21047,#5
1502  03e5 2004          	jra	L374
1503  03e7               L174:
1504                     ; 333         UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1506  03e7 721b5237      	bres	21047,#5
1507  03eb               L374:
1508                     ; 335 }
1511  03eb 84            	pop	a
1512  03ec 81            	ret
1548                     ; 343 void UART1_LINCmd(FunctionalState NewState)
1548                     ; 344 {
1549                     	switch	.text
1550  03ed               _UART1_LINCmd:
1552  03ed 88            	push	a
1553       00000000      OFST:	set	0
1556                     ; 345     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1558  03ee 4d            	tnz	a
1559  03ef 2704          	jreq	L441
1560  03f1 a101          	cp	a,#1
1561  03f3 2603          	jrne	L241
1562  03f5               L441:
1563  03f5 4f            	clr	a
1564  03f6 2010          	jra	L641
1565  03f8               L241:
1566  03f8 ae0159        	ldw	x,#345
1567  03fb 89            	pushw	x
1568  03fc ae0000        	ldw	x,#0
1569  03ff 89            	pushw	x
1570  0400 ae0008        	ldw	x,#L371
1571  0403 cd0000        	call	_assert_failed
1573  0406 5b04          	addw	sp,#4
1574  0408               L641:
1575                     ; 347     if (NewState != DISABLE)
1577  0408 0d01          	tnz	(OFST+1,sp)
1578  040a 2706          	jreq	L315
1579                     ; 350         UART1->CR3 |= UART1_CR3_LINEN;
1581  040c 721c5236      	bset	21046,#6
1583  0410 2004          	jra	L515
1584  0412               L315:
1585                     ; 355         UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1587  0412 721d5236      	bres	21046,#6
1588  0416               L515:
1589                     ; 357 }
1592  0416 84            	pop	a
1593  0417 81            	ret
1629                     ; 364 void UART1_SmartCardCmd(FunctionalState NewState)
1629                     ; 365 {
1630                     	switch	.text
1631  0418               _UART1_SmartCardCmd:
1633  0418 88            	push	a
1634       00000000      OFST:	set	0
1637                     ; 366     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1639  0419 4d            	tnz	a
1640  041a 2704          	jreq	L451
1641  041c a101          	cp	a,#1
1642  041e 2603          	jrne	L251
1643  0420               L451:
1644  0420 4f            	clr	a
1645  0421 2010          	jra	L651
1646  0423               L251:
1647  0423 ae016e        	ldw	x,#366
1648  0426 89            	pushw	x
1649  0427 ae0000        	ldw	x,#0
1650  042a 89            	pushw	x
1651  042b ae0008        	ldw	x,#L371
1652  042e cd0000        	call	_assert_failed
1654  0431 5b04          	addw	sp,#4
1655  0433               L651:
1656                     ; 368     if (NewState != DISABLE)
1658  0433 0d01          	tnz	(OFST+1,sp)
1659  0435 2706          	jreq	L535
1660                     ; 371         UART1->CR5 |= UART1_CR5_SCEN;
1662  0437 721a5238      	bset	21048,#5
1664  043b 2004          	jra	L735
1665  043d               L535:
1666                     ; 376         UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1668  043d 721b5238      	bres	21048,#5
1669  0441               L735:
1670                     ; 378 }
1673  0441 84            	pop	a
1674  0442 81            	ret
1711                     ; 387 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1711                     ; 388 {
1712                     	switch	.text
1713  0443               _UART1_SmartCardNACKCmd:
1715  0443 88            	push	a
1716       00000000      OFST:	set	0
1719                     ; 389     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1721  0444 4d            	tnz	a
1722  0445 2704          	jreq	L461
1723  0447 a101          	cp	a,#1
1724  0449 2603          	jrne	L261
1725  044b               L461:
1726  044b 4f            	clr	a
1727  044c 2010          	jra	L661
1728  044e               L261:
1729  044e ae0185        	ldw	x,#389
1730  0451 89            	pushw	x
1731  0452 ae0000        	ldw	x,#0
1732  0455 89            	pushw	x
1733  0456 ae0008        	ldw	x,#L371
1734  0459 cd0000        	call	_assert_failed
1736  045c 5b04          	addw	sp,#4
1737  045e               L661:
1738                     ; 391     if (NewState != DISABLE)
1740  045e 0d01          	tnz	(OFST+1,sp)
1741  0460 2706          	jreq	L755
1742                     ; 394         UART1->CR5 |= UART1_CR5_NACK;
1744  0462 72185238      	bset	21048,#4
1746  0466 2004          	jra	L165
1747  0468               L755:
1748                     ; 399         UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1750  0468 72195238      	bres	21048,#4
1751  046c               L165:
1752                     ; 401 }
1755  046c 84            	pop	a
1756  046d 81            	ret
1814                     ; 409 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1814                     ; 410 {
1815                     	switch	.text
1816  046e               _UART1_WakeUpConfig:
1818  046e 88            	push	a
1819       00000000      OFST:	set	0
1822                     ; 411     assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1824  046f 4d            	tnz	a
1825  0470 2704          	jreq	L471
1826  0472 a108          	cp	a,#8
1827  0474 2603          	jrne	L271
1828  0476               L471:
1829  0476 4f            	clr	a
1830  0477 2010          	jra	L671
1831  0479               L271:
1832  0479 ae019b        	ldw	x,#411
1833  047c 89            	pushw	x
1834  047d ae0000        	ldw	x,#0
1835  0480 89            	pushw	x
1836  0481 ae0008        	ldw	x,#L371
1837  0484 cd0000        	call	_assert_failed
1839  0487 5b04          	addw	sp,#4
1840  0489               L671:
1841                     ; 413     UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1843  0489 72175234      	bres	21044,#3
1844                     ; 414     UART1->CR1 |= (uint8_t)UART1_WakeUp;
1846  048d c65234        	ld	a,21044
1847  0490 1a01          	or	a,(OFST+1,sp)
1848  0492 c75234        	ld	21044,a
1849                     ; 415 }
1852  0495 84            	pop	a
1853  0496 81            	ret
1890                     ; 422 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1890                     ; 423 {
1891                     	switch	.text
1892  0497               _UART1_ReceiverWakeUpCmd:
1894  0497 88            	push	a
1895       00000000      OFST:	set	0
1898                     ; 424     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1900  0498 4d            	tnz	a
1901  0499 2704          	jreq	L402
1902  049b a101          	cp	a,#1
1903  049d 2603          	jrne	L202
1904  049f               L402:
1905  049f 4f            	clr	a
1906  04a0 2010          	jra	L602
1907  04a2               L202:
1908  04a2 ae01a8        	ldw	x,#424
1909  04a5 89            	pushw	x
1910  04a6 ae0000        	ldw	x,#0
1911  04a9 89            	pushw	x
1912  04aa ae0008        	ldw	x,#L371
1913  04ad cd0000        	call	_assert_failed
1915  04b0 5b04          	addw	sp,#4
1916  04b2               L602:
1917                     ; 426     if (NewState != DISABLE)
1919  04b2 0d01          	tnz	(OFST+1,sp)
1920  04b4 2706          	jreq	L726
1921                     ; 429         UART1->CR2 |= UART1_CR2_RWU;
1923  04b6 72125235      	bset	21045,#1
1925  04ba 2004          	jra	L136
1926  04bc               L726:
1927                     ; 434         UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1929  04bc 72135235      	bres	21045,#1
1930  04c0               L136:
1931                     ; 436 }
1934  04c0 84            	pop	a
1935  04c1 81            	ret
1958                     ; 443 uint8_t UART1_ReceiveData8(void)
1958                     ; 444 {
1959                     	switch	.text
1960  04c2               _UART1_ReceiveData8:
1964                     ; 445     return ((uint8_t)UART1->DR);
1966  04c2 c65231        	ld	a,21041
1969  04c5 81            	ret
2003                     ; 453 uint16_t UART1_ReceiveData9(void)
2003                     ; 454 {
2004                     	switch	.text
2005  04c6               _UART1_ReceiveData9:
2007  04c6 89            	pushw	x
2008       00000002      OFST:	set	2
2011                     ; 455   uint16_t temp = 0;
2013                     ; 457   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
2015  04c7 c65234        	ld	a,21044
2016  04ca 5f            	clrw	x
2017  04cb a480          	and	a,#128
2018  04cd 5f            	clrw	x
2019  04ce 02            	rlwa	x,a
2020  04cf 58            	sllw	x
2021  04d0 1f01          	ldw	(OFST-1,sp),x
2022                     ; 458   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
2024  04d2 c65231        	ld	a,21041
2025  04d5 5f            	clrw	x
2026  04d6 97            	ld	xl,a
2027  04d7 01            	rrwa	x,a
2028  04d8 1a02          	or	a,(OFST+0,sp)
2029  04da 01            	rrwa	x,a
2030  04db 1a01          	or	a,(OFST-1,sp)
2031  04dd 01            	rrwa	x,a
2032  04de 01            	rrwa	x,a
2033  04df a4ff          	and	a,#255
2034  04e1 01            	rrwa	x,a
2035  04e2 a401          	and	a,#1
2036  04e4 01            	rrwa	x,a
2039  04e5 5b02          	addw	sp,#2
2040  04e7 81            	ret
2074                     ; 466 void UART1_SendData8(uint8_t Data)
2074                     ; 467 {
2075                     	switch	.text
2076  04e8               _UART1_SendData8:
2080                     ; 469     UART1->DR = Data;
2082  04e8 c75231        	ld	21041,a
2083                     ; 470 }
2086  04eb 81            	ret
2120                     ; 478 void UART1_SendData9(uint16_t Data)
2120                     ; 479 {
2121                     	switch	.text
2122  04ec               _UART1_SendData9:
2124  04ec 89            	pushw	x
2125       00000000      OFST:	set	0
2128                     ; 481     UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2130  04ed 721d5234      	bres	21044,#6
2131                     ; 483     UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2133  04f1 54            	srlw	x
2134  04f2 54            	srlw	x
2135  04f3 9f            	ld	a,xl
2136  04f4 a440          	and	a,#64
2137  04f6 ca5234        	or	a,21044
2138  04f9 c75234        	ld	21044,a
2139                     ; 485     UART1->DR   = (uint8_t)(Data);
2141  04fc 7b02          	ld	a,(OFST+2,sp)
2142  04fe c75231        	ld	21041,a
2143                     ; 486 }
2146  0501 85            	popw	x
2147  0502 81            	ret
2170                     ; 493 void UART1_SendBreak(void)
2170                     ; 494 {
2171                     	switch	.text
2172  0503               _UART1_SendBreak:
2176                     ; 495     UART1->CR2 |= UART1_CR2_SBK;
2178  0503 72105235      	bset	21045,#0
2179                     ; 496 }
2182  0507 81            	ret
2217                     ; 503 void UART1_SetAddress(uint8_t UART1_Address)
2217                     ; 504 {
2218                     	switch	.text
2219  0508               _UART1_SetAddress:
2221  0508 88            	push	a
2222       00000000      OFST:	set	0
2225                     ; 506     assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2227  0509 a110          	cp	a,#16
2228  050b 2403          	jruge	L422
2229  050d 4f            	clr	a
2230  050e 2010          	jra	L622
2231  0510               L422:
2232  0510 ae01fa        	ldw	x,#506
2233  0513 89            	pushw	x
2234  0514 ae0000        	ldw	x,#0
2235  0517 89            	pushw	x
2236  0518 ae0008        	ldw	x,#L371
2237  051b cd0000        	call	_assert_failed
2239  051e 5b04          	addw	sp,#4
2240  0520               L622:
2241                     ; 509     UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2243  0520 c65237        	ld	a,21047
2244  0523 a4f0          	and	a,#240
2245  0525 c75237        	ld	21047,a
2246                     ; 511     UART1->CR4 |= UART1_Address;
2248  0528 c65237        	ld	a,21047
2249  052b 1a01          	or	a,(OFST+1,sp)
2250  052d c75237        	ld	21047,a
2251                     ; 512 }
2254  0530 84            	pop	a
2255  0531 81            	ret
2289                     ; 520 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2289                     ; 521 {
2290                     	switch	.text
2291  0532               _UART1_SetGuardTime:
2295                     ; 523     UART1->GTR = UART1_GuardTime;
2297  0532 c75239        	ld	21049,a
2298                     ; 524 }
2301  0535 81            	ret
2335                     ; 548 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2335                     ; 549 {
2336                     	switch	.text
2337  0536               _UART1_SetPrescaler:
2341                     ; 551     UART1->PSCR = UART1_Prescaler;
2343  0536 c7523a        	ld	21050,a
2344                     ; 552 }
2347  0539 81            	ret
2491                     ; 560 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2491                     ; 561 {
2492                     	switch	.text
2493  053a               _UART1_GetFlagStatus:
2495  053a 89            	pushw	x
2496  053b 88            	push	a
2497       00000001      OFST:	set	1
2500                     ; 562     FlagStatus status = RESET;
2502                     ; 565     assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2504  053c a30080        	cpw	x,#128
2505  053f 272d          	jreq	L042
2506  0541 a30040        	cpw	x,#64
2507  0544 2728          	jreq	L042
2508  0546 a30020        	cpw	x,#32
2509  0549 2723          	jreq	L042
2510  054b a30010        	cpw	x,#16
2511  054e 271e          	jreq	L042
2512  0550 a30008        	cpw	x,#8
2513  0553 2719          	jreq	L042
2514  0555 a30004        	cpw	x,#4
2515  0558 2714          	jreq	L042
2516  055a a30002        	cpw	x,#2
2517  055d 270f          	jreq	L042
2518  055f a30001        	cpw	x,#1
2519  0562 270a          	jreq	L042
2520  0564 a30101        	cpw	x,#257
2521  0567 2705          	jreq	L042
2522  0569 a30210        	cpw	x,#528
2523  056c 2603          	jrne	L632
2524  056e               L042:
2525  056e 4f            	clr	a
2526  056f 2010          	jra	L242
2527  0571               L632:
2528  0571 ae0235        	ldw	x,#565
2529  0574 89            	pushw	x
2530  0575 ae0000        	ldw	x,#0
2531  0578 89            	pushw	x
2532  0579 ae0008        	ldw	x,#L371
2533  057c cd0000        	call	_assert_failed
2535  057f 5b04          	addw	sp,#4
2536  0581               L242:
2537                     ; 569     if (UART1_FLAG == UART1_FLAG_LBDF)
2539  0581 1e02          	ldw	x,(OFST+1,sp)
2540  0583 a30210        	cpw	x,#528
2541  0586 2611          	jrne	L1601
2542                     ; 571         if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2544  0588 c65237        	ld	a,21047
2545  058b 1503          	bcp	a,(OFST+2,sp)
2546  058d 2706          	jreq	L3601
2547                     ; 574             status = SET;
2549  058f a601          	ld	a,#1
2550  0591 6b01          	ld	(OFST+0,sp),a
2552  0593 202b          	jra	L7601
2553  0595               L3601:
2554                     ; 579             status = RESET;
2556  0595 0f01          	clr	(OFST+0,sp)
2557  0597 2027          	jra	L7601
2558  0599               L1601:
2559                     ; 582     else if (UART1_FLAG == UART1_FLAG_SBK)
2561  0599 1e02          	ldw	x,(OFST+1,sp)
2562  059b a30101        	cpw	x,#257
2563  059e 2611          	jrne	L1701
2564                     ; 584         if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2566  05a0 c65235        	ld	a,21045
2567  05a3 1503          	bcp	a,(OFST+2,sp)
2568  05a5 2706          	jreq	L3701
2569                     ; 587             status = SET;
2571  05a7 a601          	ld	a,#1
2572  05a9 6b01          	ld	(OFST+0,sp),a
2574  05ab 2013          	jra	L7601
2575  05ad               L3701:
2576                     ; 592             status = RESET;
2578  05ad 0f01          	clr	(OFST+0,sp)
2579  05af 200f          	jra	L7601
2580  05b1               L1701:
2581                     ; 597         if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2583  05b1 c65230        	ld	a,21040
2584  05b4 1503          	bcp	a,(OFST+2,sp)
2585  05b6 2706          	jreq	L1011
2586                     ; 600             status = SET;
2588  05b8 a601          	ld	a,#1
2589  05ba 6b01          	ld	(OFST+0,sp),a
2591  05bc 2002          	jra	L7601
2592  05be               L1011:
2593                     ; 605             status = RESET;
2595  05be 0f01          	clr	(OFST+0,sp)
2596  05c0               L7601:
2597                     ; 609     return status;
2599  05c0 7b01          	ld	a,(OFST+0,sp)
2602  05c2 5b03          	addw	sp,#3
2603  05c4 81            	ret
2639                     ; 639 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2639                     ; 640 {
2640                     	switch	.text
2641  05c5               _UART1_ClearFlag:
2643  05c5 89            	pushw	x
2644       00000000      OFST:	set	0
2647                     ; 641     assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2649  05c6 a30020        	cpw	x,#32
2650  05c9 2705          	jreq	L052
2651  05cb a30210        	cpw	x,#528
2652  05ce 2603          	jrne	L642
2653  05d0               L052:
2654  05d0 4f            	clr	a
2655  05d1 2010          	jra	L252
2656  05d3               L642:
2657  05d3 ae0281        	ldw	x,#641
2658  05d6 89            	pushw	x
2659  05d7 ae0000        	ldw	x,#0
2660  05da 89            	pushw	x
2661  05db ae0008        	ldw	x,#L371
2662  05de cd0000        	call	_assert_failed
2664  05e1 5b04          	addw	sp,#4
2665  05e3               L252:
2666                     ; 644     if (UART1_FLAG == UART1_FLAG_RXNE)
2668  05e3 1e01          	ldw	x,(OFST+1,sp)
2669  05e5 a30020        	cpw	x,#32
2670  05e8 2606          	jrne	L3211
2671                     ; 646         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2673  05ea 35df5230      	mov	21040,#223
2675  05ee 2004          	jra	L5211
2676  05f0               L3211:
2677                     ; 651         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2679  05f0 72195237      	bres	21047,#4
2680  05f4               L5211:
2681                     ; 653 }
2684  05f4 85            	popw	x
2685  05f5 81            	ret
2768                     ; 668 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2768                     ; 669 {
2769                     	switch	.text
2770  05f6               _UART1_GetITStatus:
2772  05f6 89            	pushw	x
2773  05f7 89            	pushw	x
2774       00000002      OFST:	set	2
2777                     ; 670     ITStatus pendingbitstatus = RESET;
2779                     ; 671     uint8_t itpos = 0;
2781                     ; 672     uint8_t itmask1 = 0;
2783                     ; 673     uint8_t itmask2 = 0;
2785                     ; 674     uint8_t enablestatus = 0;
2787                     ; 677     assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2789  05f8 a30277        	cpw	x,#631
2790  05fb 271e          	jreq	L062
2791  05fd a30266        	cpw	x,#614
2792  0600 2719          	jreq	L062
2793  0602 a30255        	cpw	x,#597
2794  0605 2714          	jreq	L062
2795  0607 a30244        	cpw	x,#580
2796  060a 270f          	jreq	L062
2797  060c a30235        	cpw	x,#565
2798  060f 270a          	jreq	L062
2799  0611 a30346        	cpw	x,#838
2800  0614 2705          	jreq	L062
2801  0616 a30100        	cpw	x,#256
2802  0619 2603          	jrne	L652
2803  061b               L062:
2804  061b 4f            	clr	a
2805  061c 2010          	jra	L262
2806  061e               L652:
2807  061e ae02a5        	ldw	x,#677
2808  0621 89            	pushw	x
2809  0622 ae0000        	ldw	x,#0
2810  0625 89            	pushw	x
2811  0626 ae0008        	ldw	x,#L371
2812  0629 cd0000        	call	_assert_failed
2814  062c 5b04          	addw	sp,#4
2815  062e               L262:
2816                     ; 680     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2818  062e 7b04          	ld	a,(OFST+2,sp)
2819  0630 a40f          	and	a,#15
2820  0632 5f            	clrw	x
2821  0633 97            	ld	xl,a
2822  0634 a601          	ld	a,#1
2823  0636 5d            	tnzw	x
2824  0637 2704          	jreq	L462
2825  0639               L662:
2826  0639 48            	sll	a
2827  063a 5a            	decw	x
2828  063b 26fc          	jrne	L662
2829  063d               L462:
2830  063d 6b01          	ld	(OFST-1,sp),a
2831                     ; 682     itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2833  063f 7b04          	ld	a,(OFST+2,sp)
2834  0641 4e            	swap	a
2835  0642 a40f          	and	a,#15
2836  0644 6b02          	ld	(OFST+0,sp),a
2837                     ; 684     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2839  0646 7b02          	ld	a,(OFST+0,sp)
2840  0648 5f            	clrw	x
2841  0649 97            	ld	xl,a
2842  064a a601          	ld	a,#1
2843  064c 5d            	tnzw	x
2844  064d 2704          	jreq	L072
2845  064f               L272:
2846  064f 48            	sll	a
2847  0650 5a            	decw	x
2848  0651 26fc          	jrne	L272
2849  0653               L072:
2850  0653 6b02          	ld	(OFST+0,sp),a
2851                     ; 688     if (UART1_IT == UART1_IT_PE)
2853  0655 1e03          	ldw	x,(OFST+1,sp)
2854  0657 a30100        	cpw	x,#256
2855  065a 261c          	jrne	L1711
2856                     ; 691         enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2858  065c c65234        	ld	a,21044
2859  065f 1402          	and	a,(OFST+0,sp)
2860  0661 6b02          	ld	(OFST+0,sp),a
2861                     ; 694         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2863  0663 c65230        	ld	a,21040
2864  0666 1501          	bcp	a,(OFST-1,sp)
2865  0668 270a          	jreq	L3711
2867  066a 0d02          	tnz	(OFST+0,sp)
2868  066c 2706          	jreq	L3711
2869                     ; 697             pendingbitstatus = SET;
2871  066e a601          	ld	a,#1
2872  0670 6b02          	ld	(OFST+0,sp),a
2874  0672 2041          	jra	L7711
2875  0674               L3711:
2876                     ; 702             pendingbitstatus = RESET;
2878  0674 0f02          	clr	(OFST+0,sp)
2879  0676 203d          	jra	L7711
2880  0678               L1711:
2881                     ; 706     else if (UART1_IT == UART1_IT_LBDF)
2883  0678 1e03          	ldw	x,(OFST+1,sp)
2884  067a a30346        	cpw	x,#838
2885  067d 261c          	jrne	L1021
2886                     ; 709         enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2888  067f c65237        	ld	a,21047
2889  0682 1402          	and	a,(OFST+0,sp)
2890  0684 6b02          	ld	(OFST+0,sp),a
2891                     ; 711         if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2893  0686 c65237        	ld	a,21047
2894  0689 1501          	bcp	a,(OFST-1,sp)
2895  068b 270a          	jreq	L3021
2897  068d 0d02          	tnz	(OFST+0,sp)
2898  068f 2706          	jreq	L3021
2899                     ; 714             pendingbitstatus = SET;
2901  0691 a601          	ld	a,#1
2902  0693 6b02          	ld	(OFST+0,sp),a
2904  0695 201e          	jra	L7711
2905  0697               L3021:
2906                     ; 719             pendingbitstatus = RESET;
2908  0697 0f02          	clr	(OFST+0,sp)
2909  0699 201a          	jra	L7711
2910  069b               L1021:
2911                     ; 725         enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2913  069b c65235        	ld	a,21045
2914  069e 1402          	and	a,(OFST+0,sp)
2915  06a0 6b02          	ld	(OFST+0,sp),a
2916                     ; 727         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2918  06a2 c65230        	ld	a,21040
2919  06a5 1501          	bcp	a,(OFST-1,sp)
2920  06a7 270a          	jreq	L1121
2922  06a9 0d02          	tnz	(OFST+0,sp)
2923  06ab 2706          	jreq	L1121
2924                     ; 730             pendingbitstatus = SET;
2926  06ad a601          	ld	a,#1
2927  06af 6b02          	ld	(OFST+0,sp),a
2929  06b1 2002          	jra	L7711
2930  06b3               L1121:
2931                     ; 735             pendingbitstatus = RESET;
2933  06b3 0f02          	clr	(OFST+0,sp)
2934  06b5               L7711:
2935                     ; 740     return  pendingbitstatus;
2937  06b5 7b02          	ld	a,(OFST+0,sp)
2940  06b7 5b04          	addw	sp,#4
2941  06b9 81            	ret
2978                     ; 768 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2978                     ; 769 {
2979                     	switch	.text
2980  06ba               _UART1_ClearITPendingBit:
2982  06ba 89            	pushw	x
2983       00000000      OFST:	set	0
2986                     ; 770     assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2988  06bb a30255        	cpw	x,#597
2989  06be 2705          	jreq	L003
2990  06c0 a30346        	cpw	x,#838
2991  06c3 2603          	jrne	L672
2992  06c5               L003:
2993  06c5 4f            	clr	a
2994  06c6 2010          	jra	L203
2995  06c8               L672:
2996  06c8 ae0302        	ldw	x,#770
2997  06cb 89            	pushw	x
2998  06cc ae0000        	ldw	x,#0
2999  06cf 89            	pushw	x
3000  06d0 ae0008        	ldw	x,#L371
3001  06d3 cd0000        	call	_assert_failed
3003  06d6 5b04          	addw	sp,#4
3004  06d8               L203:
3005                     ; 773     if (UART1_IT == UART1_IT_RXNE)
3007  06d8 1e01          	ldw	x,(OFST+1,sp)
3008  06da a30255        	cpw	x,#597
3009  06dd 2606          	jrne	L3321
3010                     ; 775         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
3012  06df 35df5230      	mov	21040,#223
3014  06e3 2004          	jra	L5321
3015  06e5               L3321:
3016                     ; 780         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
3018  06e5 72195237      	bres	21047,#4
3019  06e9               L5321:
3020                     ; 782 }
3023  06e9 85            	popw	x
3024  06ea 81            	ret
3037                     	xdef	_UART1_ClearITPendingBit
3038                     	xdef	_UART1_GetITStatus
3039                     	xdef	_UART1_ClearFlag
3040                     	xdef	_UART1_GetFlagStatus
3041                     	xdef	_UART1_SetPrescaler
3042                     	xdef	_UART1_SetGuardTime
3043                     	xdef	_UART1_SetAddress
3044                     	xdef	_UART1_SendBreak
3045                     	xdef	_UART1_SendData9
3046                     	xdef	_UART1_SendData8
3047                     	xdef	_UART1_ReceiveData9
3048                     	xdef	_UART1_ReceiveData8
3049                     	xdef	_UART1_ReceiverWakeUpCmd
3050                     	xdef	_UART1_WakeUpConfig
3051                     	xdef	_UART1_SmartCardNACKCmd
3052                     	xdef	_UART1_SmartCardCmd
3053                     	xdef	_UART1_LINCmd
3054                     	xdef	_UART1_LINBreakDetectionConfig
3055                     	xdef	_UART1_IrDACmd
3056                     	xdef	_UART1_IrDAConfig
3057                     	xdef	_UART1_HalfDuplexCmd
3058                     	xdef	_UART1_ITConfig
3059                     	xdef	_UART1_Cmd
3060                     	xdef	_UART1_Init
3061                     	xdef	_UART1_DeInit
3062                     	xref	_assert_failed
3063                     	xref	_CLK_GetClockFreq
3064                     	switch	.const
3065  0008               L371:
3066  0008 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_u"
3067  001a 617274312e63  	dc.b	"art1.c",0
3068                     	xref.b	c_lreg
3069                     	xref.b	c_x
3089                     	xref	c_lursh
3090                     	xref	c_lsub
3091                     	xref	c_smul
3092                     	xref	c_ludv
3093                     	xref	c_rtol
3094                     	xref	c_llsh
3095                     	xref	c_lcmp
3096                     	xref	c_ltor
3097                     	end
