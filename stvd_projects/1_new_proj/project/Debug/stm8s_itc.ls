   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 44 uint8_t ITC_GetCPUCC(void)
  43                     ; 45 {
  45                     	switch	.text
  46  0000               _ITC_GetCPUCC:
  50                     ; 47   _asm("push cc");
  53  0000 8a            push cc
  55                     ; 48   _asm("pop a");
  58  0001 84            pop a
  60                     ; 49   return; /* Ignore compiler warning, the returned value is in A register */
  63  0002 81            	ret
  86                     ; 74 void ITC_DeInit(void)
  86                     ; 75 {
  87                     	switch	.text
  88  0003               _ITC_DeInit:
  92                     ; 76     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  94  0003 35ff7f70      	mov	32624,#255
  95                     ; 77     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  97  0007 35ff7f71      	mov	32625,#255
  98                     ; 78     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 100  000b 35ff7f72      	mov	32626,#255
 101                     ; 79     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 103  000f 35ff7f73      	mov	32627,#255
 104                     ; 80     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 106  0013 35ff7f74      	mov	32628,#255
 107                     ; 81     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 109  0017 35ff7f75      	mov	32629,#255
 110                     ; 82     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 112  001b 35ff7f76      	mov	32630,#255
 113                     ; 83     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 115  001f 35ff7f77      	mov	32631,#255
 116                     ; 84 }
 119  0023 81            	ret
 144                     ; 91 uint8_t ITC_GetSoftIntStatus(void)
 144                     ; 92 {
 145                     	switch	.text
 146  0024               _ITC_GetSoftIntStatus:
 150                     ; 93     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 152  0024 adda          	call	_ITC_GetCPUCC
 154  0026 a428          	and	a,#40
 157  0028 81            	ret
 407                     .const:	section	.text
 408  0000               L62:
 409  0000 0065          	dc.w	L14
 410  0002 0065          	dc.w	L14
 411  0004 0065          	dc.w	L14
 412  0006 0065          	dc.w	L14
 413  0008 006e          	dc.w	L34
 414  000a 006e          	dc.w	L34
 415  000c 006e          	dc.w	L34
 416  000e 006e          	dc.w	L34
 417  0010 00a2          	dc.w	L502
 418  0012 00a2          	dc.w	L502
 419  0014 0077          	dc.w	L54
 420  0016 0077          	dc.w	L54
 421  0018 0080          	dc.w	L74
 422  001a 0080          	dc.w	L74
 423  001c 0080          	dc.w	L74
 424  001e 0080          	dc.w	L74
 425  0020 0089          	dc.w	L15
 426  0022 0089          	dc.w	L15
 427  0024 0089          	dc.w	L15
 428  0026 0089          	dc.w	L15
 429  0028 00a2          	dc.w	L502
 430  002a 00a2          	dc.w	L502
 431  002c 0092          	dc.w	L35
 432  002e 0092          	dc.w	L35
 433  0030 009b          	dc.w	L55
 434                     ; 101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 434                     ; 102 {
 435                     	switch	.text
 436  0029               _ITC_GetSoftwarePriority:
 438  0029 88            	push	a
 439  002a 89            	pushw	x
 440       00000002      OFST:	set	2
 443                     ; 104     uint8_t Value = 0;
 445  002b 0f02          	clr	(OFST+0,sp)
 446                     ; 105     uint8_t Mask = 0;
 448                     ; 108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 450  002d a119          	cp	a,#25
 451  002f 2403          	jruge	L41
 452  0031 4f            	clr	a
 453  0032 2010          	jra	L61
 454  0034               L41:
 455  0034 ae006c        	ldw	x,#108
 456  0037 89            	pushw	x
 457  0038 ae0000        	ldw	x,#0
 458  003b 89            	pushw	x
 459  003c ae0064        	ldw	x,#L102
 460  003f cd0000        	call	_assert_failed
 462  0042 5b04          	addw	sp,#4
 463  0044               L61:
 464                     ; 111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 466  0044 7b03          	ld	a,(OFST+1,sp)
 467  0046 a403          	and	a,#3
 468  0048 48            	sll	a
 469  0049 5f            	clrw	x
 470  004a 97            	ld	xl,a
 471  004b a603          	ld	a,#3
 472  004d 5d            	tnzw	x
 473  004e 2704          	jreq	L02
 474  0050               L22:
 475  0050 48            	sll	a
 476  0051 5a            	decw	x
 477  0052 26fc          	jrne	L22
 478  0054               L02:
 479  0054 6b01          	ld	(OFST-1,sp),a
 480                     ; 113     switch (IrqNum)
 482  0056 7b03          	ld	a,(OFST+1,sp)
 484                     ; 185     default:
 484                     ; 186         break;
 485  0058 a119          	cp	a,#25
 486  005a 2407          	jruge	L42
 487  005c 5f            	clrw	x
 488  005d 97            	ld	xl,a
 489  005e 58            	sllw	x
 490  005f de0000        	ldw	x,(L62,x)
 491  0062 fc            	jp	(x)
 492  0063               L42:
 493  0063 203d          	jra	L502
 494  0065               L14:
 495                     ; 115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 495                     ; 116     case ITC_IRQ_AWU:
 495                     ; 117     case ITC_IRQ_CLK:
 495                     ; 118     case ITC_IRQ_PORTA:
 495                     ; 119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 497  0065 c67f70        	ld	a,32624
 498  0068 1401          	and	a,(OFST-1,sp)
 499  006a 6b02          	ld	(OFST+0,sp),a
 500                     ; 120         break;
 502  006c 2034          	jra	L502
 503  006e               L34:
 504                     ; 121     case ITC_IRQ_PORTB:
 504                     ; 122     case ITC_IRQ_PORTC:
 504                     ; 123     case ITC_IRQ_PORTD:
 504                     ; 124     case ITC_IRQ_PORTE:
 504                     ; 125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 506  006e c67f71        	ld	a,32625
 507  0071 1401          	and	a,(OFST-1,sp)
 508  0073 6b02          	ld	(OFST+0,sp),a
 509                     ; 126         break;
 511  0075 202b          	jra	L502
 512  0077               L54:
 513                     ; 136     case ITC_IRQ_SPI:
 513                     ; 137     case ITC_IRQ_TIM1_OVF:
 513                     ; 138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 515  0077 c67f72        	ld	a,32626
 516  007a 1401          	and	a,(OFST-1,sp)
 517  007c 6b02          	ld	(OFST+0,sp),a
 518                     ; 139         break;
 520  007e 2022          	jra	L502
 521  0080               L74:
 522                     ; 140     case ITC_IRQ_TIM1_CAPCOM:
 522                     ; 141 #ifdef STM8S903
 522                     ; 142     case ITC_IRQ_TIM5_OVFTRI:
 522                     ; 143     case ITC_IRQ_TIM5_CAPCOM:
 522                     ; 144 #else
 522                     ; 145     case ITC_IRQ_TIM2_OVF:
 522                     ; 146     case ITC_IRQ_TIM2_CAPCOM:
 522                     ; 147 #endif /*STM8S903*/
 522                     ; 148 
 522                     ; 149     case ITC_IRQ_TIM3_OVF:
 522                     ; 150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 524  0080 c67f73        	ld	a,32627
 525  0083 1401          	and	a,(OFST-1,sp)
 526  0085 6b02          	ld	(OFST+0,sp),a
 527                     ; 151         break;
 529  0087 2019          	jra	L502
 530  0089               L15:
 531                     ; 152     case ITC_IRQ_TIM3_CAPCOM:
 531                     ; 153     case ITC_IRQ_UART1_TX:
 531                     ; 154     case ITC_IRQ_UART1_RX:
 531                     ; 155     case ITC_IRQ_I2C:
 531                     ; 156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 533  0089 c67f74        	ld	a,32628
 534  008c 1401          	and	a,(OFST-1,sp)
 535  008e 6b02          	ld	(OFST+0,sp),a
 536                     ; 157         break;
 538  0090 2010          	jra	L502
 539  0092               L35:
 540                     ; 172     case ITC_IRQ_ADC1:
 540                     ; 173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 540                     ; 174 
 540                     ; 175 #ifdef STM8S903
 540                     ; 176     case ITC_IRQ_TIM6_OVFTRI:
 540                     ; 177 #else
 540                     ; 178     case ITC_IRQ_TIM4_OVF:
 540                     ; 179 #endif /*STM8S903*/
 540                     ; 180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 542  0092 c67f75        	ld	a,32629
 543  0095 1401          	and	a,(OFST-1,sp)
 544  0097 6b02          	ld	(OFST+0,sp),a
 545                     ; 181         break;
 547  0099 2007          	jra	L502
 548  009b               L55:
 549                     ; 182     case ITC_IRQ_EEPROM_EEC:
 549                     ; 183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 551  009b c67f76        	ld	a,32630
 552  009e 1401          	and	a,(OFST-1,sp)
 553  00a0 6b02          	ld	(OFST+0,sp),a
 554                     ; 184         break;
 556  00a2               L75:
 557                     ; 185     default:
 557                     ; 186         break;
 559  00a2               L502:
 560                     ; 189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 562  00a2 7b03          	ld	a,(OFST+1,sp)
 563  00a4 a403          	and	a,#3
 564  00a6 48            	sll	a
 565  00a7 5f            	clrw	x
 566  00a8 97            	ld	xl,a
 567  00a9 7b02          	ld	a,(OFST+0,sp)
 568  00ab 5d            	tnzw	x
 569  00ac 2704          	jreq	L03
 570  00ae               L23:
 571  00ae 44            	srl	a
 572  00af 5a            	decw	x
 573  00b0 26fc          	jrne	L23
 574  00b2               L03:
 575  00b2 6b02          	ld	(OFST+0,sp),a
 576                     ; 191     return((ITC_PriorityLevel_TypeDef)Value);
 578  00b4 7b02          	ld	a,(OFST+0,sp)
 581  00b6 5b03          	addw	sp,#3
 582  00b8 81            	ret
 648                     	switch	.const
 649  0032               L66:
 650  0032 014a          	dc.w	L702
 651  0034 014a          	dc.w	L702
 652  0036 014a          	dc.w	L702
 653  0038 014a          	dc.w	L702
 654  003a 015c          	dc.w	L112
 655  003c 015c          	dc.w	L112
 656  003e 015c          	dc.w	L112
 657  0040 015c          	dc.w	L112
 658  0042 01c6          	dc.w	L362
 659  0044 01c6          	dc.w	L362
 660  0046 016e          	dc.w	L312
 661  0048 016e          	dc.w	L312
 662  004a 0180          	dc.w	L512
 663  004c 0180          	dc.w	L512
 664  004e 0180          	dc.w	L512
 665  0050 0180          	dc.w	L512
 666  0052 0192          	dc.w	L712
 667  0054 0192          	dc.w	L712
 668  0056 0192          	dc.w	L712
 669  0058 0192          	dc.w	L712
 670  005a 01c6          	dc.w	L362
 671  005c 01c6          	dc.w	L362
 672  005e 01a4          	dc.w	L122
 673  0060 01a4          	dc.w	L122
 674  0062 01b6          	dc.w	L322
 675                     ; 208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 675                     ; 209 {
 676                     	switch	.text
 677  00b9               _ITC_SetSoftwarePriority:
 679  00b9 89            	pushw	x
 680  00ba 89            	pushw	x
 681       00000002      OFST:	set	2
 684                     ; 211     uint8_t Mask = 0;
 686                     ; 212     uint8_t NewPriority = 0;
 688                     ; 215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 690  00bb 9e            	ld	a,xh
 691  00bc a119          	cp	a,#25
 692  00be 2403          	jruge	L63
 693  00c0 4f            	clr	a
 694  00c1 2010          	jra	L04
 695  00c3               L63:
 696  00c3 ae00d7        	ldw	x,#215
 697  00c6 89            	pushw	x
 698  00c7 ae0000        	ldw	x,#0
 699  00ca 89            	pushw	x
 700  00cb ae0064        	ldw	x,#L102
 701  00ce cd0000        	call	_assert_failed
 703  00d1 5b04          	addw	sp,#4
 704  00d3               L04:
 705                     ; 216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 707  00d3 7b04          	ld	a,(OFST+2,sp)
 708  00d5 a102          	cp	a,#2
 709  00d7 2710          	jreq	L44
 710  00d9 7b04          	ld	a,(OFST+2,sp)
 711  00db a101          	cp	a,#1
 712  00dd 270a          	jreq	L44
 713  00df 0d04          	tnz	(OFST+2,sp)
 714  00e1 2706          	jreq	L44
 715  00e3 7b04          	ld	a,(OFST+2,sp)
 716  00e5 a103          	cp	a,#3
 717  00e7 2603          	jrne	L24
 718  00e9               L44:
 719  00e9 4f            	clr	a
 720  00ea 2010          	jra	L64
 721  00ec               L24:
 722  00ec ae00d8        	ldw	x,#216
 723  00ef 89            	pushw	x
 724  00f0 ae0000        	ldw	x,#0
 725  00f3 89            	pushw	x
 726  00f4 ae0064        	ldw	x,#L102
 727  00f7 cd0000        	call	_assert_failed
 729  00fa 5b04          	addw	sp,#4
 730  00fc               L64:
 731                     ; 219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 733  00fc cd0024        	call	_ITC_GetSoftIntStatus
 735  00ff a128          	cp	a,#40
 736  0101 2603          	jrne	L05
 737  0103 4f            	clr	a
 738  0104 2010          	jra	L25
 739  0106               L05:
 740  0106 ae00db        	ldw	x,#219
 741  0109 89            	pushw	x
 742  010a ae0000        	ldw	x,#0
 743  010d 89            	pushw	x
 744  010e ae0064        	ldw	x,#L102
 745  0111 cd0000        	call	_assert_failed
 747  0114 5b04          	addw	sp,#4
 748  0116               L25:
 749                     ; 223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 751  0116 7b03          	ld	a,(OFST+1,sp)
 752  0118 a403          	and	a,#3
 753  011a 48            	sll	a
 754  011b 5f            	clrw	x
 755  011c 97            	ld	xl,a
 756  011d a603          	ld	a,#3
 757  011f 5d            	tnzw	x
 758  0120 2704          	jreq	L45
 759  0122               L65:
 760  0122 48            	sll	a
 761  0123 5a            	decw	x
 762  0124 26fc          	jrne	L65
 763  0126               L45:
 764  0126 43            	cpl	a
 765  0127 6b01          	ld	(OFST-1,sp),a
 766                     ; 226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 768  0129 7b03          	ld	a,(OFST+1,sp)
 769  012b a403          	and	a,#3
 770  012d 48            	sll	a
 771  012e 5f            	clrw	x
 772  012f 97            	ld	xl,a
 773  0130 7b04          	ld	a,(OFST+2,sp)
 774  0132 5d            	tnzw	x
 775  0133 2704          	jreq	L06
 776  0135               L26:
 777  0135 48            	sll	a
 778  0136 5a            	decw	x
 779  0137 26fc          	jrne	L26
 780  0139               L06:
 781  0139 6b02          	ld	(OFST+0,sp),a
 782                     ; 228     switch (IrqNum)
 784  013b 7b03          	ld	a,(OFST+1,sp)
 786                     ; 314     default:
 786                     ; 315         break;
 787  013d a119          	cp	a,#25
 788  013f 2407          	jruge	L46
 789  0141 5f            	clrw	x
 790  0142 97            	ld	xl,a
 791  0143 58            	sllw	x
 792  0144 de0032        	ldw	x,(L66,x)
 793  0147 fc            	jp	(x)
 794  0148               L46:
 795  0148 207c          	jra	L362
 796  014a               L702:
 797                     ; 231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 797                     ; 232     case ITC_IRQ_AWU:
 797                     ; 233     case ITC_IRQ_CLK:
 797                     ; 234     case ITC_IRQ_PORTA:
 797                     ; 235         ITC->ISPR1 &= Mask;
 799  014a c67f70        	ld	a,32624
 800  014d 1401          	and	a,(OFST-1,sp)
 801  014f c77f70        	ld	32624,a
 802                     ; 236         ITC->ISPR1 |= NewPriority;
 804  0152 c67f70        	ld	a,32624
 805  0155 1a02          	or	a,(OFST+0,sp)
 806  0157 c77f70        	ld	32624,a
 807                     ; 237         break;
 809  015a 206a          	jra	L362
 810  015c               L112:
 811                     ; 239     case ITC_IRQ_PORTB:
 811                     ; 240     case ITC_IRQ_PORTC:
 811                     ; 241     case ITC_IRQ_PORTD:
 811                     ; 242     case ITC_IRQ_PORTE:
 811                     ; 243         ITC->ISPR2 &= Mask;
 813  015c c67f71        	ld	a,32625
 814  015f 1401          	and	a,(OFST-1,sp)
 815  0161 c77f71        	ld	32625,a
 816                     ; 244         ITC->ISPR2 |= NewPriority;
 818  0164 c67f71        	ld	a,32625
 819  0167 1a02          	or	a,(OFST+0,sp)
 820  0169 c77f71        	ld	32625,a
 821                     ; 245         break;
 823  016c 2058          	jra	L362
 824  016e               L312:
 825                     ; 255     case ITC_IRQ_SPI:
 825                     ; 256     case ITC_IRQ_TIM1_OVF:
 825                     ; 257         ITC->ISPR3 &= Mask;
 827  016e c67f72        	ld	a,32626
 828  0171 1401          	and	a,(OFST-1,sp)
 829  0173 c77f72        	ld	32626,a
 830                     ; 258         ITC->ISPR3 |= NewPriority;
 832  0176 c67f72        	ld	a,32626
 833  0179 1a02          	or	a,(OFST+0,sp)
 834  017b c77f72        	ld	32626,a
 835                     ; 259         break;
 837  017e 2046          	jra	L362
 838  0180               L512:
 839                     ; 261     case ITC_IRQ_TIM1_CAPCOM:
 839                     ; 262 #ifdef STM8S903
 839                     ; 263     case ITC_IRQ_TIM5_OVFTRI:
 839                     ; 264     case ITC_IRQ_TIM5_CAPCOM:
 839                     ; 265 #else
 839                     ; 266     case ITC_IRQ_TIM2_OVF:
 839                     ; 267     case ITC_IRQ_TIM2_CAPCOM:
 839                     ; 268 #endif /*STM8S903*/
 839                     ; 269 
 839                     ; 270     case ITC_IRQ_TIM3_OVF:
 839                     ; 271         ITC->ISPR4 &= Mask;
 841  0180 c67f73        	ld	a,32627
 842  0183 1401          	and	a,(OFST-1,sp)
 843  0185 c77f73        	ld	32627,a
 844                     ; 272         ITC->ISPR4 |= NewPriority;
 846  0188 c67f73        	ld	a,32627
 847  018b 1a02          	or	a,(OFST+0,sp)
 848  018d c77f73        	ld	32627,a
 849                     ; 273         break;
 851  0190 2034          	jra	L362
 852  0192               L712:
 853                     ; 275     case ITC_IRQ_TIM3_CAPCOM:
 853                     ; 276     case ITC_IRQ_UART1_TX:
 853                     ; 277     case ITC_IRQ_UART1_RX:
 853                     ; 278     case ITC_IRQ_I2C:
 853                     ; 279         ITC->ISPR5 &= Mask;
 855  0192 c67f74        	ld	a,32628
 856  0195 1401          	and	a,(OFST-1,sp)
 857  0197 c77f74        	ld	32628,a
 858                     ; 280         ITC->ISPR5 |= NewPriority;
 860  019a c67f74        	ld	a,32628
 861  019d 1a02          	or	a,(OFST+0,sp)
 862  019f c77f74        	ld	32628,a
 863                     ; 281         break;
 865  01a2 2022          	jra	L362
 866  01a4               L122:
 867                     ; 297     case ITC_IRQ_ADC1:
 867                     ; 298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 867                     ; 299 
 867                     ; 300 #ifdef STM8S903
 867                     ; 301     case ITC_IRQ_TIM6_OVFTRI:
 867                     ; 302 #else
 867                     ; 303     case ITC_IRQ_TIM4_OVF:
 867                     ; 304 #endif /*STM8S903*/
 867                     ; 305         ITC->ISPR6 &= Mask;
 869  01a4 c67f75        	ld	a,32629
 870  01a7 1401          	and	a,(OFST-1,sp)
 871  01a9 c77f75        	ld	32629,a
 872                     ; 306         ITC->ISPR6 |= NewPriority;
 874  01ac c67f75        	ld	a,32629
 875  01af 1a02          	or	a,(OFST+0,sp)
 876  01b1 c77f75        	ld	32629,a
 877                     ; 307         break;
 879  01b4 2010          	jra	L362
 880  01b6               L322:
 881                     ; 309     case ITC_IRQ_EEPROM_EEC:
 881                     ; 310         ITC->ISPR7 &= Mask;
 883  01b6 c67f76        	ld	a,32630
 884  01b9 1401          	and	a,(OFST-1,sp)
 885  01bb c77f76        	ld	32630,a
 886                     ; 311         ITC->ISPR7 |= NewPriority;
 888  01be c67f76        	ld	a,32630
 889  01c1 1a02          	or	a,(OFST+0,sp)
 890  01c3 c77f76        	ld	32630,a
 891                     ; 312         break;
 893  01c6               L522:
 894                     ; 314     default:
 894                     ; 315         break;
 896  01c6               L362:
 897                     ; 319 }
 900  01c6 5b04          	addw	sp,#4
 901  01c8 81            	ret
 914                     	xdef	_ITC_GetSoftwarePriority
 915                     	xdef	_ITC_SetSoftwarePriority
 916                     	xdef	_ITC_GetSoftIntStatus
 917                     	xdef	_ITC_DeInit
 918                     	xdef	_ITC_GetCPUCC
 919                     	xref	_assert_failed
 920                     	switch	.const
 921  0064               L102:
 922  0064 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_i"
 923  0076 74632e6300    	dc.b	"tc.c",0
 943                     	end
