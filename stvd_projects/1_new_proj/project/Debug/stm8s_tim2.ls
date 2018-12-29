   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 46 void TIM2_DeInit(void)
  43                     ; 47 {
  45                     	switch	.text
  46  0000               _TIM2_DeInit:
  50                     ; 49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  52  0000 725f5300      	clr	21248
  53                     ; 50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  55  0004 725f5303      	clr	21251
  56                     ; 51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  58  0008 725f5305      	clr	21253
  59                     ; 54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  61  000c 725f530a      	clr	21258
  62                     ; 55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  64  0010 725f530b      	clr	21259
  65                     ; 59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  67  0014 725f530a      	clr	21258
  68                     ; 60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  70  0018 725f530b      	clr	21259
  71                     ; 61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  73  001c 725f5307      	clr	21255
  74                     ; 62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  76  0020 725f5308      	clr	21256
  77                     ; 63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  79  0024 725f5309      	clr	21257
  80                     ; 64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  82  0028 725f530c      	clr	21260
  83                     ; 65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  85  002c 725f530d      	clr	21261
  86                     ; 66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  88  0030 725f530e      	clr	21262
  89                     ; 67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  91  0034 35ff530f      	mov	21263,#255
  92                     ; 68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  94  0038 35ff5310      	mov	21264,#255
  95                     ; 69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  97  003c 725f5311      	clr	21265
  98                     ; 70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 100  0040 725f5312      	clr	21266
 101                     ; 71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 103  0044 725f5313      	clr	21267
 104                     ; 72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 106  0048 725f5314      	clr	21268
 107                     ; 73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 109  004c 725f5315      	clr	21269
 110                     ; 74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 112  0050 725f5316      	clr	21270
 113                     ; 75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 115  0054 725f5304      	clr	21252
 116                     ; 76 }
 119  0058 81            	ret
 287                     ; 85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 287                     ; 86                         uint16_t TIM2_Period)
 287                     ; 87 {
 288                     	switch	.text
 289  0059               _TIM2_TimeBaseInit:
 291  0059 88            	push	a
 292       00000000      OFST:	set	0
 295                     ; 89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 297  005a c7530e        	ld	21262,a
 298                     ; 91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 300  005d 7b04          	ld	a,(OFST+4,sp)
 301  005f c7530f        	ld	21263,a
 302                     ; 92     TIM2->ARRL = (uint8_t)(TIM2_Period);
 304  0062 7b05          	ld	a,(OFST+5,sp)
 305  0064 c75310        	ld	21264,a
 306                     ; 93 }
 309  0067 84            	pop	a
 310  0068 81            	ret
 468                     ; 104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 468                     ; 105                   TIM2_OutputState_TypeDef TIM2_OutputState,
 468                     ; 106                   uint16_t TIM2_Pulse,
 468                     ; 107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 468                     ; 108 {
 469                     	switch	.text
 470  0069               _TIM2_OC1Init:
 472  0069 89            	pushw	x
 473  006a 88            	push	a
 474       00000001      OFST:	set	1
 477                     ; 110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 479  006b 9e            	ld	a,xh
 480  006c 4d            	tnz	a
 481  006d 2719          	jreq	L41
 482  006f 9e            	ld	a,xh
 483  0070 a110          	cp	a,#16
 484  0072 2714          	jreq	L41
 485  0074 9e            	ld	a,xh
 486  0075 a120          	cp	a,#32
 487  0077 270f          	jreq	L41
 488  0079 9e            	ld	a,xh
 489  007a a130          	cp	a,#48
 490  007c 270a          	jreq	L41
 491  007e 9e            	ld	a,xh
 492  007f a160          	cp	a,#96
 493  0081 2705          	jreq	L41
 494  0083 9e            	ld	a,xh
 495  0084 a170          	cp	a,#112
 496  0086 2603          	jrne	L21
 497  0088               L41:
 498  0088 4f            	clr	a
 499  0089 2010          	jra	L61
 500  008b               L21:
 501  008b ae006e        	ldw	x,#110
 502  008e 89            	pushw	x
 503  008f ae0000        	ldw	x,#0
 504  0092 89            	pushw	x
 505  0093 ae0000        	ldw	x,#L702
 506  0096 cd0000        	call	_assert_failed
 508  0099 5b04          	addw	sp,#4
 509  009b               L61:
 510                     ; 111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 512  009b 0d03          	tnz	(OFST+2,sp)
 513  009d 2706          	jreq	L22
 514  009f 7b03          	ld	a,(OFST+2,sp)
 515  00a1 a111          	cp	a,#17
 516  00a3 2603          	jrne	L02
 517  00a5               L22:
 518  00a5 4f            	clr	a
 519  00a6 2010          	jra	L42
 520  00a8               L02:
 521  00a8 ae006f        	ldw	x,#111
 522  00ab 89            	pushw	x
 523  00ac ae0000        	ldw	x,#0
 524  00af 89            	pushw	x
 525  00b0 ae0000        	ldw	x,#L702
 526  00b3 cd0000        	call	_assert_failed
 528  00b6 5b04          	addw	sp,#4
 529  00b8               L42:
 530                     ; 112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 532  00b8 0d08          	tnz	(OFST+7,sp)
 533  00ba 2706          	jreq	L03
 534  00bc 7b08          	ld	a,(OFST+7,sp)
 535  00be a122          	cp	a,#34
 536  00c0 2603          	jrne	L62
 537  00c2               L03:
 538  00c2 4f            	clr	a
 539  00c3 2010          	jra	L23
 540  00c5               L62:
 541  00c5 ae0070        	ldw	x,#112
 542  00c8 89            	pushw	x
 543  00c9 ae0000        	ldw	x,#0
 544  00cc 89            	pushw	x
 545  00cd ae0000        	ldw	x,#L702
 546  00d0 cd0000        	call	_assert_failed
 548  00d3 5b04          	addw	sp,#4
 549  00d5               L23:
 550                     ; 115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 552  00d5 c6530a        	ld	a,21258
 553  00d8 a4fc          	and	a,#252
 554  00da c7530a        	ld	21258,a
 555                     ; 117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 555                     ; 118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 557  00dd 7b08          	ld	a,(OFST+7,sp)
 558  00df a402          	and	a,#2
 559  00e1 6b01          	ld	(OFST+0,sp),a
 560  00e3 7b03          	ld	a,(OFST+2,sp)
 561  00e5 a401          	and	a,#1
 562  00e7 1a01          	or	a,(OFST+0,sp)
 563  00e9 ca530a        	or	a,21258
 564  00ec c7530a        	ld	21258,a
 565                     ; 121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 565                     ; 122                             (uint8_t)TIM2_OCMode);
 567  00ef c65307        	ld	a,21255
 568  00f2 a48f          	and	a,#143
 569  00f4 1a02          	or	a,(OFST+1,sp)
 570  00f6 c75307        	ld	21255,a
 571                     ; 125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 573  00f9 7b06          	ld	a,(OFST+5,sp)
 574  00fb c75311        	ld	21265,a
 575                     ; 126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 577  00fe 7b07          	ld	a,(OFST+6,sp)
 578  0100 c75312        	ld	21266,a
 579                     ; 127 }
 582  0103 5b03          	addw	sp,#3
 583  0105 81            	ret
 648                     ; 138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 648                     ; 139                   TIM2_OutputState_TypeDef TIM2_OutputState,
 648                     ; 140                   uint16_t TIM2_Pulse,
 648                     ; 141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 648                     ; 142 {
 649                     	switch	.text
 650  0106               _TIM2_OC2Init:
 652  0106 89            	pushw	x
 653  0107 88            	push	a
 654       00000001      OFST:	set	1
 657                     ; 144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 659  0108 9e            	ld	a,xh
 660  0109 4d            	tnz	a
 661  010a 2719          	jreq	L04
 662  010c 9e            	ld	a,xh
 663  010d a110          	cp	a,#16
 664  010f 2714          	jreq	L04
 665  0111 9e            	ld	a,xh
 666  0112 a120          	cp	a,#32
 667  0114 270f          	jreq	L04
 668  0116 9e            	ld	a,xh
 669  0117 a130          	cp	a,#48
 670  0119 270a          	jreq	L04
 671  011b 9e            	ld	a,xh
 672  011c a160          	cp	a,#96
 673  011e 2705          	jreq	L04
 674  0120 9e            	ld	a,xh
 675  0121 a170          	cp	a,#112
 676  0123 2603          	jrne	L63
 677  0125               L04:
 678  0125 4f            	clr	a
 679  0126 2010          	jra	L24
 680  0128               L63:
 681  0128 ae0090        	ldw	x,#144
 682  012b 89            	pushw	x
 683  012c ae0000        	ldw	x,#0
 684  012f 89            	pushw	x
 685  0130 ae0000        	ldw	x,#L702
 686  0133 cd0000        	call	_assert_failed
 688  0136 5b04          	addw	sp,#4
 689  0138               L24:
 690                     ; 145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 692  0138 0d03          	tnz	(OFST+2,sp)
 693  013a 2706          	jreq	L64
 694  013c 7b03          	ld	a,(OFST+2,sp)
 695  013e a111          	cp	a,#17
 696  0140 2603          	jrne	L44
 697  0142               L64:
 698  0142 4f            	clr	a
 699  0143 2010          	jra	L05
 700  0145               L44:
 701  0145 ae0091        	ldw	x,#145
 702  0148 89            	pushw	x
 703  0149 ae0000        	ldw	x,#0
 704  014c 89            	pushw	x
 705  014d ae0000        	ldw	x,#L702
 706  0150 cd0000        	call	_assert_failed
 708  0153 5b04          	addw	sp,#4
 709  0155               L05:
 710                     ; 146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 712  0155 0d08          	tnz	(OFST+7,sp)
 713  0157 2706          	jreq	L45
 714  0159 7b08          	ld	a,(OFST+7,sp)
 715  015b a122          	cp	a,#34
 716  015d 2603          	jrne	L25
 717  015f               L45:
 718  015f 4f            	clr	a
 719  0160 2010          	jra	L65
 720  0162               L25:
 721  0162 ae0092        	ldw	x,#146
 722  0165 89            	pushw	x
 723  0166 ae0000        	ldw	x,#0
 724  0169 89            	pushw	x
 725  016a ae0000        	ldw	x,#L702
 726  016d cd0000        	call	_assert_failed
 728  0170 5b04          	addw	sp,#4
 729  0172               L65:
 730                     ; 150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 732  0172 c6530a        	ld	a,21258
 733  0175 a4cf          	and	a,#207
 734  0177 c7530a        	ld	21258,a
 735                     ; 152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 735                     ; 153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 737  017a 7b08          	ld	a,(OFST+7,sp)
 738  017c a420          	and	a,#32
 739  017e 6b01          	ld	(OFST+0,sp),a
 740  0180 7b03          	ld	a,(OFST+2,sp)
 741  0182 a410          	and	a,#16
 742  0184 1a01          	or	a,(OFST+0,sp)
 743  0186 ca530a        	or	a,21258
 744  0189 c7530a        	ld	21258,a
 745                     ; 157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 745                     ; 158                             (uint8_t)TIM2_OCMode);
 747  018c c65308        	ld	a,21256
 748  018f a48f          	and	a,#143
 749  0191 1a02          	or	a,(OFST+1,sp)
 750  0193 c75308        	ld	21256,a
 751                     ; 162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 753  0196 7b06          	ld	a,(OFST+5,sp)
 754  0198 c75313        	ld	21267,a
 755                     ; 163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 757  019b 7b07          	ld	a,(OFST+6,sp)
 758  019d c75314        	ld	21268,a
 759                     ; 164 }
 762  01a0 5b03          	addw	sp,#3
 763  01a2 81            	ret
 828                     ; 175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 828                     ; 176                   TIM2_OutputState_TypeDef TIM2_OutputState,
 828                     ; 177                   uint16_t TIM2_Pulse,
 828                     ; 178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 828                     ; 179 {
 829                     	switch	.text
 830  01a3               _TIM2_OC3Init:
 832  01a3 89            	pushw	x
 833  01a4 88            	push	a
 834       00000001      OFST:	set	1
 837                     ; 181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 839  01a5 9e            	ld	a,xh
 840  01a6 4d            	tnz	a
 841  01a7 2719          	jreq	L46
 842  01a9 9e            	ld	a,xh
 843  01aa a110          	cp	a,#16
 844  01ac 2714          	jreq	L46
 845  01ae 9e            	ld	a,xh
 846  01af a120          	cp	a,#32
 847  01b1 270f          	jreq	L46
 848  01b3 9e            	ld	a,xh
 849  01b4 a130          	cp	a,#48
 850  01b6 270a          	jreq	L46
 851  01b8 9e            	ld	a,xh
 852  01b9 a160          	cp	a,#96
 853  01bb 2705          	jreq	L46
 854  01bd 9e            	ld	a,xh
 855  01be a170          	cp	a,#112
 856  01c0 2603          	jrne	L26
 857  01c2               L46:
 858  01c2 4f            	clr	a
 859  01c3 2010          	jra	L66
 860  01c5               L26:
 861  01c5 ae00b5        	ldw	x,#181
 862  01c8 89            	pushw	x
 863  01c9 ae0000        	ldw	x,#0
 864  01cc 89            	pushw	x
 865  01cd ae0000        	ldw	x,#L702
 866  01d0 cd0000        	call	_assert_failed
 868  01d3 5b04          	addw	sp,#4
 869  01d5               L66:
 870                     ; 182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 872  01d5 0d03          	tnz	(OFST+2,sp)
 873  01d7 2706          	jreq	L27
 874  01d9 7b03          	ld	a,(OFST+2,sp)
 875  01db a111          	cp	a,#17
 876  01dd 2603          	jrne	L07
 877  01df               L27:
 878  01df 4f            	clr	a
 879  01e0 2010          	jra	L47
 880  01e2               L07:
 881  01e2 ae00b6        	ldw	x,#182
 882  01e5 89            	pushw	x
 883  01e6 ae0000        	ldw	x,#0
 884  01e9 89            	pushw	x
 885  01ea ae0000        	ldw	x,#L702
 886  01ed cd0000        	call	_assert_failed
 888  01f0 5b04          	addw	sp,#4
 889  01f2               L47:
 890                     ; 183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 892  01f2 0d08          	tnz	(OFST+7,sp)
 893  01f4 2706          	jreq	L001
 894  01f6 7b08          	ld	a,(OFST+7,sp)
 895  01f8 a122          	cp	a,#34
 896  01fa 2603          	jrne	L67
 897  01fc               L001:
 898  01fc 4f            	clr	a
 899  01fd 2010          	jra	L201
 900  01ff               L67:
 901  01ff ae00b7        	ldw	x,#183
 902  0202 89            	pushw	x
 903  0203 ae0000        	ldw	x,#0
 904  0206 89            	pushw	x
 905  0207 ae0000        	ldw	x,#L702
 906  020a cd0000        	call	_assert_failed
 908  020d 5b04          	addw	sp,#4
 909  020f               L201:
 910                     ; 185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 912  020f c6530b        	ld	a,21259
 913  0212 a4fc          	and	a,#252
 914  0214 c7530b        	ld	21259,a
 915                     ; 187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 915                     ; 188                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 917  0217 7b08          	ld	a,(OFST+7,sp)
 918  0219 a402          	and	a,#2
 919  021b 6b01          	ld	(OFST+0,sp),a
 920  021d 7b03          	ld	a,(OFST+2,sp)
 921  021f a401          	and	a,#1
 922  0221 1a01          	or	a,(OFST+0,sp)
 923  0223 ca530b        	or	a,21259
 924  0226 c7530b        	ld	21259,a
 925                     ; 191     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 925                     ; 192                             (uint8_t)TIM2_OCMode);
 927  0229 c65309        	ld	a,21257
 928  022c a48f          	and	a,#143
 929  022e 1a02          	or	a,(OFST+1,sp)
 930  0230 c75309        	ld	21257,a
 931                     ; 195     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 933  0233 7b06          	ld	a,(OFST+5,sp)
 934  0235 c75315        	ld	21269,a
 935                     ; 196     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 937  0238 7b07          	ld	a,(OFST+6,sp)
 938  023a c75316        	ld	21270,a
 939                     ; 198 }
 942  023d 5b03          	addw	sp,#3
 943  023f 81            	ret
1137                     ; 210 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1137                     ; 211                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1137                     ; 212                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1137                     ; 213                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1137                     ; 214                  uint8_t TIM2_ICFilter)
1137                     ; 215 {
1138                     	switch	.text
1139  0240               _TIM2_ICInit:
1141  0240 89            	pushw	x
1142       00000000      OFST:	set	0
1145                     ; 217     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1147  0241 9e            	ld	a,xh
1148  0242 4d            	tnz	a
1149  0243 270a          	jreq	L011
1150  0245 9e            	ld	a,xh
1151  0246 a101          	cp	a,#1
1152  0248 2705          	jreq	L011
1153  024a 9e            	ld	a,xh
1154  024b a102          	cp	a,#2
1155  024d 2603          	jrne	L601
1156  024f               L011:
1157  024f 4f            	clr	a
1158  0250 2010          	jra	L211
1159  0252               L601:
1160  0252 ae00d9        	ldw	x,#217
1161  0255 89            	pushw	x
1162  0256 ae0000        	ldw	x,#0
1163  0259 89            	pushw	x
1164  025a ae0000        	ldw	x,#L702
1165  025d cd0000        	call	_assert_failed
1167  0260 5b04          	addw	sp,#4
1168  0262               L211:
1169                     ; 218     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1171  0262 0d02          	tnz	(OFST+2,sp)
1172  0264 2706          	jreq	L611
1173  0266 7b02          	ld	a,(OFST+2,sp)
1174  0268 a144          	cp	a,#68
1175  026a 2603          	jrne	L411
1176  026c               L611:
1177  026c 4f            	clr	a
1178  026d 2010          	jra	L021
1179  026f               L411:
1180  026f ae00da        	ldw	x,#218
1181  0272 89            	pushw	x
1182  0273 ae0000        	ldw	x,#0
1183  0276 89            	pushw	x
1184  0277 ae0000        	ldw	x,#L702
1185  027a cd0000        	call	_assert_failed
1187  027d 5b04          	addw	sp,#4
1188  027f               L021:
1189                     ; 219     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1191  027f 7b05          	ld	a,(OFST+5,sp)
1192  0281 a101          	cp	a,#1
1193  0283 270c          	jreq	L421
1194  0285 7b05          	ld	a,(OFST+5,sp)
1195  0287 a102          	cp	a,#2
1196  0289 2706          	jreq	L421
1197  028b 7b05          	ld	a,(OFST+5,sp)
1198  028d a103          	cp	a,#3
1199  028f 2603          	jrne	L221
1200  0291               L421:
1201  0291 4f            	clr	a
1202  0292 2010          	jra	L621
1203  0294               L221:
1204  0294 ae00db        	ldw	x,#219
1205  0297 89            	pushw	x
1206  0298 ae0000        	ldw	x,#0
1207  029b 89            	pushw	x
1208  029c ae0000        	ldw	x,#L702
1209  029f cd0000        	call	_assert_failed
1211  02a2 5b04          	addw	sp,#4
1212  02a4               L621:
1213                     ; 220     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1215  02a4 0d06          	tnz	(OFST+6,sp)
1216  02a6 2712          	jreq	L231
1217  02a8 7b06          	ld	a,(OFST+6,sp)
1218  02aa a104          	cp	a,#4
1219  02ac 270c          	jreq	L231
1220  02ae 7b06          	ld	a,(OFST+6,sp)
1221  02b0 a108          	cp	a,#8
1222  02b2 2706          	jreq	L231
1223  02b4 7b06          	ld	a,(OFST+6,sp)
1224  02b6 a10c          	cp	a,#12
1225  02b8 2603          	jrne	L031
1226  02ba               L231:
1227  02ba 4f            	clr	a
1228  02bb 2010          	jra	L431
1229  02bd               L031:
1230  02bd ae00dc        	ldw	x,#220
1231  02c0 89            	pushw	x
1232  02c1 ae0000        	ldw	x,#0
1233  02c4 89            	pushw	x
1234  02c5 ae0000        	ldw	x,#L702
1235  02c8 cd0000        	call	_assert_failed
1237  02cb 5b04          	addw	sp,#4
1238  02cd               L431:
1239                     ; 221     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1241  02cd 7b07          	ld	a,(OFST+7,sp)
1242  02cf a110          	cp	a,#16
1243  02d1 2403          	jruge	L631
1244  02d3 4f            	clr	a
1245  02d4 2010          	jra	L041
1246  02d6               L631:
1247  02d6 ae00dd        	ldw	x,#221
1248  02d9 89            	pushw	x
1249  02da ae0000        	ldw	x,#0
1250  02dd 89            	pushw	x
1251  02de ae0000        	ldw	x,#L702
1252  02e1 cd0000        	call	_assert_failed
1254  02e4 5b04          	addw	sp,#4
1255  02e6               L041:
1256                     ; 223     if (TIM2_Channel == TIM2_CHANNEL_1)
1258  02e6 0d01          	tnz	(OFST+1,sp)
1259  02e8 2614          	jrne	L304
1260                     ; 226         TI1_Config((uint8_t)TIM2_ICPolarity,
1260                     ; 227                    (uint8_t)TIM2_ICSelection,
1260                     ; 228                    (uint8_t)TIM2_ICFilter);
1262  02ea 7b07          	ld	a,(OFST+7,sp)
1263  02ec 88            	push	a
1264  02ed 7b06          	ld	a,(OFST+6,sp)
1265  02ef 97            	ld	xl,a
1266  02f0 7b03          	ld	a,(OFST+3,sp)
1267  02f2 95            	ld	xh,a
1268  02f3 cd0ad3        	call	L3_TI1_Config
1270  02f6 84            	pop	a
1271                     ; 231         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1273  02f7 7b06          	ld	a,(OFST+6,sp)
1274  02f9 cd08c3        	call	_TIM2_SetIC1Prescaler
1277  02fc 202c          	jra	L504
1278  02fe               L304:
1279                     ; 233     else if (TIM2_Channel == TIM2_CHANNEL_2)
1281  02fe 7b01          	ld	a,(OFST+1,sp)
1282  0300 a101          	cp	a,#1
1283  0302 2614          	jrne	L704
1284                     ; 236         TI2_Config((uint8_t)TIM2_ICPolarity,
1284                     ; 237                    (uint8_t)TIM2_ICSelection,
1284                     ; 238                    (uint8_t)TIM2_ICFilter);
1286  0304 7b07          	ld	a,(OFST+7,sp)
1287  0306 88            	push	a
1288  0307 7b06          	ld	a,(OFST+6,sp)
1289  0309 97            	ld	xl,a
1290  030a 7b03          	ld	a,(OFST+3,sp)
1291  030c 95            	ld	xh,a
1292  030d cd0b03        	call	L5_TI2_Config
1294  0310 84            	pop	a
1295                     ; 241         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1297  0311 7b06          	ld	a,(OFST+6,sp)
1298  0313 cd08f2        	call	_TIM2_SetIC2Prescaler
1301  0316 2012          	jra	L504
1302  0318               L704:
1303                     ; 246         TI3_Config((uint8_t)TIM2_ICPolarity,
1303                     ; 247                    (uint8_t)TIM2_ICSelection,
1303                     ; 248                    (uint8_t)TIM2_ICFilter);
1305  0318 7b07          	ld	a,(OFST+7,sp)
1306  031a 88            	push	a
1307  031b 7b06          	ld	a,(OFST+6,sp)
1308  031d 97            	ld	xl,a
1309  031e 7b03          	ld	a,(OFST+3,sp)
1310  0320 95            	ld	xh,a
1311  0321 cd0b33        	call	L7_TI3_Config
1313  0324 84            	pop	a
1314                     ; 251         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1316  0325 7b06          	ld	a,(OFST+6,sp)
1317  0327 cd0921        	call	_TIM2_SetIC3Prescaler
1319  032a               L504:
1320                     ; 253 }
1323  032a 85            	popw	x
1324  032b 81            	ret
1421                     ; 265 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1421                     ; 266                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1421                     ; 267                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1421                     ; 268                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1421                     ; 269                      uint8_t TIM2_ICFilter)
1421                     ; 270 {
1422                     	switch	.text
1423  032c               _TIM2_PWMIConfig:
1425  032c 89            	pushw	x
1426  032d 89            	pushw	x
1427       00000002      OFST:	set	2
1430                     ; 271     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1432                     ; 272     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1434                     ; 275     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1436  032e 9e            	ld	a,xh
1437  032f 4d            	tnz	a
1438  0330 2705          	jreq	L641
1439  0332 9e            	ld	a,xh
1440  0333 a101          	cp	a,#1
1441  0335 2603          	jrne	L441
1442  0337               L641:
1443  0337 4f            	clr	a
1444  0338 2010          	jra	L051
1445  033a               L441:
1446  033a ae0113        	ldw	x,#275
1447  033d 89            	pushw	x
1448  033e ae0000        	ldw	x,#0
1449  0341 89            	pushw	x
1450  0342 ae0000        	ldw	x,#L702
1451  0345 cd0000        	call	_assert_failed
1453  0348 5b04          	addw	sp,#4
1454  034a               L051:
1455                     ; 276     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1457  034a 0d04          	tnz	(OFST+2,sp)
1458  034c 2706          	jreq	L451
1459  034e 7b04          	ld	a,(OFST+2,sp)
1460  0350 a144          	cp	a,#68
1461  0352 2603          	jrne	L251
1462  0354               L451:
1463  0354 4f            	clr	a
1464  0355 2010          	jra	L651
1465  0357               L251:
1466  0357 ae0114        	ldw	x,#276
1467  035a 89            	pushw	x
1468  035b ae0000        	ldw	x,#0
1469  035e 89            	pushw	x
1470  035f ae0000        	ldw	x,#L702
1471  0362 cd0000        	call	_assert_failed
1473  0365 5b04          	addw	sp,#4
1474  0367               L651:
1475                     ; 277     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1477  0367 7b07          	ld	a,(OFST+5,sp)
1478  0369 a101          	cp	a,#1
1479  036b 270c          	jreq	L261
1480  036d 7b07          	ld	a,(OFST+5,sp)
1481  036f a102          	cp	a,#2
1482  0371 2706          	jreq	L261
1483  0373 7b07          	ld	a,(OFST+5,sp)
1484  0375 a103          	cp	a,#3
1485  0377 2603          	jrne	L061
1486  0379               L261:
1487  0379 4f            	clr	a
1488  037a 2010          	jra	L461
1489  037c               L061:
1490  037c ae0115        	ldw	x,#277
1491  037f 89            	pushw	x
1492  0380 ae0000        	ldw	x,#0
1493  0383 89            	pushw	x
1494  0384 ae0000        	ldw	x,#L702
1495  0387 cd0000        	call	_assert_failed
1497  038a 5b04          	addw	sp,#4
1498  038c               L461:
1499                     ; 278     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1501  038c 0d08          	tnz	(OFST+6,sp)
1502  038e 2712          	jreq	L071
1503  0390 7b08          	ld	a,(OFST+6,sp)
1504  0392 a104          	cp	a,#4
1505  0394 270c          	jreq	L071
1506  0396 7b08          	ld	a,(OFST+6,sp)
1507  0398 a108          	cp	a,#8
1508  039a 2706          	jreq	L071
1509  039c 7b08          	ld	a,(OFST+6,sp)
1510  039e a10c          	cp	a,#12
1511  03a0 2603          	jrne	L661
1512  03a2               L071:
1513  03a2 4f            	clr	a
1514  03a3 2010          	jra	L271
1515  03a5               L661:
1516  03a5 ae0116        	ldw	x,#278
1517  03a8 89            	pushw	x
1518  03a9 ae0000        	ldw	x,#0
1519  03ac 89            	pushw	x
1520  03ad ae0000        	ldw	x,#L702
1521  03b0 cd0000        	call	_assert_failed
1523  03b3 5b04          	addw	sp,#4
1524  03b5               L271:
1525                     ; 281     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1527  03b5 7b04          	ld	a,(OFST+2,sp)
1528  03b7 a144          	cp	a,#68
1529  03b9 2706          	jreq	L164
1530                     ; 283         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1532  03bb a644          	ld	a,#68
1533  03bd 6b01          	ld	(OFST-1,sp),a
1535  03bf 2002          	jra	L364
1536  03c1               L164:
1537                     ; 287         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1539  03c1 0f01          	clr	(OFST-1,sp)
1540  03c3               L364:
1541                     ; 291     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1543  03c3 7b07          	ld	a,(OFST+5,sp)
1544  03c5 a101          	cp	a,#1
1545  03c7 2606          	jrne	L564
1546                     ; 293         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1548  03c9 a602          	ld	a,#2
1549  03cb 6b02          	ld	(OFST+0,sp),a
1551  03cd 2004          	jra	L764
1552  03cf               L564:
1553                     ; 297         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1555  03cf a601          	ld	a,#1
1556  03d1 6b02          	ld	(OFST+0,sp),a
1557  03d3               L764:
1558                     ; 300     if (TIM2_Channel == TIM2_CHANNEL_1)
1560  03d3 0d03          	tnz	(OFST+1,sp)
1561  03d5 2626          	jrne	L174
1562                     ; 303         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1562                     ; 304                    (uint8_t)TIM2_ICFilter);
1564  03d7 7b09          	ld	a,(OFST+7,sp)
1565  03d9 88            	push	a
1566  03da 7b08          	ld	a,(OFST+6,sp)
1567  03dc 97            	ld	xl,a
1568  03dd 7b05          	ld	a,(OFST+3,sp)
1569  03df 95            	ld	xh,a
1570  03e0 cd0ad3        	call	L3_TI1_Config
1572  03e3 84            	pop	a
1573                     ; 307         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1575  03e4 7b08          	ld	a,(OFST+6,sp)
1576  03e6 cd08c3        	call	_TIM2_SetIC1Prescaler
1578                     ; 310         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1580  03e9 7b09          	ld	a,(OFST+7,sp)
1581  03eb 88            	push	a
1582  03ec 7b03          	ld	a,(OFST+1,sp)
1583  03ee 97            	ld	xl,a
1584  03ef 7b02          	ld	a,(OFST+0,sp)
1585  03f1 95            	ld	xh,a
1586  03f2 cd0b03        	call	L5_TI2_Config
1588  03f5 84            	pop	a
1589                     ; 313         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1591  03f6 7b08          	ld	a,(OFST+6,sp)
1592  03f8 cd08f2        	call	_TIM2_SetIC2Prescaler
1595  03fb 2024          	jra	L374
1596  03fd               L174:
1597                     ; 318         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1597                     ; 319                    (uint8_t)TIM2_ICFilter);
1599  03fd 7b09          	ld	a,(OFST+7,sp)
1600  03ff 88            	push	a
1601  0400 7b08          	ld	a,(OFST+6,sp)
1602  0402 97            	ld	xl,a
1603  0403 7b05          	ld	a,(OFST+3,sp)
1604  0405 95            	ld	xh,a
1605  0406 cd0b03        	call	L5_TI2_Config
1607  0409 84            	pop	a
1608                     ; 322         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1610  040a 7b08          	ld	a,(OFST+6,sp)
1611  040c cd08f2        	call	_TIM2_SetIC2Prescaler
1613                     ; 325         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1615  040f 7b09          	ld	a,(OFST+7,sp)
1616  0411 88            	push	a
1617  0412 7b03          	ld	a,(OFST+1,sp)
1618  0414 97            	ld	xl,a
1619  0415 7b02          	ld	a,(OFST+0,sp)
1620  0417 95            	ld	xh,a
1621  0418 cd0ad3        	call	L3_TI1_Config
1623  041b 84            	pop	a
1624                     ; 328         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1626  041c 7b08          	ld	a,(OFST+6,sp)
1627  041e cd08c3        	call	_TIM2_SetIC1Prescaler
1629  0421               L374:
1630                     ; 330 }
1633  0421 5b04          	addw	sp,#4
1634  0423 81            	ret
1690                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1690                     ; 340 {
1691                     	switch	.text
1692  0424               _TIM2_Cmd:
1694  0424 88            	push	a
1695       00000000      OFST:	set	0
1698                     ; 342     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1700  0425 4d            	tnz	a
1701  0426 2704          	jreq	L002
1702  0428 a101          	cp	a,#1
1703  042a 2603          	jrne	L671
1704  042c               L002:
1705  042c 4f            	clr	a
1706  042d 2010          	jra	L202
1707  042f               L671:
1708  042f ae0156        	ldw	x,#342
1709  0432 89            	pushw	x
1710  0433 ae0000        	ldw	x,#0
1711  0436 89            	pushw	x
1712  0437 ae0000        	ldw	x,#L702
1713  043a cd0000        	call	_assert_failed
1715  043d 5b04          	addw	sp,#4
1716  043f               L202:
1717                     ; 345     if (NewState != DISABLE)
1719  043f 0d01          	tnz	(OFST+1,sp)
1720  0441 2706          	jreq	L325
1721                     ; 347         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1723  0443 72105300      	bset	21248,#0
1725  0447 2004          	jra	L525
1726  0449               L325:
1727                     ; 351         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1729  0449 72115300      	bres	21248,#0
1730  044d               L525:
1731                     ; 353 }
1734  044d 84            	pop	a
1735  044e 81            	ret
1815                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1815                     ; 370 {
1816                     	switch	.text
1817  044f               _TIM2_ITConfig:
1819  044f 89            	pushw	x
1820       00000000      OFST:	set	0
1823                     ; 372     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1825  0450 9e            	ld	a,xh
1826  0451 4d            	tnz	a
1827  0452 2708          	jreq	L602
1828  0454 9e            	ld	a,xh
1829  0455 a110          	cp	a,#16
1830  0457 2403          	jruge	L602
1831  0459 4f            	clr	a
1832  045a 2010          	jra	L012
1833  045c               L602:
1834  045c ae0174        	ldw	x,#372
1835  045f 89            	pushw	x
1836  0460 ae0000        	ldw	x,#0
1837  0463 89            	pushw	x
1838  0464 ae0000        	ldw	x,#L702
1839  0467 cd0000        	call	_assert_failed
1841  046a 5b04          	addw	sp,#4
1842  046c               L012:
1843                     ; 373     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1845  046c 0d02          	tnz	(OFST+2,sp)
1846  046e 2706          	jreq	L412
1847  0470 7b02          	ld	a,(OFST+2,sp)
1848  0472 a101          	cp	a,#1
1849  0474 2603          	jrne	L212
1850  0476               L412:
1851  0476 4f            	clr	a
1852  0477 2010          	jra	L612
1853  0479               L212:
1854  0479 ae0175        	ldw	x,#373
1855  047c 89            	pushw	x
1856  047d ae0000        	ldw	x,#0
1857  0480 89            	pushw	x
1858  0481 ae0000        	ldw	x,#L702
1859  0484 cd0000        	call	_assert_failed
1861  0487 5b04          	addw	sp,#4
1862  0489               L612:
1863                     ; 375     if (NewState != DISABLE)
1865  0489 0d02          	tnz	(OFST+2,sp)
1866  048b 270a          	jreq	L565
1867                     ; 378         TIM2->IER |= (uint8_t)TIM2_IT;
1869  048d c65303        	ld	a,21251
1870  0490 1a01          	or	a,(OFST+1,sp)
1871  0492 c75303        	ld	21251,a
1873  0495 2009          	jra	L765
1874  0497               L565:
1875                     ; 383         TIM2->IER &= (uint8_t)(~TIM2_IT);
1877  0497 7b01          	ld	a,(OFST+1,sp)
1878  0499 43            	cpl	a
1879  049a c45303        	and	a,21251
1880  049d c75303        	ld	21251,a
1881  04a0               L765:
1882                     ; 385 }
1885  04a0 85            	popw	x
1886  04a1 81            	ret
1923                     ; 394 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1923                     ; 395 {
1924                     	switch	.text
1925  04a2               _TIM2_UpdateDisableConfig:
1927  04a2 88            	push	a
1928       00000000      OFST:	set	0
1931                     ; 397     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1933  04a3 4d            	tnz	a
1934  04a4 2704          	jreq	L422
1935  04a6 a101          	cp	a,#1
1936  04a8 2603          	jrne	L222
1937  04aa               L422:
1938  04aa 4f            	clr	a
1939  04ab 2010          	jra	L622
1940  04ad               L222:
1941  04ad ae018d        	ldw	x,#397
1942  04b0 89            	pushw	x
1943  04b1 ae0000        	ldw	x,#0
1944  04b4 89            	pushw	x
1945  04b5 ae0000        	ldw	x,#L702
1946  04b8 cd0000        	call	_assert_failed
1948  04bb 5b04          	addw	sp,#4
1949  04bd               L622:
1950                     ; 400     if (NewState != DISABLE)
1952  04bd 0d01          	tnz	(OFST+1,sp)
1953  04bf 2706          	jreq	L706
1954                     ; 402         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1956  04c1 72125300      	bset	21248,#1
1958  04c5 2004          	jra	L116
1959  04c7               L706:
1960                     ; 406         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1962  04c7 72135300      	bres	21248,#1
1963  04cb               L116:
1964                     ; 408 }
1967  04cb 84            	pop	a
1968  04cc 81            	ret
2027                     ; 418 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2027                     ; 419 {
2028                     	switch	.text
2029  04cd               _TIM2_UpdateRequestConfig:
2031  04cd 88            	push	a
2032       00000000      OFST:	set	0
2035                     ; 421     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
2037  04ce 4d            	tnz	a
2038  04cf 2704          	jreq	L432
2039  04d1 a101          	cp	a,#1
2040  04d3 2603          	jrne	L232
2041  04d5               L432:
2042  04d5 4f            	clr	a
2043  04d6 2010          	jra	L632
2044  04d8               L232:
2045  04d8 ae01a5        	ldw	x,#421
2046  04db 89            	pushw	x
2047  04dc ae0000        	ldw	x,#0
2048  04df 89            	pushw	x
2049  04e0 ae0000        	ldw	x,#L702
2050  04e3 cd0000        	call	_assert_failed
2052  04e6 5b04          	addw	sp,#4
2053  04e8               L632:
2054                     ; 424     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
2056  04e8 0d01          	tnz	(OFST+1,sp)
2057  04ea 2706          	jreq	L146
2058                     ; 426         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
2060  04ec 72145300      	bset	21248,#2
2062  04f0 2004          	jra	L346
2063  04f2               L146:
2064                     ; 430         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
2066  04f2 72155300      	bres	21248,#2
2067  04f6               L346:
2068                     ; 432 }
2071  04f6 84            	pop	a
2072  04f7 81            	ret
2130                     ; 443 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2130                     ; 444 {
2131                     	switch	.text
2132  04f8               _TIM2_SelectOnePulseMode:
2134  04f8 88            	push	a
2135       00000000      OFST:	set	0
2138                     ; 446     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
2140  04f9 a101          	cp	a,#1
2141  04fb 2703          	jreq	L442
2142  04fd 4d            	tnz	a
2143  04fe 2603          	jrne	L242
2144  0500               L442:
2145  0500 4f            	clr	a
2146  0501 2010          	jra	L642
2147  0503               L242:
2148  0503 ae01be        	ldw	x,#446
2149  0506 89            	pushw	x
2150  0507 ae0000        	ldw	x,#0
2151  050a 89            	pushw	x
2152  050b ae0000        	ldw	x,#L702
2153  050e cd0000        	call	_assert_failed
2155  0511 5b04          	addw	sp,#4
2156  0513               L642:
2157                     ; 449     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
2159  0513 0d01          	tnz	(OFST+1,sp)
2160  0515 2706          	jreq	L376
2161                     ; 451         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
2163  0517 72165300      	bset	21248,#3
2165  051b 2004          	jra	L576
2166  051d               L376:
2167                     ; 455         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
2169  051d 72175300      	bres	21248,#3
2170  0521               L576:
2171                     ; 458 }
2174  0521 84            	pop	a
2175  0522 81            	ret
2244                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2244                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2244                     ; 491 {
2245                     	switch	.text
2246  0523               _TIM2_PrescalerConfig:
2248  0523 89            	pushw	x
2249       00000000      OFST:	set	0
2252                     ; 493     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2254  0524 9f            	ld	a,xl
2255  0525 4d            	tnz	a
2256  0526 2705          	jreq	L452
2257  0528 9f            	ld	a,xl
2258  0529 a101          	cp	a,#1
2259  052b 2603          	jrne	L252
2260  052d               L452:
2261  052d 4f            	clr	a
2262  052e 2010          	jra	L652
2263  0530               L252:
2264  0530 ae01ed        	ldw	x,#493
2265  0533 89            	pushw	x
2266  0534 ae0000        	ldw	x,#0
2267  0537 89            	pushw	x
2268  0538 ae0000        	ldw	x,#L702
2269  053b cd0000        	call	_assert_failed
2271  053e 5b04          	addw	sp,#4
2272  0540               L652:
2273                     ; 494     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2275  0540 0d01          	tnz	(OFST+1,sp)
2276  0542 275a          	jreq	L262
2277  0544 7b01          	ld	a,(OFST+1,sp)
2278  0546 a101          	cp	a,#1
2279  0548 2754          	jreq	L262
2280  054a 7b01          	ld	a,(OFST+1,sp)
2281  054c a102          	cp	a,#2
2282  054e 274e          	jreq	L262
2283  0550 7b01          	ld	a,(OFST+1,sp)
2284  0552 a103          	cp	a,#3
2285  0554 2748          	jreq	L262
2286  0556 7b01          	ld	a,(OFST+1,sp)
2287  0558 a104          	cp	a,#4
2288  055a 2742          	jreq	L262
2289  055c 7b01          	ld	a,(OFST+1,sp)
2290  055e a105          	cp	a,#5
2291  0560 273c          	jreq	L262
2292  0562 7b01          	ld	a,(OFST+1,sp)
2293  0564 a106          	cp	a,#6
2294  0566 2736          	jreq	L262
2295  0568 7b01          	ld	a,(OFST+1,sp)
2296  056a a107          	cp	a,#7
2297  056c 2730          	jreq	L262
2298  056e 7b01          	ld	a,(OFST+1,sp)
2299  0570 a108          	cp	a,#8
2300  0572 272a          	jreq	L262
2301  0574 7b01          	ld	a,(OFST+1,sp)
2302  0576 a109          	cp	a,#9
2303  0578 2724          	jreq	L262
2304  057a 7b01          	ld	a,(OFST+1,sp)
2305  057c a10a          	cp	a,#10
2306  057e 271e          	jreq	L262
2307  0580 7b01          	ld	a,(OFST+1,sp)
2308  0582 a10b          	cp	a,#11
2309  0584 2718          	jreq	L262
2310  0586 7b01          	ld	a,(OFST+1,sp)
2311  0588 a10c          	cp	a,#12
2312  058a 2712          	jreq	L262
2313  058c 7b01          	ld	a,(OFST+1,sp)
2314  058e a10d          	cp	a,#13
2315  0590 270c          	jreq	L262
2316  0592 7b01          	ld	a,(OFST+1,sp)
2317  0594 a10e          	cp	a,#14
2318  0596 2706          	jreq	L262
2319  0598 7b01          	ld	a,(OFST+1,sp)
2320  059a a10f          	cp	a,#15
2321  059c 2603          	jrne	L062
2322  059e               L262:
2323  059e 4f            	clr	a
2324  059f 2010          	jra	L462
2325  05a1               L062:
2326  05a1 ae01ee        	ldw	x,#494
2327  05a4 89            	pushw	x
2328  05a5 ae0000        	ldw	x,#0
2329  05a8 89            	pushw	x
2330  05a9 ae0000        	ldw	x,#L702
2331  05ac cd0000        	call	_assert_failed
2333  05af 5b04          	addw	sp,#4
2334  05b1               L462:
2335                     ; 497     TIM2->PSCR = (uint8_t)Prescaler;
2337  05b1 7b01          	ld	a,(OFST+1,sp)
2338  05b3 c7530e        	ld	21262,a
2339                     ; 500     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2341  05b6 7b02          	ld	a,(OFST+2,sp)
2342  05b8 c75306        	ld	21254,a
2343                     ; 501 }
2346  05bb 85            	popw	x
2347  05bc 81            	ret
2406                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2406                     ; 513 {
2407                     	switch	.text
2408  05bd               _TIM2_ForcedOC1Config:
2410  05bd 88            	push	a
2411       00000000      OFST:	set	0
2414                     ; 515     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2416  05be a150          	cp	a,#80
2417  05c0 2704          	jreq	L272
2418  05c2 a140          	cp	a,#64
2419  05c4 2603          	jrne	L072
2420  05c6               L272:
2421  05c6 4f            	clr	a
2422  05c7 2010          	jra	L472
2423  05c9               L072:
2424  05c9 ae0203        	ldw	x,#515
2425  05cc 89            	pushw	x
2426  05cd ae0000        	ldw	x,#0
2427  05d0 89            	pushw	x
2428  05d1 ae0000        	ldw	x,#L702
2429  05d4 cd0000        	call	_assert_failed
2431  05d7 5b04          	addw	sp,#4
2432  05d9               L472:
2433                     ; 518     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2433                     ; 519                               | (uint8_t)TIM2_ForcedAction);
2435  05d9 c65307        	ld	a,21255
2436  05dc a48f          	and	a,#143
2437  05de 1a01          	or	a,(OFST+1,sp)
2438  05e0 c75307        	ld	21255,a
2439                     ; 520 }
2442  05e3 84            	pop	a
2443  05e4 81            	ret
2480                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2480                     ; 532 {
2481                     	switch	.text
2482  05e5               _TIM2_ForcedOC2Config:
2484  05e5 88            	push	a
2485       00000000      OFST:	set	0
2488                     ; 534     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2490  05e6 a150          	cp	a,#80
2491  05e8 2704          	jreq	L203
2492  05ea a140          	cp	a,#64
2493  05ec 2603          	jrne	L003
2494  05ee               L203:
2495  05ee 4f            	clr	a
2496  05ef 2010          	jra	L403
2497  05f1               L003:
2498  05f1 ae0216        	ldw	x,#534
2499  05f4 89            	pushw	x
2500  05f5 ae0000        	ldw	x,#0
2501  05f8 89            	pushw	x
2502  05f9 ae0000        	ldw	x,#L702
2503  05fc cd0000        	call	_assert_failed
2505  05ff 5b04          	addw	sp,#4
2506  0601               L403:
2507                     ; 537     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2507                     ; 538                             | (uint8_t)TIM2_ForcedAction);
2509  0601 c65308        	ld	a,21256
2510  0604 a48f          	and	a,#143
2511  0606 1a01          	or	a,(OFST+1,sp)
2512  0608 c75308        	ld	21256,a
2513                     ; 539 }
2516  060b 84            	pop	a
2517  060c 81            	ret
2554                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2554                     ; 551 {
2555                     	switch	.text
2556  060d               _TIM2_ForcedOC3Config:
2558  060d 88            	push	a
2559       00000000      OFST:	set	0
2562                     ; 553     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2564  060e a150          	cp	a,#80
2565  0610 2704          	jreq	L213
2566  0612 a140          	cp	a,#64
2567  0614 2603          	jrne	L013
2568  0616               L213:
2569  0616 4f            	clr	a
2570  0617 2010          	jra	L413
2571  0619               L013:
2572  0619 ae0229        	ldw	x,#553
2573  061c 89            	pushw	x
2574  061d ae0000        	ldw	x,#0
2575  0620 89            	pushw	x
2576  0621 ae0000        	ldw	x,#L702
2577  0624 cd0000        	call	_assert_failed
2579  0627 5b04          	addw	sp,#4
2580  0629               L413:
2581                     ; 556     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2581                     ; 557                               | (uint8_t)TIM2_ForcedAction);
2583  0629 c65309        	ld	a,21257
2584  062c a48f          	and	a,#143
2585  062e 1a01          	or	a,(OFST+1,sp)
2586  0630 c75309        	ld	21257,a
2587                     ; 558 }
2590  0633 84            	pop	a
2591  0634 81            	ret
2628                     ; 567 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2628                     ; 568 {
2629                     	switch	.text
2630  0635               _TIM2_ARRPreloadConfig:
2632  0635 88            	push	a
2633       00000000      OFST:	set	0
2636                     ; 570     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2638  0636 4d            	tnz	a
2639  0637 2704          	jreq	L223
2640  0639 a101          	cp	a,#1
2641  063b 2603          	jrne	L023
2642  063d               L223:
2643  063d 4f            	clr	a
2644  063e 2010          	jra	L423
2645  0640               L023:
2646  0640 ae023a        	ldw	x,#570
2647  0643 89            	pushw	x
2648  0644 ae0000        	ldw	x,#0
2649  0647 89            	pushw	x
2650  0648 ae0000        	ldw	x,#L702
2651  064b cd0000        	call	_assert_failed
2653  064e 5b04          	addw	sp,#4
2654  0650               L423:
2655                     ; 573     if (NewState != DISABLE)
2657  0650 0d01          	tnz	(OFST+1,sp)
2658  0652 2706          	jreq	L1301
2659                     ; 575         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2661  0654 721e5300      	bset	21248,#7
2663  0658 2004          	jra	L3301
2664  065a               L1301:
2665                     ; 579         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2667  065a 721f5300      	bres	21248,#7
2668  065e               L3301:
2669                     ; 581 }
2672  065e 84            	pop	a
2673  065f 81            	ret
2710                     ; 590 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2710                     ; 591 {
2711                     	switch	.text
2712  0660               _TIM2_OC1PreloadConfig:
2714  0660 88            	push	a
2715       00000000      OFST:	set	0
2718                     ; 593     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2720  0661 4d            	tnz	a
2721  0662 2704          	jreq	L233
2722  0664 a101          	cp	a,#1
2723  0666 2603          	jrne	L033
2724  0668               L233:
2725  0668 4f            	clr	a
2726  0669 2010          	jra	L433
2727  066b               L033:
2728  066b ae0251        	ldw	x,#593
2729  066e 89            	pushw	x
2730  066f ae0000        	ldw	x,#0
2731  0672 89            	pushw	x
2732  0673 ae0000        	ldw	x,#L702
2733  0676 cd0000        	call	_assert_failed
2735  0679 5b04          	addw	sp,#4
2736  067b               L433:
2737                     ; 596     if (NewState != DISABLE)
2739  067b 0d01          	tnz	(OFST+1,sp)
2740  067d 2706          	jreq	L3501
2741                     ; 598         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2743  067f 72165307      	bset	21255,#3
2745  0683 2004          	jra	L5501
2746  0685               L3501:
2747                     ; 602         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2749  0685 72175307      	bres	21255,#3
2750  0689               L5501:
2751                     ; 604 }
2754  0689 84            	pop	a
2755  068a 81            	ret
2792                     ; 613 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2792                     ; 614 {
2793                     	switch	.text
2794  068b               _TIM2_OC2PreloadConfig:
2796  068b 88            	push	a
2797       00000000      OFST:	set	0
2800                     ; 616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2802  068c 4d            	tnz	a
2803  068d 2704          	jreq	L243
2804  068f a101          	cp	a,#1
2805  0691 2603          	jrne	L043
2806  0693               L243:
2807  0693 4f            	clr	a
2808  0694 2010          	jra	L443
2809  0696               L043:
2810  0696 ae0268        	ldw	x,#616
2811  0699 89            	pushw	x
2812  069a ae0000        	ldw	x,#0
2813  069d 89            	pushw	x
2814  069e ae0000        	ldw	x,#L702
2815  06a1 cd0000        	call	_assert_failed
2817  06a4 5b04          	addw	sp,#4
2818  06a6               L443:
2819                     ; 619     if (NewState != DISABLE)
2821  06a6 0d01          	tnz	(OFST+1,sp)
2822  06a8 2706          	jreq	L5701
2823                     ; 621         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2825  06aa 72165308      	bset	21256,#3
2827  06ae 2004          	jra	L7701
2828  06b0               L5701:
2829                     ; 625         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2831  06b0 72175308      	bres	21256,#3
2832  06b4               L7701:
2833                     ; 627 }
2836  06b4 84            	pop	a
2837  06b5 81            	ret
2874                     ; 636 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2874                     ; 637 {
2875                     	switch	.text
2876  06b6               _TIM2_OC3PreloadConfig:
2878  06b6 88            	push	a
2879       00000000      OFST:	set	0
2882                     ; 639     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2884  06b7 4d            	tnz	a
2885  06b8 2704          	jreq	L253
2886  06ba a101          	cp	a,#1
2887  06bc 2603          	jrne	L053
2888  06be               L253:
2889  06be 4f            	clr	a
2890  06bf 2010          	jra	L453
2891  06c1               L053:
2892  06c1 ae027f        	ldw	x,#639
2893  06c4 89            	pushw	x
2894  06c5 ae0000        	ldw	x,#0
2895  06c8 89            	pushw	x
2896  06c9 ae0000        	ldw	x,#L702
2897  06cc cd0000        	call	_assert_failed
2899  06cf 5b04          	addw	sp,#4
2900  06d1               L453:
2901                     ; 642     if (NewState != DISABLE)
2903  06d1 0d01          	tnz	(OFST+1,sp)
2904  06d3 2706          	jreq	L7111
2905                     ; 644         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2907  06d5 72165309      	bset	21257,#3
2909  06d9 2004          	jra	L1211
2910  06db               L7111:
2911                     ; 648         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2913  06db 72175309      	bres	21257,#3
2914  06df               L1211:
2915                     ; 650 }
2918  06df 84            	pop	a
2919  06e0 81            	ret
2993                     ; 663 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2993                     ; 664 {
2994                     	switch	.text
2995  06e1               _TIM2_GenerateEvent:
2997  06e1 88            	push	a
2998       00000000      OFST:	set	0
3001                     ; 666     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
3003  06e2 4d            	tnz	a
3004  06e3 2703          	jreq	L063
3005  06e5 4f            	clr	a
3006  06e6 2010          	jra	L263
3007  06e8               L063:
3008  06e8 ae029a        	ldw	x,#666
3009  06eb 89            	pushw	x
3010  06ec ae0000        	ldw	x,#0
3011  06ef 89            	pushw	x
3012  06f0 ae0000        	ldw	x,#L702
3013  06f3 cd0000        	call	_assert_failed
3015  06f6 5b04          	addw	sp,#4
3016  06f8               L263:
3017                     ; 669     TIM2->EGR = (uint8_t)TIM2_EventSource;
3019  06f8 7b01          	ld	a,(OFST+1,sp)
3020  06fa c75306        	ld	21254,a
3021                     ; 670 }
3024  06fd 84            	pop	a
3025  06fe 81            	ret
3062                     ; 681 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3062                     ; 682 {
3063                     	switch	.text
3064  06ff               _TIM2_OC1PolarityConfig:
3066  06ff 88            	push	a
3067       00000000      OFST:	set	0
3070                     ; 684     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3072  0700 4d            	tnz	a
3073  0701 2704          	jreq	L073
3074  0703 a122          	cp	a,#34
3075  0705 2603          	jrne	L663
3076  0707               L073:
3077  0707 4f            	clr	a
3078  0708 2010          	jra	L273
3079  070a               L663:
3080  070a ae02ac        	ldw	x,#684
3081  070d 89            	pushw	x
3082  070e ae0000        	ldw	x,#0
3083  0711 89            	pushw	x
3084  0712 ae0000        	ldw	x,#L702
3085  0715 cd0000        	call	_assert_failed
3087  0718 5b04          	addw	sp,#4
3088  071a               L273:
3089                     ; 687     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3091  071a 0d01          	tnz	(OFST+1,sp)
3092  071c 2706          	jreq	L3711
3093                     ; 689         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
3095  071e 7212530a      	bset	21258,#1
3097  0722 2004          	jra	L5711
3098  0724               L3711:
3099                     ; 693         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3101  0724 7213530a      	bres	21258,#1
3102  0728               L5711:
3103                     ; 695 }
3106  0728 84            	pop	a
3107  0729 81            	ret
3144                     ; 706 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3144                     ; 707 {
3145                     	switch	.text
3146  072a               _TIM2_OC2PolarityConfig:
3148  072a 88            	push	a
3149       00000000      OFST:	set	0
3152                     ; 709     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3154  072b 4d            	tnz	a
3155  072c 2704          	jreq	L004
3156  072e a122          	cp	a,#34
3157  0730 2603          	jrne	L673
3158  0732               L004:
3159  0732 4f            	clr	a
3160  0733 2010          	jra	L204
3161  0735               L673:
3162  0735 ae02c5        	ldw	x,#709
3163  0738 89            	pushw	x
3164  0739 ae0000        	ldw	x,#0
3165  073c 89            	pushw	x
3166  073d ae0000        	ldw	x,#L702
3167  0740 cd0000        	call	_assert_failed
3169  0743 5b04          	addw	sp,#4
3170  0745               L204:
3171                     ; 712     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3173  0745 0d01          	tnz	(OFST+1,sp)
3174  0747 2706          	jreq	L5121
3175                     ; 714         TIM2->CCER1 |= TIM2_CCER1_CC2P;
3177  0749 721a530a      	bset	21258,#5
3179  074d 2004          	jra	L7121
3180  074f               L5121:
3181                     ; 718         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
3183  074f 721b530a      	bres	21258,#5
3184  0753               L7121:
3185                     ; 720 }
3188  0753 84            	pop	a
3189  0754 81            	ret
3226                     ; 731 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3226                     ; 732 {
3227                     	switch	.text
3228  0755               _TIM2_OC3PolarityConfig:
3230  0755 88            	push	a
3231       00000000      OFST:	set	0
3234                     ; 734     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3236  0756 4d            	tnz	a
3237  0757 2704          	jreq	L014
3238  0759 a122          	cp	a,#34
3239  075b 2603          	jrne	L604
3240  075d               L014:
3241  075d 4f            	clr	a
3242  075e 2010          	jra	L214
3243  0760               L604:
3244  0760 ae02de        	ldw	x,#734
3245  0763 89            	pushw	x
3246  0764 ae0000        	ldw	x,#0
3247  0767 89            	pushw	x
3248  0768 ae0000        	ldw	x,#L702
3249  076b cd0000        	call	_assert_failed
3251  076e 5b04          	addw	sp,#4
3252  0770               L214:
3253                     ; 737     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3255  0770 0d01          	tnz	(OFST+1,sp)
3256  0772 2706          	jreq	L7321
3257                     ; 739         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3259  0774 7212530b      	bset	21259,#1
3261  0778 2004          	jra	L1421
3262  077a               L7321:
3263                     ; 743         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3265  077a 7213530b      	bres	21259,#1
3266  077e               L1421:
3267                     ; 745 }
3270  077e 84            	pop	a
3271  077f 81            	ret
3317                     ; 759 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3317                     ; 760 {
3318                     	switch	.text
3319  0780               _TIM2_CCxCmd:
3321  0780 89            	pushw	x
3322       00000000      OFST:	set	0
3325                     ; 762     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3327  0781 9e            	ld	a,xh
3328  0782 4d            	tnz	a
3329  0783 270a          	jreq	L024
3330  0785 9e            	ld	a,xh
3331  0786 a101          	cp	a,#1
3332  0788 2705          	jreq	L024
3333  078a 9e            	ld	a,xh
3334  078b a102          	cp	a,#2
3335  078d 2603          	jrne	L614
3336  078f               L024:
3337  078f 4f            	clr	a
3338  0790 2010          	jra	L224
3339  0792               L614:
3340  0792 ae02fa        	ldw	x,#762
3341  0795 89            	pushw	x
3342  0796 ae0000        	ldw	x,#0
3343  0799 89            	pushw	x
3344  079a ae0000        	ldw	x,#L702
3345  079d cd0000        	call	_assert_failed
3347  07a0 5b04          	addw	sp,#4
3348  07a2               L224:
3349                     ; 763     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3351  07a2 0d02          	tnz	(OFST+2,sp)
3352  07a4 2706          	jreq	L624
3353  07a6 7b02          	ld	a,(OFST+2,sp)
3354  07a8 a101          	cp	a,#1
3355  07aa 2603          	jrne	L424
3356  07ac               L624:
3357  07ac 4f            	clr	a
3358  07ad 2010          	jra	L034
3359  07af               L424:
3360  07af ae02fb        	ldw	x,#763
3361  07b2 89            	pushw	x
3362  07b3 ae0000        	ldw	x,#0
3363  07b6 89            	pushw	x
3364  07b7 ae0000        	ldw	x,#L702
3365  07ba cd0000        	call	_assert_failed
3367  07bd 5b04          	addw	sp,#4
3368  07bf               L034:
3369                     ; 765     if (TIM2_Channel == TIM2_CHANNEL_1)
3371  07bf 0d01          	tnz	(OFST+1,sp)
3372  07c1 2610          	jrne	L5621
3373                     ; 768         if (NewState != DISABLE)
3375  07c3 0d02          	tnz	(OFST+2,sp)
3376  07c5 2706          	jreq	L7621
3377                     ; 770             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3379  07c7 7210530a      	bset	21258,#0
3381  07cb 202a          	jra	L3721
3382  07cd               L7621:
3383                     ; 774             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3385  07cd 7211530a      	bres	21258,#0
3386  07d1 2024          	jra	L3721
3387  07d3               L5621:
3388                     ; 778     else if (TIM2_Channel == TIM2_CHANNEL_2)
3390  07d3 7b01          	ld	a,(OFST+1,sp)
3391  07d5 a101          	cp	a,#1
3392  07d7 2610          	jrne	L5721
3393                     ; 781         if (NewState != DISABLE)
3395  07d9 0d02          	tnz	(OFST+2,sp)
3396  07db 2706          	jreq	L7721
3397                     ; 783             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3399  07dd 7218530a      	bset	21258,#4
3401  07e1 2014          	jra	L3721
3402  07e3               L7721:
3403                     ; 787             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3405  07e3 7219530a      	bres	21258,#4
3406  07e7 200e          	jra	L3721
3407  07e9               L5721:
3408                     ; 793         if (NewState != DISABLE)
3410  07e9 0d02          	tnz	(OFST+2,sp)
3411  07eb 2706          	jreq	L5031
3412                     ; 795             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3414  07ed 7210530b      	bset	21259,#0
3416  07f1 2004          	jra	L3721
3417  07f3               L5031:
3418                     ; 799             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3420  07f3 7211530b      	bres	21259,#0
3421  07f7               L3721:
3422                     ; 802 }
3425  07f7 85            	popw	x
3426  07f8 81            	ret
3472                     ; 824 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3472                     ; 825 {
3473                     	switch	.text
3474  07f9               _TIM2_SelectOCxM:
3476  07f9 89            	pushw	x
3477       00000000      OFST:	set	0
3480                     ; 827     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3482  07fa 9e            	ld	a,xh
3483  07fb 4d            	tnz	a
3484  07fc 270a          	jreq	L634
3485  07fe 9e            	ld	a,xh
3486  07ff a101          	cp	a,#1
3487  0801 2705          	jreq	L634
3488  0803 9e            	ld	a,xh
3489  0804 a102          	cp	a,#2
3490  0806 2603          	jrne	L434
3491  0808               L634:
3492  0808 4f            	clr	a
3493  0809 2010          	jra	L044
3494  080b               L434:
3495  080b ae033b        	ldw	x,#827
3496  080e 89            	pushw	x
3497  080f ae0000        	ldw	x,#0
3498  0812 89            	pushw	x
3499  0813 ae0000        	ldw	x,#L702
3500  0816 cd0000        	call	_assert_failed
3502  0819 5b04          	addw	sp,#4
3503  081b               L044:
3504                     ; 828     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3506  081b 0d02          	tnz	(OFST+2,sp)
3507  081d 272a          	jreq	L444
3508  081f 7b02          	ld	a,(OFST+2,sp)
3509  0821 a110          	cp	a,#16
3510  0823 2724          	jreq	L444
3511  0825 7b02          	ld	a,(OFST+2,sp)
3512  0827 a120          	cp	a,#32
3513  0829 271e          	jreq	L444
3514  082b 7b02          	ld	a,(OFST+2,sp)
3515  082d a130          	cp	a,#48
3516  082f 2718          	jreq	L444
3517  0831 7b02          	ld	a,(OFST+2,sp)
3518  0833 a160          	cp	a,#96
3519  0835 2712          	jreq	L444
3520  0837 7b02          	ld	a,(OFST+2,sp)
3521  0839 a170          	cp	a,#112
3522  083b 270c          	jreq	L444
3523  083d 7b02          	ld	a,(OFST+2,sp)
3524  083f a150          	cp	a,#80
3525  0841 2706          	jreq	L444
3526  0843 7b02          	ld	a,(OFST+2,sp)
3527  0845 a140          	cp	a,#64
3528  0847 2603          	jrne	L244
3529  0849               L444:
3530  0849 4f            	clr	a
3531  084a 2010          	jra	L644
3532  084c               L244:
3533  084c ae033c        	ldw	x,#828
3534  084f 89            	pushw	x
3535  0850 ae0000        	ldw	x,#0
3536  0853 89            	pushw	x
3537  0854 ae0000        	ldw	x,#L702
3538  0857 cd0000        	call	_assert_failed
3540  085a 5b04          	addw	sp,#4
3541  085c               L644:
3542                     ; 830     if (TIM2_Channel == TIM2_CHANNEL_1)
3544  085c 0d01          	tnz	(OFST+1,sp)
3545  085e 2610          	jrne	L3331
3546                     ; 833         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3548  0860 7211530a      	bres	21258,#0
3549                     ; 836         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3549                     ; 837                                | (uint8_t)TIM2_OCMode);
3551  0864 c65307        	ld	a,21255
3552  0867 a48f          	and	a,#143
3553  0869 1a02          	or	a,(OFST+2,sp)
3554  086b c75307        	ld	21255,a
3556  086e 2024          	jra	L5331
3557  0870               L3331:
3558                     ; 839     else if (TIM2_Channel == TIM2_CHANNEL_2)
3560  0870 7b01          	ld	a,(OFST+1,sp)
3561  0872 a101          	cp	a,#1
3562  0874 2610          	jrne	L7331
3563                     ; 842         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3565  0876 7219530a      	bres	21258,#4
3566                     ; 845         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3566                     ; 846                                 | (uint8_t)TIM2_OCMode);
3568  087a c65308        	ld	a,21256
3569  087d a48f          	and	a,#143
3570  087f 1a02          	or	a,(OFST+2,sp)
3571  0881 c75308        	ld	21256,a
3573  0884 200e          	jra	L5331
3574  0886               L7331:
3575                     ; 851         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3577  0886 7211530b      	bres	21259,#0
3578                     ; 854         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3578                     ; 855                                 | (uint8_t)TIM2_OCMode);
3580  088a c65309        	ld	a,21257
3581  088d a48f          	and	a,#143
3582  088f 1a02          	or	a,(OFST+2,sp)
3583  0891 c75309        	ld	21257,a
3584  0894               L5331:
3585                     ; 857 }
3588  0894 85            	popw	x
3589  0895 81            	ret
3623                     ; 866 void TIM2_SetCounter(uint16_t Counter)
3623                     ; 867 {
3624                     	switch	.text
3625  0896               _TIM2_SetCounter:
3629                     ; 869     TIM2->CNTRH = (uint8_t)(Counter >> 8);
3631  0896 9e            	ld	a,xh
3632  0897 c7530c        	ld	21260,a
3633                     ; 870     TIM2->CNTRL = (uint8_t)(Counter);
3635  089a 9f            	ld	a,xl
3636  089b c7530d        	ld	21261,a
3637                     ; 872 }
3640  089e 81            	ret
3674                     ; 881 void TIM2_SetAutoreload(uint16_t Autoreload)
3674                     ; 882 {
3675                     	switch	.text
3676  089f               _TIM2_SetAutoreload:
3680                     ; 885     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3682  089f 9e            	ld	a,xh
3683  08a0 c7530f        	ld	21263,a
3684                     ; 886     TIM2->ARRL = (uint8_t)(Autoreload);
3686  08a3 9f            	ld	a,xl
3687  08a4 c75310        	ld	21264,a
3688                     ; 888 }
3691  08a7 81            	ret
3725                     ; 897 void TIM2_SetCompare1(uint16_t Compare1)
3725                     ; 898 {
3726                     	switch	.text
3727  08a8               _TIM2_SetCompare1:
3731                     ; 900     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3733  08a8 9e            	ld	a,xh
3734  08a9 c75311        	ld	21265,a
3735                     ; 901     TIM2->CCR1L = (uint8_t)(Compare1);
3737  08ac 9f            	ld	a,xl
3738  08ad c75312        	ld	21266,a
3739                     ; 903 }
3742  08b0 81            	ret
3776                     ; 912 void TIM2_SetCompare2(uint16_t Compare2)
3776                     ; 913 {
3777                     	switch	.text
3778  08b1               _TIM2_SetCompare2:
3782                     ; 915     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3784  08b1 9e            	ld	a,xh
3785  08b2 c75313        	ld	21267,a
3786                     ; 916     TIM2->CCR2L = (uint8_t)(Compare2);
3788  08b5 9f            	ld	a,xl
3789  08b6 c75314        	ld	21268,a
3790                     ; 918 }
3793  08b9 81            	ret
3827                     ; 927 void TIM2_SetCompare3(uint16_t Compare3)
3827                     ; 928 {
3828                     	switch	.text
3829  08ba               _TIM2_SetCompare3:
3833                     ; 930     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3835  08ba 9e            	ld	a,xh
3836  08bb c75315        	ld	21269,a
3837                     ; 931     TIM2->CCR3L = (uint8_t)(Compare3);
3839  08be 9f            	ld	a,xl
3840  08bf c75316        	ld	21270,a
3841                     ; 933 }
3844  08c2 81            	ret
3881                     ; 946 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3881                     ; 947 {
3882                     	switch	.text
3883  08c3               _TIM2_SetIC1Prescaler:
3885  08c3 88            	push	a
3886       00000000      OFST:	set	0
3889                     ; 949     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3891  08c4 4d            	tnz	a
3892  08c5 270c          	jreq	L664
3893  08c7 a104          	cp	a,#4
3894  08c9 2708          	jreq	L664
3895  08cb a108          	cp	a,#8
3896  08cd 2704          	jreq	L664
3897  08cf a10c          	cp	a,#12
3898  08d1 2603          	jrne	L464
3899  08d3               L664:
3900  08d3 4f            	clr	a
3901  08d4 2010          	jra	L074
3902  08d6               L464:
3903  08d6 ae03b5        	ldw	x,#949
3904  08d9 89            	pushw	x
3905  08da ae0000        	ldw	x,#0
3906  08dd 89            	pushw	x
3907  08de ae0000        	ldw	x,#L702
3908  08e1 cd0000        	call	_assert_failed
3910  08e4 5b04          	addw	sp,#4
3911  08e6               L074:
3912                     ; 952     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3912                     ; 953                             | (uint8_t)TIM2_IC1Prescaler);
3914  08e6 c65307        	ld	a,21255
3915  08e9 a4f3          	and	a,#243
3916  08eb 1a01          	or	a,(OFST+1,sp)
3917  08ed c75307        	ld	21255,a
3918                     ; 954 }
3921  08f0 84            	pop	a
3922  08f1 81            	ret
3959                     ; 966 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3959                     ; 967 {
3960                     	switch	.text
3961  08f2               _TIM2_SetIC2Prescaler:
3963  08f2 88            	push	a
3964       00000000      OFST:	set	0
3967                     ; 969     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3969  08f3 4d            	tnz	a
3970  08f4 270c          	jreq	L674
3971  08f6 a104          	cp	a,#4
3972  08f8 2708          	jreq	L674
3973  08fa a108          	cp	a,#8
3974  08fc 2704          	jreq	L674
3975  08fe a10c          	cp	a,#12
3976  0900 2603          	jrne	L474
3977  0902               L674:
3978  0902 4f            	clr	a
3979  0903 2010          	jra	L005
3980  0905               L474:
3981  0905 ae03c9        	ldw	x,#969
3982  0908 89            	pushw	x
3983  0909 ae0000        	ldw	x,#0
3984  090c 89            	pushw	x
3985  090d ae0000        	ldw	x,#L702
3986  0910 cd0000        	call	_assert_failed
3988  0913 5b04          	addw	sp,#4
3989  0915               L005:
3990                     ; 972     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3990                     ; 973                             | (uint8_t)TIM2_IC2Prescaler);
3992  0915 c65308        	ld	a,21256
3993  0918 a4f3          	and	a,#243
3994  091a 1a01          	or	a,(OFST+1,sp)
3995  091c c75308        	ld	21256,a
3996                     ; 974 }
3999  091f 84            	pop	a
4000  0920 81            	ret
4037                     ; 986 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
4037                     ; 987 {
4038                     	switch	.text
4039  0921               _TIM2_SetIC3Prescaler:
4041  0921 88            	push	a
4042       00000000      OFST:	set	0
4045                     ; 990     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
4047  0922 4d            	tnz	a
4048  0923 270c          	jreq	L605
4049  0925 a104          	cp	a,#4
4050  0927 2708          	jreq	L605
4051  0929 a108          	cp	a,#8
4052  092b 2704          	jreq	L605
4053  092d a10c          	cp	a,#12
4054  092f 2603          	jrne	L405
4055  0931               L605:
4056  0931 4f            	clr	a
4057  0932 2010          	jra	L015
4058  0934               L405:
4059  0934 ae03de        	ldw	x,#990
4060  0937 89            	pushw	x
4061  0938 ae0000        	ldw	x,#0
4062  093b 89            	pushw	x
4063  093c ae0000        	ldw	x,#L702
4064  093f cd0000        	call	_assert_failed
4066  0942 5b04          	addw	sp,#4
4067  0944               L015:
4068                     ; 992     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
4068                     ; 993                             | (uint8_t)TIM2_IC3Prescaler);
4070  0944 c65309        	ld	a,21257
4071  0947 a4f3          	and	a,#243
4072  0949 1a01          	or	a,(OFST+1,sp)
4073  094b c75309        	ld	21257,a
4074                     ; 994 }
4077  094e 84            	pop	a
4078  094f 81            	ret
4130                     ; 1001 uint16_t TIM2_GetCapture1(void)
4130                     ; 1002 {
4131                     	switch	.text
4132  0950               _TIM2_GetCapture1:
4134  0950 5204          	subw	sp,#4
4135       00000004      OFST:	set	4
4138                     ; 1004     uint16_t tmpccr1 = 0;
4140                     ; 1005     uint8_t tmpccr1l=0, tmpccr1h=0;
4144                     ; 1007     tmpccr1h = TIM2->CCR1H;
4146  0952 c65311        	ld	a,21265
4147  0955 6b02          	ld	(OFST-2,sp),a
4148                     ; 1008     tmpccr1l = TIM2->CCR1L;
4150  0957 c65312        	ld	a,21266
4151  095a 6b01          	ld	(OFST-3,sp),a
4152                     ; 1010     tmpccr1 = (uint16_t)(tmpccr1l);
4154  095c 7b01          	ld	a,(OFST-3,sp)
4155  095e 5f            	clrw	x
4156  095f 97            	ld	xl,a
4157  0960 1f03          	ldw	(OFST-1,sp),x
4158                     ; 1011     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4160  0962 7b02          	ld	a,(OFST-2,sp)
4161  0964 5f            	clrw	x
4162  0965 97            	ld	xl,a
4163  0966 4f            	clr	a
4164  0967 02            	rlwa	x,a
4165  0968 01            	rrwa	x,a
4166  0969 1a04          	or	a,(OFST+0,sp)
4167  096b 01            	rrwa	x,a
4168  096c 1a03          	or	a,(OFST-1,sp)
4169  096e 01            	rrwa	x,a
4170  096f 1f03          	ldw	(OFST-1,sp),x
4171                     ; 1013     return (uint16_t)tmpccr1;
4173  0971 1e03          	ldw	x,(OFST-1,sp)
4176  0973 5b04          	addw	sp,#4
4177  0975 81            	ret
4229                     ; 1021 uint16_t TIM2_GetCapture2(void)
4229                     ; 1022 {
4230                     	switch	.text
4231  0976               _TIM2_GetCapture2:
4233  0976 5204          	subw	sp,#4
4234       00000004      OFST:	set	4
4237                     ; 1024     uint16_t tmpccr2 = 0;
4239                     ; 1025     uint8_t tmpccr2l=0, tmpccr2h=0;
4243                     ; 1027     tmpccr2h = TIM2->CCR2H;
4245  0978 c65313        	ld	a,21267
4246  097b 6b02          	ld	(OFST-2,sp),a
4247                     ; 1028     tmpccr2l = TIM2->CCR2L;
4249  097d c65314        	ld	a,21268
4250  0980 6b01          	ld	(OFST-3,sp),a
4251                     ; 1030     tmpccr2 = (uint16_t)(tmpccr2l);
4253  0982 7b01          	ld	a,(OFST-3,sp)
4254  0984 5f            	clrw	x
4255  0985 97            	ld	xl,a
4256  0986 1f03          	ldw	(OFST-1,sp),x
4257                     ; 1031     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4259  0988 7b02          	ld	a,(OFST-2,sp)
4260  098a 5f            	clrw	x
4261  098b 97            	ld	xl,a
4262  098c 4f            	clr	a
4263  098d 02            	rlwa	x,a
4264  098e 01            	rrwa	x,a
4265  098f 1a04          	or	a,(OFST+0,sp)
4266  0991 01            	rrwa	x,a
4267  0992 1a03          	or	a,(OFST-1,sp)
4268  0994 01            	rrwa	x,a
4269  0995 1f03          	ldw	(OFST-1,sp),x
4270                     ; 1033     return (uint16_t)tmpccr2;
4272  0997 1e03          	ldw	x,(OFST-1,sp)
4275  0999 5b04          	addw	sp,#4
4276  099b 81            	ret
4328                     ; 1041 uint16_t TIM2_GetCapture3(void)
4328                     ; 1042 {
4329                     	switch	.text
4330  099c               _TIM2_GetCapture3:
4332  099c 5204          	subw	sp,#4
4333       00000004      OFST:	set	4
4336                     ; 1044     uint16_t tmpccr3 = 0;
4338                     ; 1045     uint8_t tmpccr3l=0, tmpccr3h=0;
4342                     ; 1047     tmpccr3h = TIM2->CCR3H;
4344  099e c65315        	ld	a,21269
4345  09a1 6b02          	ld	(OFST-2,sp),a
4346                     ; 1048     tmpccr3l = TIM2->CCR3L;
4348  09a3 c65316        	ld	a,21270
4349  09a6 6b01          	ld	(OFST-3,sp),a
4350                     ; 1050     tmpccr3 = (uint16_t)(tmpccr3l);
4352  09a8 7b01          	ld	a,(OFST-3,sp)
4353  09aa 5f            	clrw	x
4354  09ab 97            	ld	xl,a
4355  09ac 1f03          	ldw	(OFST-1,sp),x
4356                     ; 1051     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4358  09ae 7b02          	ld	a,(OFST-2,sp)
4359  09b0 5f            	clrw	x
4360  09b1 97            	ld	xl,a
4361  09b2 4f            	clr	a
4362  09b3 02            	rlwa	x,a
4363  09b4 01            	rrwa	x,a
4364  09b5 1a04          	or	a,(OFST+0,sp)
4365  09b7 01            	rrwa	x,a
4366  09b8 1a03          	or	a,(OFST-1,sp)
4367  09ba 01            	rrwa	x,a
4368  09bb 1f03          	ldw	(OFST-1,sp),x
4369                     ; 1053     return (uint16_t)tmpccr3;
4371  09bd 1e03          	ldw	x,(OFST-1,sp)
4374  09bf 5b04          	addw	sp,#4
4375  09c1 81            	ret
4409                     ; 1061 uint16_t TIM2_GetCounter(void)
4409                     ; 1062 {
4410                     	switch	.text
4411  09c2               _TIM2_GetCounter:
4413  09c2 89            	pushw	x
4414       00000002      OFST:	set	2
4417                     ; 1063      uint16_t tmpcntr = 0;
4419                     ; 1065     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4421  09c3 c6530c        	ld	a,21260
4422  09c6 5f            	clrw	x
4423  09c7 97            	ld	xl,a
4424  09c8 4f            	clr	a
4425  09c9 02            	rlwa	x,a
4426  09ca 1f01          	ldw	(OFST-1,sp),x
4427                     ; 1067     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4429  09cc c6530d        	ld	a,21261
4430  09cf 5f            	clrw	x
4431  09d0 97            	ld	xl,a
4432  09d1 01            	rrwa	x,a
4433  09d2 1a02          	or	a,(OFST+0,sp)
4434  09d4 01            	rrwa	x,a
4435  09d5 1a01          	or	a,(OFST-1,sp)
4436  09d7 01            	rrwa	x,a
4439  09d8 5b02          	addw	sp,#2
4440  09da 81            	ret
4464                     ; 1076 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4464                     ; 1077 {
4465                     	switch	.text
4466  09db               _TIM2_GetPrescaler:
4470                     ; 1079     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4472  09db c6530e        	ld	a,21262
4475  09de 81            	ret
4615                     ; 1096 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4615                     ; 1097 {
4616                     	switch	.text
4617  09df               _TIM2_GetFlagStatus:
4619  09df 89            	pushw	x
4620  09e0 89            	pushw	x
4621       00000002      OFST:	set	2
4624                     ; 1098     FlagStatus bitstatus = RESET;
4626                     ; 1099     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4630                     ; 1102     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4632  09e1 a30001        	cpw	x,#1
4633  09e4 271e          	jreq	L035
4634  09e6 a30002        	cpw	x,#2
4635  09e9 2719          	jreq	L035
4636  09eb a30004        	cpw	x,#4
4637  09ee 2714          	jreq	L035
4638  09f0 a30008        	cpw	x,#8
4639  09f3 270f          	jreq	L035
4640  09f5 a30200        	cpw	x,#512
4641  09f8 270a          	jreq	L035
4642  09fa a30400        	cpw	x,#1024
4643  09fd 2705          	jreq	L035
4644  09ff a30800        	cpw	x,#2048
4645  0a02 2603          	jrne	L625
4646  0a04               L035:
4647  0a04 4f            	clr	a
4648  0a05 2010          	jra	L235
4649  0a07               L625:
4650  0a07 ae044e        	ldw	x,#1102
4651  0a0a 89            	pushw	x
4652  0a0b ae0000        	ldw	x,#0
4653  0a0e 89            	pushw	x
4654  0a0f ae0000        	ldw	x,#L702
4655  0a12 cd0000        	call	_assert_failed
4657  0a15 5b04          	addw	sp,#4
4658  0a17               L235:
4659                     ; 1104     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4661  0a17 c65304        	ld	a,21252
4662  0a1a 1404          	and	a,(OFST+2,sp)
4663  0a1c 6b01          	ld	(OFST-1,sp),a
4664                     ; 1105     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4666  0a1e 7b03          	ld	a,(OFST+1,sp)
4667  0a20 6b02          	ld	(OFST+0,sp),a
4668                     ; 1107     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4670  0a22 c65305        	ld	a,21253
4671  0a25 1402          	and	a,(OFST+0,sp)
4672  0a27 1a01          	or	a,(OFST-1,sp)
4673  0a29 2706          	jreq	L7371
4674                     ; 1109         bitstatus = SET;
4676  0a2b a601          	ld	a,#1
4677  0a2d 6b02          	ld	(OFST+0,sp),a
4679  0a2f 2002          	jra	L1471
4680  0a31               L7371:
4681                     ; 1113         bitstatus = RESET;
4683  0a31 0f02          	clr	(OFST+0,sp)
4684  0a33               L1471:
4685                     ; 1115     return (FlagStatus)bitstatus;
4687  0a33 7b02          	ld	a,(OFST+0,sp)
4690  0a35 5b04          	addw	sp,#4
4691  0a37 81            	ret
4727                     ; 1132 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4727                     ; 1133 {
4728                     	switch	.text
4729  0a38               _TIM2_ClearFlag:
4731  0a38 89            	pushw	x
4732       00000000      OFST:	set	0
4735                     ; 1135     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4737  0a39 01            	rrwa	x,a
4738  0a3a a4f0          	and	a,#240
4739  0a3c 01            	rrwa	x,a
4740  0a3d a4f1          	and	a,#241
4741  0a3f 01            	rrwa	x,a
4742  0a40 a30000        	cpw	x,#0
4743  0a43 2607          	jrne	L635
4744  0a45 1e01          	ldw	x,(OFST+1,sp)
4745  0a47 2703          	jreq	L635
4746  0a49 4f            	clr	a
4747  0a4a 2010          	jra	L045
4748  0a4c               L635:
4749  0a4c ae046f        	ldw	x,#1135
4750  0a4f 89            	pushw	x
4751  0a50 ae0000        	ldw	x,#0
4752  0a53 89            	pushw	x
4753  0a54 ae0000        	ldw	x,#L702
4754  0a57 cd0000        	call	_assert_failed
4756  0a5a 5b04          	addw	sp,#4
4757  0a5c               L045:
4758                     ; 1138     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4760  0a5c 7b02          	ld	a,(OFST+2,sp)
4761  0a5e 43            	cpl	a
4762  0a5f c75304        	ld	21252,a
4763                     ; 1139     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4765  0a62 35ff5305      	mov	21253,#255
4766                     ; 1140 }
4769  0a66 85            	popw	x
4770  0a67 81            	ret
4835                     ; 1154 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4835                     ; 1155 {
4836                     	switch	.text
4837  0a68               _TIM2_GetITStatus:
4839  0a68 88            	push	a
4840  0a69 89            	pushw	x
4841       00000002      OFST:	set	2
4844                     ; 1156     ITStatus bitstatus = RESET;
4846                     ; 1157     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4850                     ; 1160     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4852  0a6a a101          	cp	a,#1
4853  0a6c 270c          	jreq	L645
4854  0a6e a102          	cp	a,#2
4855  0a70 2708          	jreq	L645
4856  0a72 a104          	cp	a,#4
4857  0a74 2704          	jreq	L645
4858  0a76 a108          	cp	a,#8
4859  0a78 2603          	jrne	L445
4860  0a7a               L645:
4861  0a7a 4f            	clr	a
4862  0a7b 2010          	jra	L055
4863  0a7d               L445:
4864  0a7d ae0488        	ldw	x,#1160
4865  0a80 89            	pushw	x
4866  0a81 ae0000        	ldw	x,#0
4867  0a84 89            	pushw	x
4868  0a85 ae0000        	ldw	x,#L702
4869  0a88 cd0000        	call	_assert_failed
4871  0a8b 5b04          	addw	sp,#4
4872  0a8d               L055:
4873                     ; 1162     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4875  0a8d c65304        	ld	a,21252
4876  0a90 1403          	and	a,(OFST+1,sp)
4877  0a92 6b01          	ld	(OFST-1,sp),a
4878                     ; 1164     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4880  0a94 c65303        	ld	a,21251
4881  0a97 1403          	and	a,(OFST+1,sp)
4882  0a99 6b02          	ld	(OFST+0,sp),a
4883                     ; 1166     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4885  0a9b 0d01          	tnz	(OFST-1,sp)
4886  0a9d 270a          	jreq	L3102
4888  0a9f 0d02          	tnz	(OFST+0,sp)
4889  0aa1 2706          	jreq	L3102
4890                     ; 1168         bitstatus = SET;
4892  0aa3 a601          	ld	a,#1
4893  0aa5 6b02          	ld	(OFST+0,sp),a
4895  0aa7 2002          	jra	L5102
4896  0aa9               L3102:
4897                     ; 1172         bitstatus = RESET;
4899  0aa9 0f02          	clr	(OFST+0,sp)
4900  0aab               L5102:
4901                     ; 1174     return (ITStatus)(bitstatus);
4903  0aab 7b02          	ld	a,(OFST+0,sp)
4906  0aad 5b03          	addw	sp,#3
4907  0aaf 81            	ret
4944                     ; 1188 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4944                     ; 1189 {
4945                     	switch	.text
4946  0ab0               _TIM2_ClearITPendingBit:
4948  0ab0 88            	push	a
4949       00000000      OFST:	set	0
4952                     ; 1191     assert_param(IS_TIM2_IT_OK(TIM2_IT));
4954  0ab1 4d            	tnz	a
4955  0ab2 2707          	jreq	L455
4956  0ab4 a110          	cp	a,#16
4957  0ab6 2403          	jruge	L455
4958  0ab8 4f            	clr	a
4959  0ab9 2010          	jra	L655
4960  0abb               L455:
4961  0abb ae04a7        	ldw	x,#1191
4962  0abe 89            	pushw	x
4963  0abf ae0000        	ldw	x,#0
4964  0ac2 89            	pushw	x
4965  0ac3 ae0000        	ldw	x,#L702
4966  0ac6 cd0000        	call	_assert_failed
4968  0ac9 5b04          	addw	sp,#4
4969  0acb               L655:
4970                     ; 1194     TIM2->SR1 = (uint8_t)(~TIM2_IT);
4972  0acb 7b01          	ld	a,(OFST+1,sp)
4973  0acd 43            	cpl	a
4974  0ace c75304        	ld	21252,a
4975                     ; 1195 }
4978  0ad1 84            	pop	a
4979  0ad2 81            	ret
5031                     ; 1214 static void TI1_Config(uint8_t TIM2_ICPolarity,
5031                     ; 1215                        uint8_t TIM2_ICSelection,
5031                     ; 1216                        uint8_t TIM2_ICFilter)
5031                     ; 1217 {
5032                     	switch	.text
5033  0ad3               L3_TI1_Config:
5035  0ad3 89            	pushw	x
5036  0ad4 88            	push	a
5037       00000001      OFST:	set	1
5040                     ; 1219     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
5042  0ad5 7211530a      	bres	21258,#0
5043                     ; 1222     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
5043                     ; 1223                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5045  0ad9 7b06          	ld	a,(OFST+5,sp)
5046  0adb 97            	ld	xl,a
5047  0adc a610          	ld	a,#16
5048  0ade 42            	mul	x,a
5049  0adf 9f            	ld	a,xl
5050  0ae0 1a03          	or	a,(OFST+2,sp)
5051  0ae2 6b01          	ld	(OFST+0,sp),a
5052  0ae4 c65307        	ld	a,21255
5053  0ae7 a40c          	and	a,#12
5054  0ae9 1a01          	or	a,(OFST+0,sp)
5055  0aeb c75307        	ld	21255,a
5056                     ; 1226     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5058  0aee 0d02          	tnz	(OFST+1,sp)
5059  0af0 2706          	jreq	L3602
5060                     ; 1228         TIM2->CCER1 |= TIM2_CCER1_CC1P;
5062  0af2 7212530a      	bset	21258,#1
5064  0af6 2004          	jra	L5602
5065  0af8               L3602:
5066                     ; 1232         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
5068  0af8 7213530a      	bres	21258,#1
5069  0afc               L5602:
5070                     ; 1235     TIM2->CCER1 |= TIM2_CCER1_CC1E;
5072  0afc 7210530a      	bset	21258,#0
5073                     ; 1236 }
5076  0b00 5b03          	addw	sp,#3
5077  0b02 81            	ret
5129                     ; 1255 static void TI2_Config(uint8_t TIM2_ICPolarity,
5129                     ; 1256                        uint8_t TIM2_ICSelection,
5129                     ; 1257                        uint8_t TIM2_ICFilter)
5129                     ; 1258 {
5130                     	switch	.text
5131  0b03               L5_TI2_Config:
5133  0b03 89            	pushw	x
5134  0b04 88            	push	a
5135       00000001      OFST:	set	1
5138                     ; 1260     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
5140  0b05 7219530a      	bres	21258,#4
5141                     ; 1263     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
5141                     ; 1264                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5143  0b09 7b06          	ld	a,(OFST+5,sp)
5144  0b0b 97            	ld	xl,a
5145  0b0c a610          	ld	a,#16
5146  0b0e 42            	mul	x,a
5147  0b0f 9f            	ld	a,xl
5148  0b10 1a03          	or	a,(OFST+2,sp)
5149  0b12 6b01          	ld	(OFST+0,sp),a
5150  0b14 c65308        	ld	a,21256
5151  0b17 a40c          	and	a,#12
5152  0b19 1a01          	or	a,(OFST+0,sp)
5153  0b1b c75308        	ld	21256,a
5154                     ; 1268     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5156  0b1e 0d02          	tnz	(OFST+1,sp)
5157  0b20 2706          	jreq	L5112
5158                     ; 1270         TIM2->CCER1 |= TIM2_CCER1_CC2P;
5160  0b22 721a530a      	bset	21258,#5
5162  0b26 2004          	jra	L7112
5163  0b28               L5112:
5164                     ; 1274         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
5166  0b28 721b530a      	bres	21258,#5
5167  0b2c               L7112:
5168                     ; 1278     TIM2->CCER1 |= TIM2_CCER1_CC2E;
5170  0b2c 7218530a      	bset	21258,#4
5171                     ; 1280 }
5174  0b30 5b03          	addw	sp,#3
5175  0b32 81            	ret
5227                     ; 1296 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
5227                     ; 1297                        uint8_t TIM2_ICFilter)
5227                     ; 1298 {
5228                     	switch	.text
5229  0b33               L7_TI3_Config:
5231  0b33 89            	pushw	x
5232  0b34 88            	push	a
5233       00000001      OFST:	set	1
5236                     ; 1300     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
5238  0b35 7211530b      	bres	21259,#0
5239                     ; 1303     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
5239                     ; 1304                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5241  0b39 7b06          	ld	a,(OFST+5,sp)
5242  0b3b 97            	ld	xl,a
5243  0b3c a610          	ld	a,#16
5244  0b3e 42            	mul	x,a
5245  0b3f 9f            	ld	a,xl
5246  0b40 1a03          	or	a,(OFST+2,sp)
5247  0b42 6b01          	ld	(OFST+0,sp),a
5248  0b44 c65309        	ld	a,21257
5249  0b47 a40c          	and	a,#12
5250  0b49 1a01          	or	a,(OFST+0,sp)
5251  0b4b c75309        	ld	21257,a
5252                     ; 1308     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5254  0b4e 0d02          	tnz	(OFST+1,sp)
5255  0b50 2706          	jreq	L7412
5256                     ; 1310         TIM2->CCER2 |= TIM2_CCER2_CC3P;
5258  0b52 7212530b      	bset	21259,#1
5260  0b56 2004          	jra	L1512
5261  0b58               L7412:
5262                     ; 1314         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
5264  0b58 7213530b      	bres	21259,#1
5265  0b5c               L1512:
5266                     ; 1317     TIM2->CCER2 |= TIM2_CCER2_CC3E;
5268  0b5c 7210530b      	bset	21259,#0
5269                     ; 1318 }
5272  0b60 5b03          	addw	sp,#3
5273  0b62 81            	ret
5286                     	xdef	_TIM2_ClearITPendingBit
5287                     	xdef	_TIM2_GetITStatus
5288                     	xdef	_TIM2_ClearFlag
5289                     	xdef	_TIM2_GetFlagStatus
5290                     	xdef	_TIM2_GetPrescaler
5291                     	xdef	_TIM2_GetCounter
5292                     	xdef	_TIM2_GetCapture3
5293                     	xdef	_TIM2_GetCapture2
5294                     	xdef	_TIM2_GetCapture1
5295                     	xdef	_TIM2_SetIC3Prescaler
5296                     	xdef	_TIM2_SetIC2Prescaler
5297                     	xdef	_TIM2_SetIC1Prescaler
5298                     	xdef	_TIM2_SetCompare3
5299                     	xdef	_TIM2_SetCompare2
5300                     	xdef	_TIM2_SetCompare1
5301                     	xdef	_TIM2_SetAutoreload
5302                     	xdef	_TIM2_SetCounter
5303                     	xdef	_TIM2_SelectOCxM
5304                     	xdef	_TIM2_CCxCmd
5305                     	xdef	_TIM2_OC3PolarityConfig
5306                     	xdef	_TIM2_OC2PolarityConfig
5307                     	xdef	_TIM2_OC1PolarityConfig
5308                     	xdef	_TIM2_GenerateEvent
5309                     	xdef	_TIM2_OC3PreloadConfig
5310                     	xdef	_TIM2_OC2PreloadConfig
5311                     	xdef	_TIM2_OC1PreloadConfig
5312                     	xdef	_TIM2_ARRPreloadConfig
5313                     	xdef	_TIM2_ForcedOC3Config
5314                     	xdef	_TIM2_ForcedOC2Config
5315                     	xdef	_TIM2_ForcedOC1Config
5316                     	xdef	_TIM2_PrescalerConfig
5317                     	xdef	_TIM2_SelectOnePulseMode
5318                     	xdef	_TIM2_UpdateRequestConfig
5319                     	xdef	_TIM2_UpdateDisableConfig
5320                     	xdef	_TIM2_ITConfig
5321                     	xdef	_TIM2_Cmd
5322                     	xdef	_TIM2_PWMIConfig
5323                     	xdef	_TIM2_ICInit
5324                     	xdef	_TIM2_OC3Init
5325                     	xdef	_TIM2_OC2Init
5326                     	xdef	_TIM2_OC1Init
5327                     	xdef	_TIM2_TimeBaseInit
5328                     	xdef	_TIM2_DeInit
5329                     	xref	_assert_failed
5330                     .const:	section	.text
5331  0000               L702:
5332  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_t"
5333  0012 696d322e6300  	dc.b	"im2.c",0
5353                     	end
