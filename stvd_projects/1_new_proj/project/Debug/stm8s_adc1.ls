   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 48 void ADC1_DeInit(void)
  43                     ; 49 {
  45                     	switch	.text
  46  0000               _ADC1_DeInit:
  50                     ; 50     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  52  0000 725f5400      	clr	21504
  53                     ; 51     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  55  0004 725f5401      	clr	21505
  56                     ; 52     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  58  0008 725f5402      	clr	21506
  59                     ; 53     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  61  000c 725f5403      	clr	21507
  62                     ; 54     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  64  0010 725f5406      	clr	21510
  65                     ; 55     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  67  0014 725f5407      	clr	21511
  68                     ; 56     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  70  0018 35ff5408      	mov	21512,#255
  71                     ; 57     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  73  001c 35035409      	mov	21513,#3
  74                     ; 58     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  76  0020 725f540a      	clr	21514
  77                     ; 59     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  79  0024 725f540b      	clr	21515
  80                     ; 60     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  82  0028 725f540e      	clr	21518
  83                     ; 61     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  85  002c 725f540f      	clr	21519
  86                     ; 62 }
  89  0030 81            	ret
 541                     ; 85 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 541                     ; 86 {
 542                     	switch	.text
 543  0031               _ADC1_Init:
 545  0031 89            	pushw	x
 546       00000000      OFST:	set	0
 549                     ; 89     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 551  0032 9e            	ld	a,xh
 552  0033 4d            	tnz	a
 553  0034 2705          	jreq	L21
 554  0036 9e            	ld	a,xh
 555  0037 a101          	cp	a,#1
 556  0039 2603          	jrne	L01
 557  003b               L21:
 558  003b 4f            	clr	a
 559  003c 2010          	jra	L41
 560  003e               L01:
 561  003e ae0059        	ldw	x,#89
 562  0041 89            	pushw	x
 563  0042 ae0000        	ldw	x,#0
 564  0045 89            	pushw	x
 565  0046 ae0000        	ldw	x,#L542
 566  0049 cd0000        	call	_assert_failed
 568  004c 5b04          	addw	sp,#4
 569  004e               L41:
 570                     ; 90     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 572  004e 0d02          	tnz	(OFST+2,sp)
 573  0050 273c          	jreq	L02
 574  0052 7b02          	ld	a,(OFST+2,sp)
 575  0054 a101          	cp	a,#1
 576  0056 2736          	jreq	L02
 577  0058 7b02          	ld	a,(OFST+2,sp)
 578  005a a102          	cp	a,#2
 579  005c 2730          	jreq	L02
 580  005e 7b02          	ld	a,(OFST+2,sp)
 581  0060 a103          	cp	a,#3
 582  0062 272a          	jreq	L02
 583  0064 7b02          	ld	a,(OFST+2,sp)
 584  0066 a104          	cp	a,#4
 585  0068 2724          	jreq	L02
 586  006a 7b02          	ld	a,(OFST+2,sp)
 587  006c a105          	cp	a,#5
 588  006e 271e          	jreq	L02
 589  0070 7b02          	ld	a,(OFST+2,sp)
 590  0072 a106          	cp	a,#6
 591  0074 2718          	jreq	L02
 592  0076 7b02          	ld	a,(OFST+2,sp)
 593  0078 a107          	cp	a,#7
 594  007a 2712          	jreq	L02
 595  007c 7b02          	ld	a,(OFST+2,sp)
 596  007e a108          	cp	a,#8
 597  0080 270c          	jreq	L02
 598  0082 7b02          	ld	a,(OFST+2,sp)
 599  0084 a10c          	cp	a,#12
 600  0086 2706          	jreq	L02
 601  0088 7b02          	ld	a,(OFST+2,sp)
 602  008a a109          	cp	a,#9
 603  008c 2603          	jrne	L61
 604  008e               L02:
 605  008e 4f            	clr	a
 606  008f 2010          	jra	L22
 607  0091               L61:
 608  0091 ae005a        	ldw	x,#90
 609  0094 89            	pushw	x
 610  0095 ae0000        	ldw	x,#0
 611  0098 89            	pushw	x
 612  0099 ae0000        	ldw	x,#L542
 613  009c cd0000        	call	_assert_failed
 615  009f 5b04          	addw	sp,#4
 616  00a1               L22:
 617                     ; 91     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 619  00a1 0d05          	tnz	(OFST+5,sp)
 620  00a3 272a          	jreq	L62
 621  00a5 7b05          	ld	a,(OFST+5,sp)
 622  00a7 a110          	cp	a,#16
 623  00a9 2724          	jreq	L62
 624  00ab 7b05          	ld	a,(OFST+5,sp)
 625  00ad a120          	cp	a,#32
 626  00af 271e          	jreq	L62
 627  00b1 7b05          	ld	a,(OFST+5,sp)
 628  00b3 a130          	cp	a,#48
 629  00b5 2718          	jreq	L62
 630  00b7 7b05          	ld	a,(OFST+5,sp)
 631  00b9 a140          	cp	a,#64
 632  00bb 2712          	jreq	L62
 633  00bd 7b05          	ld	a,(OFST+5,sp)
 634  00bf a150          	cp	a,#80
 635  00c1 270c          	jreq	L62
 636  00c3 7b05          	ld	a,(OFST+5,sp)
 637  00c5 a160          	cp	a,#96
 638  00c7 2706          	jreq	L62
 639  00c9 7b05          	ld	a,(OFST+5,sp)
 640  00cb a170          	cp	a,#112
 641  00cd 2603          	jrne	L42
 642  00cf               L62:
 643  00cf 4f            	clr	a
 644  00d0 2010          	jra	L03
 645  00d2               L42:
 646  00d2 ae005b        	ldw	x,#91
 647  00d5 89            	pushw	x
 648  00d6 ae0000        	ldw	x,#0
 649  00d9 89            	pushw	x
 650  00da ae0000        	ldw	x,#L542
 651  00dd cd0000        	call	_assert_failed
 653  00e0 5b04          	addw	sp,#4
 654  00e2               L03:
 655                     ; 92     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 657  00e2 0d06          	tnz	(OFST+6,sp)
 658  00e4 2706          	jreq	L43
 659  00e6 7b06          	ld	a,(OFST+6,sp)
 660  00e8 a110          	cp	a,#16
 661  00ea 2603          	jrne	L23
 662  00ec               L43:
 663  00ec 4f            	clr	a
 664  00ed 2010          	jra	L63
 665  00ef               L23:
 666  00ef ae005c        	ldw	x,#92
 667  00f2 89            	pushw	x
 668  00f3 ae0000        	ldw	x,#0
 669  00f6 89            	pushw	x
 670  00f7 ae0000        	ldw	x,#L542
 671  00fa cd0000        	call	_assert_failed
 673  00fd 5b04          	addw	sp,#4
 674  00ff               L63:
 675                     ; 93     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 677  00ff 0d07          	tnz	(OFST+7,sp)
 678  0101 2706          	jreq	L24
 679  0103 7b07          	ld	a,(OFST+7,sp)
 680  0105 a101          	cp	a,#1
 681  0107 2603          	jrne	L04
 682  0109               L24:
 683  0109 4f            	clr	a
 684  010a 2010          	jra	L44
 685  010c               L04:
 686  010c ae005d        	ldw	x,#93
 687  010f 89            	pushw	x
 688  0110 ae0000        	ldw	x,#0
 689  0113 89            	pushw	x
 690  0114 ae0000        	ldw	x,#L542
 691  0117 cd0000        	call	_assert_failed
 693  011a 5b04          	addw	sp,#4
 694  011c               L44:
 695                     ; 94     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 697  011c 0d08          	tnz	(OFST+8,sp)
 698  011e 2706          	jreq	L05
 699  0120 7b08          	ld	a,(OFST+8,sp)
 700  0122 a108          	cp	a,#8
 701  0124 2603          	jrne	L64
 702  0126               L05:
 703  0126 4f            	clr	a
 704  0127 2010          	jra	L25
 705  0129               L64:
 706  0129 ae005e        	ldw	x,#94
 707  012c 89            	pushw	x
 708  012d ae0000        	ldw	x,#0
 709  0130 89            	pushw	x
 710  0131 ae0000        	ldw	x,#L542
 711  0134 cd0000        	call	_assert_failed
 713  0137 5b04          	addw	sp,#4
 714  0139               L25:
 715                     ; 95     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 717  0139 0d09          	tnz	(OFST+9,sp)
 718  013b 2742          	jreq	L65
 719  013d 7b09          	ld	a,(OFST+9,sp)
 720  013f a101          	cp	a,#1
 721  0141 273c          	jreq	L65
 722  0143 7b09          	ld	a,(OFST+9,sp)
 723  0145 a102          	cp	a,#2
 724  0147 2736          	jreq	L65
 725  0149 7b09          	ld	a,(OFST+9,sp)
 726  014b a103          	cp	a,#3
 727  014d 2730          	jreq	L65
 728  014f 7b09          	ld	a,(OFST+9,sp)
 729  0151 a104          	cp	a,#4
 730  0153 272a          	jreq	L65
 731  0155 7b09          	ld	a,(OFST+9,sp)
 732  0157 a105          	cp	a,#5
 733  0159 2724          	jreq	L65
 734  015b 7b09          	ld	a,(OFST+9,sp)
 735  015d a106          	cp	a,#6
 736  015f 271e          	jreq	L65
 737  0161 7b09          	ld	a,(OFST+9,sp)
 738  0163 a107          	cp	a,#7
 739  0165 2718          	jreq	L65
 740  0167 7b09          	ld	a,(OFST+9,sp)
 741  0169 a108          	cp	a,#8
 742  016b 2712          	jreq	L65
 743  016d 7b09          	ld	a,(OFST+9,sp)
 744  016f a10c          	cp	a,#12
 745  0171 270c          	jreq	L65
 746  0173 7b09          	ld	a,(OFST+9,sp)
 747  0175 a1ff          	cp	a,#255
 748  0177 2706          	jreq	L65
 749  0179 7b09          	ld	a,(OFST+9,sp)
 750  017b a109          	cp	a,#9
 751  017d 2603          	jrne	L45
 752  017f               L65:
 753  017f 4f            	clr	a
 754  0180 2010          	jra	L06
 755  0182               L45:
 756  0182 ae005f        	ldw	x,#95
 757  0185 89            	pushw	x
 758  0186 ae0000        	ldw	x,#0
 759  0189 89            	pushw	x
 760  018a ae0000        	ldw	x,#L542
 761  018d cd0000        	call	_assert_failed
 763  0190 5b04          	addw	sp,#4
 764  0192               L06:
 765                     ; 96     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 767  0192 0d0a          	tnz	(OFST+10,sp)
 768  0194 2706          	jreq	L46
 769  0196 7b0a          	ld	a,(OFST+10,sp)
 770  0198 a101          	cp	a,#1
 771  019a 2603          	jrne	L26
 772  019c               L46:
 773  019c 4f            	clr	a
 774  019d 2010          	jra	L66
 775  019f               L26:
 776  019f ae0060        	ldw	x,#96
 777  01a2 89            	pushw	x
 778  01a3 ae0000        	ldw	x,#0
 779  01a6 89            	pushw	x
 780  01a7 ae0000        	ldw	x,#L542
 781  01aa cd0000        	call	_assert_failed
 783  01ad 5b04          	addw	sp,#4
 784  01af               L66:
 785                     ; 101     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 787  01af 7b08          	ld	a,(OFST+8,sp)
 788  01b1 88            	push	a
 789  01b2 7b03          	ld	a,(OFST+3,sp)
 790  01b4 97            	ld	xl,a
 791  01b5 7b02          	ld	a,(OFST+2,sp)
 792  01b7 95            	ld	xh,a
 793  01b8 cd03ed        	call	_ADC1_ConversionConfig
 795  01bb 84            	pop	a
 796                     ; 103     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 798  01bc 7b05          	ld	a,(OFST+5,sp)
 799  01be cd02ae        	call	_ADC1_PrescalerConfig
 801                     ; 108     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 803  01c1 7b07          	ld	a,(OFST+7,sp)
 804  01c3 97            	ld	xl,a
 805  01c4 7b06          	ld	a,(OFST+6,sp)
 806  01c6 95            	ld	xh,a
 807  01c7 cd04a8        	call	_ADC1_ExternalTriggerConfig
 809                     ; 113     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 811  01ca 7b0a          	ld	a,(OFST+10,sp)
 812  01cc 97            	ld	xl,a
 813  01cd 7b09          	ld	a,(OFST+9,sp)
 814  01cf 95            	ld	xh,a
 815  01d0 cd02f3        	call	_ADC1_SchmittTriggerConfig
 817                     ; 116     ADC1->CR1 |= ADC1_CR1_ADON;
 819  01d3 72105401      	bset	21505,#0
 820                     ; 118 }
 823  01d7 85            	popw	x
 824  01d8 81            	ret
 860                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 860                     ; 127 {
 861                     	switch	.text
 862  01d9               _ADC1_Cmd:
 864  01d9 88            	push	a
 865       00000000      OFST:	set	0
 868                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 870  01da 4d            	tnz	a
 871  01db 2704          	jreq	L47
 872  01dd a101          	cp	a,#1
 873  01df 2603          	jrne	L27
 874  01e1               L47:
 875  01e1 4f            	clr	a
 876  01e2 2010          	jra	L67
 877  01e4               L27:
 878  01e4 ae0082        	ldw	x,#130
 879  01e7 89            	pushw	x
 880  01e8 ae0000        	ldw	x,#0
 881  01eb 89            	pushw	x
 882  01ec ae0000        	ldw	x,#L542
 883  01ef cd0000        	call	_assert_failed
 885  01f2 5b04          	addw	sp,#4
 886  01f4               L67:
 887                     ; 132     if (NewState != DISABLE)
 889  01f4 0d01          	tnz	(OFST+1,sp)
 890  01f6 2706          	jreq	L562
 891                     ; 134         ADC1->CR1 |= ADC1_CR1_ADON;
 893  01f8 72105401      	bset	21505,#0
 895  01fc 2004          	jra	L762
 896  01fe               L562:
 897                     ; 138         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 899  01fe 72115401      	bres	21505,#0
 900  0202               L762:
 901                     ; 141 }
 904  0202 84            	pop	a
 905  0203 81            	ret
 941                     ; 148 void ADC1_ScanModeCmd(FunctionalState NewState)
 941                     ; 149 {
 942                     	switch	.text
 943  0204               _ADC1_ScanModeCmd:
 945  0204 88            	push	a
 946       00000000      OFST:	set	0
 949                     ; 152     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 951  0205 4d            	tnz	a
 952  0206 2704          	jreq	L401
 953  0208 a101          	cp	a,#1
 954  020a 2603          	jrne	L201
 955  020c               L401:
 956  020c 4f            	clr	a
 957  020d 2010          	jra	L601
 958  020f               L201:
 959  020f ae0098        	ldw	x,#152
 960  0212 89            	pushw	x
 961  0213 ae0000        	ldw	x,#0
 962  0216 89            	pushw	x
 963  0217 ae0000        	ldw	x,#L542
 964  021a cd0000        	call	_assert_failed
 966  021d 5b04          	addw	sp,#4
 967  021f               L601:
 968                     ; 154     if (NewState != DISABLE)
 970  021f 0d01          	tnz	(OFST+1,sp)
 971  0221 2706          	jreq	L703
 972                     ; 156         ADC1->CR2 |= ADC1_CR2_SCAN;
 974  0223 72125402      	bset	21506,#1
 976  0227 2004          	jra	L113
 977  0229               L703:
 978                     ; 160         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 980  0229 72135402      	bres	21506,#1
 981  022d               L113:
 982                     ; 163 }
 985  022d 84            	pop	a
 986  022e 81            	ret
1022                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
1022                     ; 171 {
1023                     	switch	.text
1024  022f               _ADC1_DataBufferCmd:
1026  022f 88            	push	a
1027       00000000      OFST:	set	0
1030                     ; 174     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1032  0230 4d            	tnz	a
1033  0231 2704          	jreq	L411
1034  0233 a101          	cp	a,#1
1035  0235 2603          	jrne	L211
1036  0237               L411:
1037  0237 4f            	clr	a
1038  0238 2010          	jra	L611
1039  023a               L211:
1040  023a ae00ae        	ldw	x,#174
1041  023d 89            	pushw	x
1042  023e ae0000        	ldw	x,#0
1043  0241 89            	pushw	x
1044  0242 ae0000        	ldw	x,#L542
1045  0245 cd0000        	call	_assert_failed
1047  0248 5b04          	addw	sp,#4
1048  024a               L611:
1049                     ; 176     if (NewState != DISABLE)
1051  024a 0d01          	tnz	(OFST+1,sp)
1052  024c 2706          	jreq	L133
1053                     ; 178         ADC1->CR3 |= ADC1_CR3_DBUF;
1055  024e 721e5403      	bset	21507,#7
1057  0252 2004          	jra	L333
1058  0254               L133:
1059                     ; 182         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
1061  0254 721f5403      	bres	21507,#7
1062  0258               L333:
1063                     ; 185 }
1066  0258 84            	pop	a
1067  0259 81            	ret
1224                     ; 196 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
1224                     ; 197 {
1225                     	switch	.text
1226  025a               _ADC1_ITConfig:
1228  025a 89            	pushw	x
1229       00000000      OFST:	set	0
1232                     ; 200     assert_param(IS_ADC1_IT_OK(ADC1_IT));
1234  025b a30020        	cpw	x,#32
1235  025e 2705          	jreq	L421
1236  0260 a30010        	cpw	x,#16
1237  0263 2603          	jrne	L221
1238  0265               L421:
1239  0265 4f            	clr	a
1240  0266 2010          	jra	L621
1241  0268               L221:
1242  0268 ae00c8        	ldw	x,#200
1243  026b 89            	pushw	x
1244  026c ae0000        	ldw	x,#0
1245  026f 89            	pushw	x
1246  0270 ae0000        	ldw	x,#L542
1247  0273 cd0000        	call	_assert_failed
1249  0276 5b04          	addw	sp,#4
1250  0278               L621:
1251                     ; 201     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1253  0278 0d05          	tnz	(OFST+5,sp)
1254  027a 2706          	jreq	L231
1255  027c 7b05          	ld	a,(OFST+5,sp)
1256  027e a101          	cp	a,#1
1257  0280 2603          	jrne	L031
1258  0282               L231:
1259  0282 4f            	clr	a
1260  0283 2010          	jra	L431
1261  0285               L031:
1262  0285 ae00c9        	ldw	x,#201
1263  0288 89            	pushw	x
1264  0289 ae0000        	ldw	x,#0
1265  028c 89            	pushw	x
1266  028d ae0000        	ldw	x,#L542
1267  0290 cd0000        	call	_assert_failed
1269  0293 5b04          	addw	sp,#4
1270  0295               L431:
1271                     ; 203     if (NewState != DISABLE)
1273  0295 0d05          	tnz	(OFST+5,sp)
1274  0297 270a          	jreq	L124
1275                     ; 206         ADC1->CSR |= (uint8_t)ADC1_IT;
1277  0299 c65400        	ld	a,21504
1278  029c 1a02          	or	a,(OFST+2,sp)
1279  029e c75400        	ld	21504,a
1281  02a1 2009          	jra	L324
1282  02a3               L124:
1283                     ; 211         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
1285  02a3 7b02          	ld	a,(OFST+2,sp)
1286  02a5 43            	cpl	a
1287  02a6 c45400        	and	a,21504
1288  02a9 c75400        	ld	21504,a
1289  02ac               L324:
1290                     ; 214 }
1293  02ac 85            	popw	x
1294  02ad 81            	ret
1331                     ; 222 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1331                     ; 223 {
1332                     	switch	.text
1333  02ae               _ADC1_PrescalerConfig:
1335  02ae 88            	push	a
1336       00000000      OFST:	set	0
1339                     ; 226     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1341  02af 4d            	tnz	a
1342  02b0 271c          	jreq	L241
1343  02b2 a110          	cp	a,#16
1344  02b4 2718          	jreq	L241
1345  02b6 a120          	cp	a,#32
1346  02b8 2714          	jreq	L241
1347  02ba a130          	cp	a,#48
1348  02bc 2710          	jreq	L241
1349  02be a140          	cp	a,#64
1350  02c0 270c          	jreq	L241
1351  02c2 a150          	cp	a,#80
1352  02c4 2708          	jreq	L241
1353  02c6 a160          	cp	a,#96
1354  02c8 2704          	jreq	L241
1355  02ca a170          	cp	a,#112
1356  02cc 2603          	jrne	L041
1357  02ce               L241:
1358  02ce 4f            	clr	a
1359  02cf 2010          	jra	L441
1360  02d1               L041:
1361  02d1 ae00e2        	ldw	x,#226
1362  02d4 89            	pushw	x
1363  02d5 ae0000        	ldw	x,#0
1364  02d8 89            	pushw	x
1365  02d9 ae0000        	ldw	x,#L542
1366  02dc cd0000        	call	_assert_failed
1368  02df 5b04          	addw	sp,#4
1369  02e1               L441:
1370                     ; 229     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1372  02e1 c65401        	ld	a,21505
1373  02e4 a48f          	and	a,#143
1374  02e6 c75401        	ld	21505,a
1375                     ; 231     ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1377  02e9 c65401        	ld	a,21505
1378  02ec 1a01          	or	a,(OFST+1,sp)
1379  02ee c75401        	ld	21505,a
1380                     ; 233 }
1383  02f1 84            	pop	a
1384  02f2 81            	ret
1432                     ; 244 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1432                     ; 245 {
1433                     	switch	.text
1434  02f3               _ADC1_SchmittTriggerConfig:
1436  02f3 89            	pushw	x
1437       00000000      OFST:	set	0
1440                     ; 248     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1442  02f4 9e            	ld	a,xh
1443  02f5 4d            	tnz	a
1444  02f6 2737          	jreq	L251
1445  02f8 9e            	ld	a,xh
1446  02f9 a101          	cp	a,#1
1447  02fb 2732          	jreq	L251
1448  02fd 9e            	ld	a,xh
1449  02fe a102          	cp	a,#2
1450  0300 272d          	jreq	L251
1451  0302 9e            	ld	a,xh
1452  0303 a103          	cp	a,#3
1453  0305 2728          	jreq	L251
1454  0307 9e            	ld	a,xh
1455  0308 a104          	cp	a,#4
1456  030a 2723          	jreq	L251
1457  030c 9e            	ld	a,xh
1458  030d a105          	cp	a,#5
1459  030f 271e          	jreq	L251
1460  0311 9e            	ld	a,xh
1461  0312 a106          	cp	a,#6
1462  0314 2719          	jreq	L251
1463  0316 9e            	ld	a,xh
1464  0317 a107          	cp	a,#7
1465  0319 2714          	jreq	L251
1466  031b 9e            	ld	a,xh
1467  031c a108          	cp	a,#8
1468  031e 270f          	jreq	L251
1469  0320 9e            	ld	a,xh
1470  0321 a10c          	cp	a,#12
1471  0323 270a          	jreq	L251
1472  0325 9e            	ld	a,xh
1473  0326 a1ff          	cp	a,#255
1474  0328 2705          	jreq	L251
1475  032a 9e            	ld	a,xh
1476  032b a109          	cp	a,#9
1477  032d 2603          	jrne	L051
1478  032f               L251:
1479  032f 4f            	clr	a
1480  0330 2010          	jra	L451
1481  0332               L051:
1482  0332 ae00f8        	ldw	x,#248
1483  0335 89            	pushw	x
1484  0336 ae0000        	ldw	x,#0
1485  0339 89            	pushw	x
1486  033a ae0000        	ldw	x,#L542
1487  033d cd0000        	call	_assert_failed
1489  0340 5b04          	addw	sp,#4
1490  0342               L451:
1491                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1493  0342 0d02          	tnz	(OFST+2,sp)
1494  0344 2706          	jreq	L061
1495  0346 7b02          	ld	a,(OFST+2,sp)
1496  0348 a101          	cp	a,#1
1497  034a 2603          	jrne	L651
1498  034c               L061:
1499  034c 4f            	clr	a
1500  034d 2010          	jra	L261
1501  034f               L651:
1502  034f ae00f9        	ldw	x,#249
1503  0352 89            	pushw	x
1504  0353 ae0000        	ldw	x,#0
1505  0356 89            	pushw	x
1506  0357 ae0000        	ldw	x,#L542
1507  035a cd0000        	call	_assert_failed
1509  035d 5b04          	addw	sp,#4
1510  035f               L261:
1511                     ; 251     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1513  035f 7b01          	ld	a,(OFST+1,sp)
1514  0361 a1ff          	cp	a,#255
1515  0363 2620          	jrne	L564
1516                     ; 253         if (NewState != DISABLE)
1518  0365 0d02          	tnz	(OFST+2,sp)
1519  0367 270a          	jreq	L764
1520                     ; 255             ADC1->TDRL &= (uint8_t)0x0;
1522  0369 725f5407      	clr	21511
1523                     ; 256             ADC1->TDRH &= (uint8_t)0x0;
1525  036d 725f5406      	clr	21510
1527  0371 2078          	jra	L374
1528  0373               L764:
1529                     ; 260             ADC1->TDRL |= (uint8_t)0xFF;
1531  0373 c65407        	ld	a,21511
1532  0376 aaff          	or	a,#255
1533  0378 c75407        	ld	21511,a
1534                     ; 261             ADC1->TDRH |= (uint8_t)0xFF;
1536  037b c65406        	ld	a,21510
1537  037e aaff          	or	a,#255
1538  0380 c75406        	ld	21510,a
1539  0383 2066          	jra	L374
1540  0385               L564:
1541                     ; 264     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1543  0385 7b01          	ld	a,(OFST+1,sp)
1544  0387 a108          	cp	a,#8
1545  0389 242f          	jruge	L574
1546                     ; 266         if (NewState != DISABLE)
1548  038b 0d02          	tnz	(OFST+2,sp)
1549  038d 2716          	jreq	L774
1550                     ; 268             ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1552  038f 7b01          	ld	a,(OFST+1,sp)
1553  0391 5f            	clrw	x
1554  0392 97            	ld	xl,a
1555  0393 a601          	ld	a,#1
1556  0395 5d            	tnzw	x
1557  0396 2704          	jreq	L461
1558  0398               L661:
1559  0398 48            	sll	a
1560  0399 5a            	decw	x
1561  039a 26fc          	jrne	L661
1562  039c               L461:
1563  039c 43            	cpl	a
1564  039d c45407        	and	a,21511
1565  03a0 c75407        	ld	21511,a
1567  03a3 2046          	jra	L374
1568  03a5               L774:
1569                     ; 272             ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1571  03a5 7b01          	ld	a,(OFST+1,sp)
1572  03a7 5f            	clrw	x
1573  03a8 97            	ld	xl,a
1574  03a9 a601          	ld	a,#1
1575  03ab 5d            	tnzw	x
1576  03ac 2704          	jreq	L071
1577  03ae               L271:
1578  03ae 48            	sll	a
1579  03af 5a            	decw	x
1580  03b0 26fc          	jrne	L271
1581  03b2               L071:
1582  03b2 ca5407        	or	a,21511
1583  03b5 c75407        	ld	21511,a
1584  03b8 2031          	jra	L374
1585  03ba               L574:
1586                     ; 277         if (NewState != DISABLE)
1588  03ba 0d02          	tnz	(OFST+2,sp)
1589  03bc 2718          	jreq	L505
1590                     ; 279             ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1592  03be 7b01          	ld	a,(OFST+1,sp)
1593  03c0 a008          	sub	a,#8
1594  03c2 5f            	clrw	x
1595  03c3 97            	ld	xl,a
1596  03c4 a601          	ld	a,#1
1597  03c6 5d            	tnzw	x
1598  03c7 2704          	jreq	L471
1599  03c9               L671:
1600  03c9 48            	sll	a
1601  03ca 5a            	decw	x
1602  03cb 26fc          	jrne	L671
1603  03cd               L471:
1604  03cd 43            	cpl	a
1605  03ce c45406        	and	a,21510
1606  03d1 c75406        	ld	21510,a
1608  03d4 2015          	jra	L374
1609  03d6               L505:
1610                     ; 283             ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1612  03d6 7b01          	ld	a,(OFST+1,sp)
1613  03d8 a008          	sub	a,#8
1614  03da 5f            	clrw	x
1615  03db 97            	ld	xl,a
1616  03dc a601          	ld	a,#1
1617  03de 5d            	tnzw	x
1618  03df 2704          	jreq	L002
1619  03e1               L202:
1620  03e1 48            	sll	a
1621  03e2 5a            	decw	x
1622  03e3 26fc          	jrne	L202
1623  03e5               L002:
1624  03e5 ca5406        	or	a,21510
1625  03e8 c75406        	ld	21510,a
1626  03eb               L374:
1627                     ; 287 }
1630  03eb 85            	popw	x
1631  03ec 81            	ret
1689                     ; 300 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1689                     ; 301 {
1690                     	switch	.text
1691  03ed               _ADC1_ConversionConfig:
1693  03ed 89            	pushw	x
1694       00000000      OFST:	set	0
1697                     ; 304     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1699  03ee 9e            	ld	a,xh
1700  03ef 4d            	tnz	a
1701  03f0 2705          	jreq	L012
1702  03f2 9e            	ld	a,xh
1703  03f3 a101          	cp	a,#1
1704  03f5 2603          	jrne	L602
1705  03f7               L012:
1706  03f7 4f            	clr	a
1707  03f8 2010          	jra	L212
1708  03fa               L602:
1709  03fa ae0130        	ldw	x,#304
1710  03fd 89            	pushw	x
1711  03fe ae0000        	ldw	x,#0
1712  0401 89            	pushw	x
1713  0402 ae0000        	ldw	x,#L542
1714  0405 cd0000        	call	_assert_failed
1716  0408 5b04          	addw	sp,#4
1717  040a               L212:
1718                     ; 305     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1720  040a 0d02          	tnz	(OFST+2,sp)
1721  040c 273c          	jreq	L612
1722  040e 7b02          	ld	a,(OFST+2,sp)
1723  0410 a101          	cp	a,#1
1724  0412 2736          	jreq	L612
1725  0414 7b02          	ld	a,(OFST+2,sp)
1726  0416 a102          	cp	a,#2
1727  0418 2730          	jreq	L612
1728  041a 7b02          	ld	a,(OFST+2,sp)
1729  041c a103          	cp	a,#3
1730  041e 272a          	jreq	L612
1731  0420 7b02          	ld	a,(OFST+2,sp)
1732  0422 a104          	cp	a,#4
1733  0424 2724          	jreq	L612
1734  0426 7b02          	ld	a,(OFST+2,sp)
1735  0428 a105          	cp	a,#5
1736  042a 271e          	jreq	L612
1737  042c 7b02          	ld	a,(OFST+2,sp)
1738  042e a106          	cp	a,#6
1739  0430 2718          	jreq	L612
1740  0432 7b02          	ld	a,(OFST+2,sp)
1741  0434 a107          	cp	a,#7
1742  0436 2712          	jreq	L612
1743  0438 7b02          	ld	a,(OFST+2,sp)
1744  043a a108          	cp	a,#8
1745  043c 270c          	jreq	L612
1746  043e 7b02          	ld	a,(OFST+2,sp)
1747  0440 a10c          	cp	a,#12
1748  0442 2706          	jreq	L612
1749  0444 7b02          	ld	a,(OFST+2,sp)
1750  0446 a109          	cp	a,#9
1751  0448 2603          	jrne	L412
1752  044a               L612:
1753  044a 4f            	clr	a
1754  044b 2010          	jra	L022
1755  044d               L412:
1756  044d ae0131        	ldw	x,#305
1757  0450 89            	pushw	x
1758  0451 ae0000        	ldw	x,#0
1759  0454 89            	pushw	x
1760  0455 ae0000        	ldw	x,#L542
1761  0458 cd0000        	call	_assert_failed
1763  045b 5b04          	addw	sp,#4
1764  045d               L022:
1765                     ; 306     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1767  045d 0d05          	tnz	(OFST+5,sp)
1768  045f 2706          	jreq	L422
1769  0461 7b05          	ld	a,(OFST+5,sp)
1770  0463 a108          	cp	a,#8
1771  0465 2603          	jrne	L222
1772  0467               L422:
1773  0467 4f            	clr	a
1774  0468 2010          	jra	L622
1775  046a               L222:
1776  046a ae0132        	ldw	x,#306
1777  046d 89            	pushw	x
1778  046e ae0000        	ldw	x,#0
1779  0471 89            	pushw	x
1780  0472 ae0000        	ldw	x,#L542
1781  0475 cd0000        	call	_assert_failed
1783  0478 5b04          	addw	sp,#4
1784  047a               L622:
1785                     ; 309     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1787  047a 72175402      	bres	21506,#3
1788                     ; 311     ADC1->CR2 |= (uint8_t)(ADC1_Align);
1790  047e c65402        	ld	a,21506
1791  0481 1a05          	or	a,(OFST+5,sp)
1792  0483 c75402        	ld	21506,a
1793                     ; 313     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1795  0486 7b01          	ld	a,(OFST+1,sp)
1796  0488 a101          	cp	a,#1
1797  048a 2606          	jrne	L735
1798                     ; 316         ADC1->CR1 |= ADC1_CR1_CONT;
1800  048c 72125401      	bset	21505,#1
1802  0490 2004          	jra	L145
1803  0492               L735:
1804                     ; 321         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1806  0492 72135401      	bres	21505,#1
1807  0496               L145:
1808                     ; 325     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1810  0496 c65400        	ld	a,21504
1811  0499 a4f0          	and	a,#240
1812  049b c75400        	ld	21504,a
1813                     ; 327     ADC1->CSR |= (uint8_t)(ADC1_Channel);
1815  049e c65400        	ld	a,21504
1816  04a1 1a02          	or	a,(OFST+2,sp)
1817  04a3 c75400        	ld	21504,a
1818                     ; 329 }
1821  04a6 85            	popw	x
1822  04a7 81            	ret
1869                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1869                     ; 343 {
1870                     	switch	.text
1871  04a8               _ADC1_ExternalTriggerConfig:
1873  04a8 89            	pushw	x
1874       00000000      OFST:	set	0
1877                     ; 346     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1879  04a9 9e            	ld	a,xh
1880  04aa 4d            	tnz	a
1881  04ab 2705          	jreq	L432
1882  04ad 9e            	ld	a,xh
1883  04ae a110          	cp	a,#16
1884  04b0 2603          	jrne	L232
1885  04b2               L432:
1886  04b2 4f            	clr	a
1887  04b3 2010          	jra	L632
1888  04b5               L232:
1889  04b5 ae015a        	ldw	x,#346
1890  04b8 89            	pushw	x
1891  04b9 ae0000        	ldw	x,#0
1892  04bc 89            	pushw	x
1893  04bd ae0000        	ldw	x,#L542
1894  04c0 cd0000        	call	_assert_failed
1896  04c3 5b04          	addw	sp,#4
1897  04c5               L632:
1898                     ; 347     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1900  04c5 0d02          	tnz	(OFST+2,sp)
1901  04c7 2706          	jreq	L242
1902  04c9 7b02          	ld	a,(OFST+2,sp)
1903  04cb a101          	cp	a,#1
1904  04cd 2603          	jrne	L042
1905  04cf               L242:
1906  04cf 4f            	clr	a
1907  04d0 2010          	jra	L442
1908  04d2               L042:
1909  04d2 ae015b        	ldw	x,#347
1910  04d5 89            	pushw	x
1911  04d6 ae0000        	ldw	x,#0
1912  04d9 89            	pushw	x
1913  04da ae0000        	ldw	x,#L542
1914  04dd cd0000        	call	_assert_failed
1916  04e0 5b04          	addw	sp,#4
1917  04e2               L442:
1918                     ; 350     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1920  04e2 c65402        	ld	a,21506
1921  04e5 a4cf          	and	a,#207
1922  04e7 c75402        	ld	21506,a
1923                     ; 352     if (NewState != DISABLE)
1925  04ea 0d02          	tnz	(OFST+2,sp)
1926  04ec 2706          	jreq	L565
1927                     ; 355         ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1929  04ee 721c5402      	bset	21506,#6
1931  04f2 2004          	jra	L765
1932  04f4               L565:
1933                     ; 360         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1935  04f4 721d5402      	bres	21506,#6
1936  04f8               L765:
1937                     ; 364     ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1939  04f8 c65402        	ld	a,21506
1940  04fb 1a01          	or	a,(OFST+1,sp)
1941  04fd c75402        	ld	21506,a
1942                     ; 366 }
1945  0500 85            	popw	x
1946  0501 81            	ret
1970                     ; 378 void ADC1_StartConversion(void)
1970                     ; 379 {
1971                     	switch	.text
1972  0502               _ADC1_StartConversion:
1976                     ; 380     ADC1->CR1 |= ADC1_CR1_ADON;
1978  0502 72105401      	bset	21505,#0
1979                     ; 381 }
1982  0506 81            	ret
2026                     ; 390 uint16_t ADC1_GetConversionValue(void)
2026                     ; 391 {
2027                     	switch	.text
2028  0507               _ADC1_GetConversionValue:
2030  0507 5205          	subw	sp,#5
2031       00000005      OFST:	set	5
2034                     ; 393     uint16_t temph = 0;
2036                     ; 394     uint8_t templ = 0;
2038                     ; 396     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
2040  0509 c65402        	ld	a,21506
2041  050c a508          	bcp	a,#8
2042  050e 2715          	jreq	L326
2043                     ; 399         templ = ADC1->DRL;
2045  0510 c65405        	ld	a,21509
2046  0513 6b03          	ld	(OFST-2,sp),a
2047                     ; 401         temph = ADC1->DRH;
2049  0515 c65404        	ld	a,21508
2050  0518 5f            	clrw	x
2051  0519 97            	ld	xl,a
2052  051a 1f04          	ldw	(OFST-1,sp),x
2053                     ; 403         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
2055  051c 1e04          	ldw	x,(OFST-1,sp)
2056  051e 7b03          	ld	a,(OFST-2,sp)
2057  0520 02            	rlwa	x,a
2058  0521 1f04          	ldw	(OFST-1,sp),x
2060  0523 2021          	jra	L526
2061  0525               L326:
2062                     ; 408         temph = ADC1->DRH;
2064  0525 c65404        	ld	a,21508
2065  0528 5f            	clrw	x
2066  0529 97            	ld	xl,a
2067  052a 1f04          	ldw	(OFST-1,sp),x
2068                     ; 410         templ = ADC1->DRL;
2070  052c c65405        	ld	a,21509
2071  052f 6b03          	ld	(OFST-2,sp),a
2072                     ; 412         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
2074  0531 1e04          	ldw	x,(OFST-1,sp)
2075  0533 4f            	clr	a
2076  0534 02            	rlwa	x,a
2077  0535 1f01          	ldw	(OFST-4,sp),x
2078  0537 7b03          	ld	a,(OFST-2,sp)
2079  0539 97            	ld	xl,a
2080  053a a640          	ld	a,#64
2081  053c 42            	mul	x,a
2082  053d 01            	rrwa	x,a
2083  053e 1a02          	or	a,(OFST-3,sp)
2084  0540 01            	rrwa	x,a
2085  0541 1a01          	or	a,(OFST-4,sp)
2086  0543 01            	rrwa	x,a
2087  0544 1f04          	ldw	(OFST-1,sp),x
2088  0546               L526:
2089                     ; 415     return ((uint16_t)temph);
2091  0546 1e04          	ldw	x,(OFST-1,sp)
2094  0548 5b05          	addw	sp,#5
2095  054a 81            	ret
2142                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
2142                     ; 428 {
2143                     	switch	.text
2144  054b               _ADC1_AWDChannelConfig:
2146  054b 89            	pushw	x
2147       00000000      OFST:	set	0
2150                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2152  054c 9f            	ld	a,xl
2153  054d 4d            	tnz	a
2154  054e 2705          	jreq	L652
2155  0550 9f            	ld	a,xl
2156  0551 a101          	cp	a,#1
2157  0553 2603          	jrne	L452
2158  0555               L652:
2159  0555 4f            	clr	a
2160  0556 2010          	jra	L062
2161  0558               L452:
2162  0558 ae01ae        	ldw	x,#430
2163  055b 89            	pushw	x
2164  055c ae0000        	ldw	x,#0
2165  055f 89            	pushw	x
2166  0560 ae0000        	ldw	x,#L542
2167  0563 cd0000        	call	_assert_failed
2169  0566 5b04          	addw	sp,#4
2170  0568               L062:
2171                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
2173  0568 0d01          	tnz	(OFST+1,sp)
2174  056a 273c          	jreq	L462
2175  056c 7b01          	ld	a,(OFST+1,sp)
2176  056e a101          	cp	a,#1
2177  0570 2736          	jreq	L462
2178  0572 7b01          	ld	a,(OFST+1,sp)
2179  0574 a102          	cp	a,#2
2180  0576 2730          	jreq	L462
2181  0578 7b01          	ld	a,(OFST+1,sp)
2182  057a a103          	cp	a,#3
2183  057c 272a          	jreq	L462
2184  057e 7b01          	ld	a,(OFST+1,sp)
2185  0580 a104          	cp	a,#4
2186  0582 2724          	jreq	L462
2187  0584 7b01          	ld	a,(OFST+1,sp)
2188  0586 a105          	cp	a,#5
2189  0588 271e          	jreq	L462
2190  058a 7b01          	ld	a,(OFST+1,sp)
2191  058c a106          	cp	a,#6
2192  058e 2718          	jreq	L462
2193  0590 7b01          	ld	a,(OFST+1,sp)
2194  0592 a107          	cp	a,#7
2195  0594 2712          	jreq	L462
2196  0596 7b01          	ld	a,(OFST+1,sp)
2197  0598 a108          	cp	a,#8
2198  059a 270c          	jreq	L462
2199  059c 7b01          	ld	a,(OFST+1,sp)
2200  059e a10c          	cp	a,#12
2201  05a0 2706          	jreq	L462
2202  05a2 7b01          	ld	a,(OFST+1,sp)
2203  05a4 a109          	cp	a,#9
2204  05a6 2603          	jrne	L262
2205  05a8               L462:
2206  05a8 4f            	clr	a
2207  05a9 2010          	jra	L662
2208  05ab               L262:
2209  05ab ae01af        	ldw	x,#431
2210  05ae 89            	pushw	x
2211  05af ae0000        	ldw	x,#0
2212  05b2 89            	pushw	x
2213  05b3 ae0000        	ldw	x,#L542
2214  05b6 cd0000        	call	_assert_failed
2216  05b9 5b04          	addw	sp,#4
2217  05bb               L662:
2218                     ; 433     if (Channel < (uint8_t)8)
2220  05bb 7b01          	ld	a,(OFST+1,sp)
2221  05bd a108          	cp	a,#8
2222  05bf 242f          	jruge	L156
2223                     ; 435         if (NewState != DISABLE)
2225  05c1 0d02          	tnz	(OFST+2,sp)
2226  05c3 2715          	jreq	L356
2227                     ; 437             ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
2229  05c5 7b01          	ld	a,(OFST+1,sp)
2230  05c7 5f            	clrw	x
2231  05c8 97            	ld	xl,a
2232  05c9 a601          	ld	a,#1
2233  05cb 5d            	tnzw	x
2234  05cc 2704          	jreq	L072
2235  05ce               L272:
2236  05ce 48            	sll	a
2237  05cf 5a            	decw	x
2238  05d0 26fc          	jrne	L272
2239  05d2               L072:
2240  05d2 ca540f        	or	a,21519
2241  05d5 c7540f        	ld	21519,a
2243  05d8 2047          	jra	L756
2244  05da               L356:
2245                     ; 441             ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
2247  05da 7b01          	ld	a,(OFST+1,sp)
2248  05dc 5f            	clrw	x
2249  05dd 97            	ld	xl,a
2250  05de a601          	ld	a,#1
2251  05e0 5d            	tnzw	x
2252  05e1 2704          	jreq	L472
2253  05e3               L672:
2254  05e3 48            	sll	a
2255  05e4 5a            	decw	x
2256  05e5 26fc          	jrne	L672
2257  05e7               L472:
2258  05e7 43            	cpl	a
2259  05e8 c4540f        	and	a,21519
2260  05eb c7540f        	ld	21519,a
2261  05ee 2031          	jra	L756
2262  05f0               L156:
2263                     ; 446         if (NewState != DISABLE)
2265  05f0 0d02          	tnz	(OFST+2,sp)
2266  05f2 2717          	jreq	L166
2267                     ; 448             ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
2269  05f4 7b01          	ld	a,(OFST+1,sp)
2270  05f6 a008          	sub	a,#8
2271  05f8 5f            	clrw	x
2272  05f9 97            	ld	xl,a
2273  05fa a601          	ld	a,#1
2274  05fc 5d            	tnzw	x
2275  05fd 2704          	jreq	L003
2276  05ff               L203:
2277  05ff 48            	sll	a
2278  0600 5a            	decw	x
2279  0601 26fc          	jrne	L203
2280  0603               L003:
2281  0603 ca540e        	or	a,21518
2282  0606 c7540e        	ld	21518,a
2284  0609 2016          	jra	L756
2285  060b               L166:
2286                     ; 452             ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
2288  060b 7b01          	ld	a,(OFST+1,sp)
2289  060d a008          	sub	a,#8
2290  060f 5f            	clrw	x
2291  0610 97            	ld	xl,a
2292  0611 a601          	ld	a,#1
2293  0613 5d            	tnzw	x
2294  0614 2704          	jreq	L403
2295  0616               L603:
2296  0616 48            	sll	a
2297  0617 5a            	decw	x
2298  0618 26fc          	jrne	L603
2299  061a               L403:
2300  061a 43            	cpl	a
2301  061b c4540e        	and	a,21518
2302  061e c7540e        	ld	21518,a
2303  0621               L756:
2304                     ; 455 }
2307  0621 85            	popw	x
2308  0622 81            	ret
2343                     ; 463 void ADC1_SetHighThreshold(uint16_t Threshold)
2343                     ; 464 {
2344                     	switch	.text
2345  0623               _ADC1_SetHighThreshold:
2347  0623 89            	pushw	x
2348       00000000      OFST:	set	0
2351                     ; 465     ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
2353  0624 54            	srlw	x
2354  0625 54            	srlw	x
2355  0626 9f            	ld	a,xl
2356  0627 c75408        	ld	21512,a
2357                     ; 466     ADC1->HTRL = (uint8_t)Threshold;
2359  062a 7b02          	ld	a,(OFST+2,sp)
2360  062c c75409        	ld	21513,a
2361                     ; 467 }
2364  062f 85            	popw	x
2365  0630 81            	ret
2400                     ; 475 void ADC1_SetLowThreshold(uint16_t Threshold)
2400                     ; 476 {
2401                     	switch	.text
2402  0631               _ADC1_SetLowThreshold:
2406                     ; 477     ADC1->LTRL = (uint8_t)Threshold;
2408  0631 9f            	ld	a,xl
2409  0632 c7540b        	ld	21515,a
2410                     ; 478     ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
2412  0635 54            	srlw	x
2413  0636 54            	srlw	x
2414  0637 9f            	ld	a,xl
2415  0638 c7540a        	ld	21514,a
2416                     ; 479 }
2419  063b 81            	ret
2473                     ; 488 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
2473                     ; 489 {
2474                     	switch	.text
2475  063c               _ADC1_GetBufferValue:
2477  063c 88            	push	a
2478  063d 5205          	subw	sp,#5
2479       00000005      OFST:	set	5
2482                     ; 491     uint16_t temph = 0;
2484                     ; 492     uint8_t templ = 0;
2486                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
2488  063f a10a          	cp	a,#10
2489  0641 2403          	jruge	L613
2490  0643 4f            	clr	a
2491  0644 2010          	jra	L023
2492  0646               L613:
2493  0646 ae01ef        	ldw	x,#495
2494  0649 89            	pushw	x
2495  064a ae0000        	ldw	x,#0
2496  064d 89            	pushw	x
2497  064e ae0000        	ldw	x,#L542
2498  0651 cd0000        	call	_assert_failed
2500  0654 5b04          	addw	sp,#4
2501  0656               L023:
2502                     ; 497     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
2504  0656 c65402        	ld	a,21506
2505  0659 a508          	bcp	a,#8
2506  065b 271f          	jreq	L747
2507                     ; 500         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2509  065d 7b06          	ld	a,(OFST+1,sp)
2510  065f 48            	sll	a
2511  0660 5f            	clrw	x
2512  0661 97            	ld	xl,a
2513  0662 d653e1        	ld	a,(21473,x)
2514  0665 6b03          	ld	(OFST-2,sp),a
2515                     ; 502         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2517  0667 7b06          	ld	a,(OFST+1,sp)
2518  0669 48            	sll	a
2519  066a 5f            	clrw	x
2520  066b 97            	ld	xl,a
2521  066c d653e0        	ld	a,(21472,x)
2522  066f 5f            	clrw	x
2523  0670 97            	ld	xl,a
2524  0671 1f04          	ldw	(OFST-1,sp),x
2525                     ; 504         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
2527  0673 1e04          	ldw	x,(OFST-1,sp)
2528  0675 7b03          	ld	a,(OFST-2,sp)
2529  0677 02            	rlwa	x,a
2530  0678 1f04          	ldw	(OFST-1,sp),x
2532  067a 202b          	jra	L157
2533  067c               L747:
2534                     ; 509         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2536  067c 7b06          	ld	a,(OFST+1,sp)
2537  067e 48            	sll	a
2538  067f 5f            	clrw	x
2539  0680 97            	ld	xl,a
2540  0681 d653e0        	ld	a,(21472,x)
2541  0684 5f            	clrw	x
2542  0685 97            	ld	xl,a
2543  0686 1f04          	ldw	(OFST-1,sp),x
2544                     ; 511         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2546  0688 7b06          	ld	a,(OFST+1,sp)
2547  068a 48            	sll	a
2548  068b 5f            	clrw	x
2549  068c 97            	ld	xl,a
2550  068d d653e1        	ld	a,(21473,x)
2551  0690 6b03          	ld	(OFST-2,sp),a
2552                     ; 513         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
2554  0692 1e04          	ldw	x,(OFST-1,sp)
2555  0694 4f            	clr	a
2556  0695 02            	rlwa	x,a
2557  0696 1f01          	ldw	(OFST-4,sp),x
2558  0698 7b03          	ld	a,(OFST-2,sp)
2559  069a 97            	ld	xl,a
2560  069b a640          	ld	a,#64
2561  069d 42            	mul	x,a
2562  069e 01            	rrwa	x,a
2563  069f 1a02          	or	a,(OFST-3,sp)
2564  06a1 01            	rrwa	x,a
2565  06a2 1a01          	or	a,(OFST-4,sp)
2566  06a4 01            	rrwa	x,a
2567  06a5 1f04          	ldw	(OFST-1,sp),x
2568  06a7               L157:
2569                     ; 516     return ((uint16_t)temph);
2571  06a7 1e04          	ldw	x,(OFST-1,sp)
2574  06a9 5b06          	addw	sp,#6
2575  06ab 81            	ret
2642                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2642                     ; 527 {
2643                     	switch	.text
2644  06ac               _ADC1_GetAWDChannelStatus:
2646  06ac 88            	push	a
2647  06ad 88            	push	a
2648       00000001      OFST:	set	1
2651                     ; 528     uint8_t status = 0;
2653                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
2655  06ae 4d            	tnz	a
2656  06af 2728          	jreq	L623
2657  06b1 a101          	cp	a,#1
2658  06b3 2724          	jreq	L623
2659  06b5 a102          	cp	a,#2
2660  06b7 2720          	jreq	L623
2661  06b9 a103          	cp	a,#3
2662  06bb 271c          	jreq	L623
2663  06bd a104          	cp	a,#4
2664  06bf 2718          	jreq	L623
2665  06c1 a105          	cp	a,#5
2666  06c3 2714          	jreq	L623
2667  06c5 a106          	cp	a,#6
2668  06c7 2710          	jreq	L623
2669  06c9 a107          	cp	a,#7
2670  06cb 270c          	jreq	L623
2671  06cd a108          	cp	a,#8
2672  06cf 2708          	jreq	L623
2673  06d1 a10c          	cp	a,#12
2674  06d3 2704          	jreq	L623
2675  06d5 a109          	cp	a,#9
2676  06d7 2603          	jrne	L423
2677  06d9               L623:
2678  06d9 4f            	clr	a
2679  06da 2010          	jra	L033
2680  06dc               L423:
2681  06dc ae0213        	ldw	x,#531
2682  06df 89            	pushw	x
2683  06e0 ae0000        	ldw	x,#0
2684  06e3 89            	pushw	x
2685  06e4 ae0000        	ldw	x,#L542
2686  06e7 cd0000        	call	_assert_failed
2688  06ea 5b04          	addw	sp,#4
2689  06ec               L033:
2690                     ; 533     if (Channel < (uint8_t)8)
2692  06ec 7b02          	ld	a,(OFST+1,sp)
2693  06ee a108          	cp	a,#8
2694  06f0 2414          	jruge	L5001
2695                     ; 535         status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2697  06f2 7b02          	ld	a,(OFST+1,sp)
2698  06f4 5f            	clrw	x
2699  06f5 97            	ld	xl,a
2700  06f6 a601          	ld	a,#1
2701  06f8 5d            	tnzw	x
2702  06f9 2704          	jreq	L233
2703  06fb               L433:
2704  06fb 48            	sll	a
2705  06fc 5a            	decw	x
2706  06fd 26fc          	jrne	L433
2707  06ff               L233:
2708  06ff c4540d        	and	a,21517
2709  0702 6b01          	ld	(OFST+0,sp),a
2711  0704 2014          	jra	L7001
2712  0706               L5001:
2713                     ; 539         status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2715  0706 7b02          	ld	a,(OFST+1,sp)
2716  0708 a008          	sub	a,#8
2717  070a 5f            	clrw	x
2718  070b 97            	ld	xl,a
2719  070c a601          	ld	a,#1
2720  070e 5d            	tnzw	x
2721  070f 2704          	jreq	L633
2722  0711               L043:
2723  0711 48            	sll	a
2724  0712 5a            	decw	x
2725  0713 26fc          	jrne	L043
2726  0715               L633:
2727  0715 c4540c        	and	a,21516
2728  0718 6b01          	ld	(OFST+0,sp),a
2729  071a               L7001:
2730                     ; 542     return ((FlagStatus)status);
2732  071a 7b01          	ld	a,(OFST+0,sp)
2735  071c 85            	popw	x
2736  071d 81            	ret
2895                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2895                     ; 552 {
2896                     	switch	.text
2897  071e               _ADC1_GetFlagStatus:
2899  071e 88            	push	a
2900  071f 88            	push	a
2901       00000001      OFST:	set	1
2904                     ; 553     uint8_t flagstatus = 0;
2906                     ; 554     uint8_t temp = 0;
2908                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2910  0720 a180          	cp	a,#128
2911  0722 2730          	jreq	L643
2912  0724 a141          	cp	a,#65
2913  0726 272c          	jreq	L643
2914  0728 a140          	cp	a,#64
2915  072a 2728          	jreq	L643
2916  072c a110          	cp	a,#16
2917  072e 2724          	jreq	L643
2918  0730 a111          	cp	a,#17
2919  0732 2720          	jreq	L643
2920  0734 a112          	cp	a,#18
2921  0736 271c          	jreq	L643
2922  0738 a113          	cp	a,#19
2923  073a 2718          	jreq	L643
2924  073c a114          	cp	a,#20
2925  073e 2714          	jreq	L643
2926  0740 a115          	cp	a,#21
2927  0742 2710          	jreq	L643
2928  0744 a116          	cp	a,#22
2929  0746 270c          	jreq	L643
2930  0748 a117          	cp	a,#23
2931  074a 2708          	jreq	L643
2932  074c a118          	cp	a,#24
2933  074e 2704          	jreq	L643
2934  0750 a119          	cp	a,#25
2935  0752 2603          	jrne	L443
2936  0754               L643:
2937  0754 4f            	clr	a
2938  0755 2010          	jra	L053
2939  0757               L443:
2940  0757 ae022d        	ldw	x,#557
2941  075a 89            	pushw	x
2942  075b ae0000        	ldw	x,#0
2943  075e 89            	pushw	x
2944  075f ae0000        	ldw	x,#L542
2945  0762 cd0000        	call	_assert_failed
2947  0765 5b04          	addw	sp,#4
2948  0767               L053:
2949                     ; 559     if ((Flag & 0x0F) == 0x01)
2951  0767 7b02          	ld	a,(OFST+1,sp)
2952  0769 a40f          	and	a,#15
2953  076b a101          	cp	a,#1
2954  076d 2609          	jrne	L7701
2955                     ; 562         flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2957  076f c65403        	ld	a,21507
2958  0772 a440          	and	a,#64
2959  0774 6b01          	ld	(OFST+0,sp),a
2961  0776 2045          	jra	L1011
2962  0778               L7701:
2963                     ; 564     else if ((Flag & 0xF0) == 0x10)
2965  0778 7b02          	ld	a,(OFST+1,sp)
2966  077a a4f0          	and	a,#240
2967  077c a110          	cp	a,#16
2968  077e 2636          	jrne	L3011
2969                     ; 567         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2971  0780 7b02          	ld	a,(OFST+1,sp)
2972  0782 a40f          	and	a,#15
2973  0784 6b01          	ld	(OFST+0,sp),a
2974                     ; 568         if (temp < 8)
2976  0786 7b01          	ld	a,(OFST+0,sp)
2977  0788 a108          	cp	a,#8
2978  078a 2414          	jruge	L5011
2979                     ; 570             flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2981  078c 7b01          	ld	a,(OFST+0,sp)
2982  078e 5f            	clrw	x
2983  078f 97            	ld	xl,a
2984  0790 a601          	ld	a,#1
2985  0792 5d            	tnzw	x
2986  0793 2704          	jreq	L253
2987  0795               L453:
2988  0795 48            	sll	a
2989  0796 5a            	decw	x
2990  0797 26fc          	jrne	L453
2991  0799               L253:
2992  0799 c4540d        	and	a,21517
2993  079c 6b01          	ld	(OFST+0,sp),a
2995  079e 201d          	jra	L1011
2996  07a0               L5011:
2997                     ; 574             flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2999  07a0 7b01          	ld	a,(OFST+0,sp)
3000  07a2 a008          	sub	a,#8
3001  07a4 5f            	clrw	x
3002  07a5 97            	ld	xl,a
3003  07a6 a601          	ld	a,#1
3004  07a8 5d            	tnzw	x
3005  07a9 2704          	jreq	L653
3006  07ab               L063:
3007  07ab 48            	sll	a
3008  07ac 5a            	decw	x
3009  07ad 26fc          	jrne	L063
3010  07af               L653:
3011  07af c4540c        	and	a,21516
3012  07b2 6b01          	ld	(OFST+0,sp),a
3013  07b4 2007          	jra	L1011
3014  07b6               L3011:
3015                     ; 579         flagstatus = (uint8_t)(ADC1->CSR & Flag);
3017  07b6 c65400        	ld	a,21504
3018  07b9 1402          	and	a,(OFST+1,sp)
3019  07bb 6b01          	ld	(OFST+0,sp),a
3020  07bd               L1011:
3021                     ; 581     return ((FlagStatus)flagstatus);
3023  07bd 7b01          	ld	a,(OFST+0,sp)
3026  07bf 85            	popw	x
3027  07c0 81            	ret
3072                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
3072                     ; 592 {
3073                     	switch	.text
3074  07c1               _ADC1_ClearFlag:
3076  07c1 88            	push	a
3077  07c2 88            	push	a
3078       00000001      OFST:	set	1
3081                     ; 593     uint8_t temp = 0;
3083                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
3085  07c3 a180          	cp	a,#128
3086  07c5 2730          	jreq	L663
3087  07c7 a141          	cp	a,#65
3088  07c9 272c          	jreq	L663
3089  07cb a140          	cp	a,#64
3090  07cd 2728          	jreq	L663
3091  07cf a110          	cp	a,#16
3092  07d1 2724          	jreq	L663
3093  07d3 a111          	cp	a,#17
3094  07d5 2720          	jreq	L663
3095  07d7 a112          	cp	a,#18
3096  07d9 271c          	jreq	L663
3097  07db a113          	cp	a,#19
3098  07dd 2718          	jreq	L663
3099  07df a114          	cp	a,#20
3100  07e1 2714          	jreq	L663
3101  07e3 a115          	cp	a,#21
3102  07e5 2710          	jreq	L663
3103  07e7 a116          	cp	a,#22
3104  07e9 270c          	jreq	L663
3105  07eb a117          	cp	a,#23
3106  07ed 2708          	jreq	L663
3107  07ef a118          	cp	a,#24
3108  07f1 2704          	jreq	L663
3109  07f3 a119          	cp	a,#25
3110  07f5 2603          	jrne	L463
3111  07f7               L663:
3112  07f7 4f            	clr	a
3113  07f8 2010          	jra	L073
3114  07fa               L463:
3115  07fa ae0254        	ldw	x,#596
3116  07fd 89            	pushw	x
3117  07fe ae0000        	ldw	x,#0
3118  0801 89            	pushw	x
3119  0802 ae0000        	ldw	x,#L542
3120  0805 cd0000        	call	_assert_failed
3122  0808 5b04          	addw	sp,#4
3123  080a               L073:
3124                     ; 598     if ((Flag & 0x0F) == 0x01)
3126  080a 7b02          	ld	a,(OFST+1,sp)
3127  080c a40f          	and	a,#15
3128  080e a101          	cp	a,#1
3129  0810 2606          	jrne	L5311
3130                     ; 601         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
3132  0812 721d5403      	bres	21507,#6
3134  0816 204b          	jra	L7311
3135  0818               L5311:
3136                     ; 603     else if ((Flag & 0xF0) == 0x10)
3138  0818 7b02          	ld	a,(OFST+1,sp)
3139  081a a4f0          	and	a,#240
3140  081c a110          	cp	a,#16
3141  081e 263a          	jrne	L1411
3142                     ; 606         temp = (uint8_t)(Flag & (uint8_t)0x0F);
3144  0820 7b02          	ld	a,(OFST+1,sp)
3145  0822 a40f          	and	a,#15
3146  0824 6b01          	ld	(OFST+0,sp),a
3147                     ; 607         if (temp < 8)
3149  0826 7b01          	ld	a,(OFST+0,sp)
3150  0828 a108          	cp	a,#8
3151  082a 2416          	jruge	L3411
3152                     ; 609             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
3154  082c 7b01          	ld	a,(OFST+0,sp)
3155  082e 5f            	clrw	x
3156  082f 97            	ld	xl,a
3157  0830 a601          	ld	a,#1
3158  0832 5d            	tnzw	x
3159  0833 2704          	jreq	L273
3160  0835               L473:
3161  0835 48            	sll	a
3162  0836 5a            	decw	x
3163  0837 26fc          	jrne	L473
3164  0839               L273:
3165  0839 43            	cpl	a
3166  083a c4540d        	and	a,21517
3167  083d c7540d        	ld	21517,a
3169  0840 2021          	jra	L7311
3170  0842               L3411:
3171                     ; 613             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
3173  0842 7b01          	ld	a,(OFST+0,sp)
3174  0844 a008          	sub	a,#8
3175  0846 5f            	clrw	x
3176  0847 97            	ld	xl,a
3177  0848 a601          	ld	a,#1
3178  084a 5d            	tnzw	x
3179  084b 2704          	jreq	L673
3180  084d               L004:
3181  084d 48            	sll	a
3182  084e 5a            	decw	x
3183  084f 26fc          	jrne	L004
3184  0851               L673:
3185  0851 43            	cpl	a
3186  0852 c4540c        	and	a,21516
3187  0855 c7540c        	ld	21516,a
3188  0858 2009          	jra	L7311
3189  085a               L1411:
3190                     ; 618         ADC1->CSR &= (uint8_t) (~Flag);
3192  085a 7b02          	ld	a,(OFST+1,sp)
3193  085c 43            	cpl	a
3194  085d c45400        	and	a,21504
3195  0860 c75400        	ld	21504,a
3196  0863               L7311:
3197                     ; 620 }
3200  0863 85            	popw	x
3201  0864 81            	ret
3257                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
3257                     ; 641 {
3258                     	switch	.text
3259  0865               _ADC1_GetITStatus:
3261  0865 89            	pushw	x
3262  0866 88            	push	a
3263       00000001      OFST:	set	1
3266                     ; 642     ITStatus itstatus = RESET;
3268                     ; 643     uint8_t temp = 0;
3270                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3272  0867 a30080        	cpw	x,#128
3273  086a 273c          	jreq	L604
3274  086c a30140        	cpw	x,#320
3275  086f 2737          	jreq	L604
3276  0871 a30110        	cpw	x,#272
3277  0874 2732          	jreq	L604
3278  0876 a30111        	cpw	x,#273
3279  0879 272d          	jreq	L604
3280  087b a30112        	cpw	x,#274
3281  087e 2728          	jreq	L604
3282  0880 a30113        	cpw	x,#275
3283  0883 2723          	jreq	L604
3284  0885 a30114        	cpw	x,#276
3285  0888 271e          	jreq	L604
3286  088a a30115        	cpw	x,#277
3287  088d 2719          	jreq	L604
3288  088f a30116        	cpw	x,#278
3289  0892 2714          	jreq	L604
3290  0894 a30117        	cpw	x,#279
3291  0897 270f          	jreq	L604
3292  0899 a30118        	cpw	x,#280
3293  089c 270a          	jreq	L604
3294  089e a3011c        	cpw	x,#284
3295  08a1 2705          	jreq	L604
3296  08a3 a30119        	cpw	x,#281
3297  08a6 2603          	jrne	L404
3298  08a8               L604:
3299  08a8 4f            	clr	a
3300  08a9 2010          	jra	L014
3301  08ab               L404:
3302  08ab ae0286        	ldw	x,#646
3303  08ae 89            	pushw	x
3304  08af ae0000        	ldw	x,#0
3305  08b2 89            	pushw	x
3306  08b3 ae0000        	ldw	x,#L542
3307  08b6 cd0000        	call	_assert_failed
3309  08b9 5b04          	addw	sp,#4
3310  08bb               L014:
3311                     ; 648     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3313  08bb 7b02          	ld	a,(OFST+1,sp)
3314  08bd 97            	ld	xl,a
3315  08be 7b03          	ld	a,(OFST+2,sp)
3316  08c0 a4f0          	and	a,#240
3317  08c2 5f            	clrw	x
3318  08c3 02            	rlwa	x,a
3319  08c4 a30010        	cpw	x,#16
3320  08c7 2636          	jrne	L7711
3321                     ; 651         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3323  08c9 7b03          	ld	a,(OFST+2,sp)
3324  08cb a40f          	and	a,#15
3325  08cd 6b01          	ld	(OFST+0,sp),a
3326                     ; 652         if (temp < 8)
3328  08cf 7b01          	ld	a,(OFST+0,sp)
3329  08d1 a108          	cp	a,#8
3330  08d3 2414          	jruge	L1021
3331                     ; 654             itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
3333  08d5 7b01          	ld	a,(OFST+0,sp)
3334  08d7 5f            	clrw	x
3335  08d8 97            	ld	xl,a
3336  08d9 a601          	ld	a,#1
3337  08db 5d            	tnzw	x
3338  08dc 2704          	jreq	L214
3339  08de               L414:
3340  08de 48            	sll	a
3341  08df 5a            	decw	x
3342  08e0 26fc          	jrne	L414
3343  08e2               L214:
3344  08e2 c4540d        	and	a,21517
3345  08e5 6b01          	ld	(OFST+0,sp),a
3347  08e7 201d          	jra	L5021
3348  08e9               L1021:
3349                     ; 658             itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
3351  08e9 7b01          	ld	a,(OFST+0,sp)
3352  08eb a008          	sub	a,#8
3353  08ed 5f            	clrw	x
3354  08ee 97            	ld	xl,a
3355  08ef a601          	ld	a,#1
3356  08f1 5d            	tnzw	x
3357  08f2 2704          	jreq	L614
3358  08f4               L024:
3359  08f4 48            	sll	a
3360  08f5 5a            	decw	x
3361  08f6 26fc          	jrne	L024
3362  08f8               L614:
3363  08f8 c4540c        	and	a,21516
3364  08fb 6b01          	ld	(OFST+0,sp),a
3365  08fd 2007          	jra	L5021
3366  08ff               L7711:
3367                     ; 663         itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
3369  08ff c65400        	ld	a,21504
3370  0902 1403          	and	a,(OFST+2,sp)
3371  0904 6b01          	ld	(OFST+0,sp),a
3372  0906               L5021:
3373                     ; 665     return ((ITStatus)itstatus);
3375  0906 7b01          	ld	a,(OFST+0,sp)
3378  0908 5b03          	addw	sp,#3
3379  090a 81            	ret
3425                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
3425                     ; 688 {
3426                     	switch	.text
3427  090b               _ADC1_ClearITPendingBit:
3429  090b 89            	pushw	x
3430  090c 88            	push	a
3431       00000001      OFST:	set	1
3434                     ; 689     uint8_t temp = 0;
3436                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3438  090d a30080        	cpw	x,#128
3439  0910 273c          	jreq	L624
3440  0912 a30140        	cpw	x,#320
3441  0915 2737          	jreq	L624
3442  0917 a30110        	cpw	x,#272
3443  091a 2732          	jreq	L624
3444  091c a30111        	cpw	x,#273
3445  091f 272d          	jreq	L624
3446  0921 a30112        	cpw	x,#274
3447  0924 2728          	jreq	L624
3448  0926 a30113        	cpw	x,#275
3449  0929 2723          	jreq	L624
3450  092b a30114        	cpw	x,#276
3451  092e 271e          	jreq	L624
3452  0930 a30115        	cpw	x,#277
3453  0933 2719          	jreq	L624
3454  0935 a30116        	cpw	x,#278
3455  0938 2714          	jreq	L624
3456  093a a30117        	cpw	x,#279
3457  093d 270f          	jreq	L624
3458  093f a30118        	cpw	x,#280
3459  0942 270a          	jreq	L624
3460  0944 a3011c        	cpw	x,#284
3461  0947 2705          	jreq	L624
3462  0949 a30119        	cpw	x,#281
3463  094c 2603          	jrne	L424
3464  094e               L624:
3465  094e 4f            	clr	a
3466  094f 2010          	jra	L034
3467  0951               L424:
3468  0951 ae02b4        	ldw	x,#692
3469  0954 89            	pushw	x
3470  0955 ae0000        	ldw	x,#0
3471  0958 89            	pushw	x
3472  0959 ae0000        	ldw	x,#L542
3473  095c cd0000        	call	_assert_failed
3475  095f 5b04          	addw	sp,#4
3476  0961               L034:
3477                     ; 694     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3479  0961 7b02          	ld	a,(OFST+1,sp)
3480  0963 97            	ld	xl,a
3481  0964 7b03          	ld	a,(OFST+2,sp)
3482  0966 a4f0          	and	a,#240
3483  0968 5f            	clrw	x
3484  0969 02            	rlwa	x,a
3485  096a a30010        	cpw	x,#16
3486  096d 263a          	jrne	L1321
3487                     ; 697         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3489  096f 7b03          	ld	a,(OFST+2,sp)
3490  0971 a40f          	and	a,#15
3491  0973 6b01          	ld	(OFST+0,sp),a
3492                     ; 698         if (temp < 8)
3494  0975 7b01          	ld	a,(OFST+0,sp)
3495  0977 a108          	cp	a,#8
3496  0979 2416          	jruge	L3321
3497                     ; 700             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
3499  097b 7b01          	ld	a,(OFST+0,sp)
3500  097d 5f            	clrw	x
3501  097e 97            	ld	xl,a
3502  097f a601          	ld	a,#1
3503  0981 5d            	tnzw	x
3504  0982 2704          	jreq	L234
3505  0984               L434:
3506  0984 48            	sll	a
3507  0985 5a            	decw	x
3508  0986 26fc          	jrne	L434
3509  0988               L234:
3510  0988 43            	cpl	a
3511  0989 c4540d        	and	a,21517
3512  098c c7540d        	ld	21517,a
3514  098f 2021          	jra	L7321
3515  0991               L3321:
3516                     ; 704             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
3518  0991 7b01          	ld	a,(OFST+0,sp)
3519  0993 a008          	sub	a,#8
3520  0995 5f            	clrw	x
3521  0996 97            	ld	xl,a
3522  0997 a601          	ld	a,#1
3523  0999 5d            	tnzw	x
3524  099a 2704          	jreq	L634
3525  099c               L044:
3526  099c 48            	sll	a
3527  099d 5a            	decw	x
3528  099e 26fc          	jrne	L044
3529  09a0               L634:
3530  09a0 43            	cpl	a
3531  09a1 c4540c        	and	a,21516
3532  09a4 c7540c        	ld	21516,a
3533  09a7 2009          	jra	L7321
3534  09a9               L1321:
3535                     ; 709         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
3537  09a9 7b03          	ld	a,(OFST+2,sp)
3538  09ab 43            	cpl	a
3539  09ac c45400        	and	a,21504
3540  09af c75400        	ld	21504,a
3541  09b2               L7321:
3542                     ; 711 }
3545  09b2 5b03          	addw	sp,#3
3546  09b4 81            	ret
3559                     	xdef	_ADC1_ClearITPendingBit
3560                     	xdef	_ADC1_GetITStatus
3561                     	xdef	_ADC1_ClearFlag
3562                     	xdef	_ADC1_GetFlagStatus
3563                     	xdef	_ADC1_GetAWDChannelStatus
3564                     	xdef	_ADC1_GetBufferValue
3565                     	xdef	_ADC1_SetLowThreshold
3566                     	xdef	_ADC1_SetHighThreshold
3567                     	xdef	_ADC1_GetConversionValue
3568                     	xdef	_ADC1_StartConversion
3569                     	xdef	_ADC1_AWDChannelConfig
3570                     	xdef	_ADC1_ExternalTriggerConfig
3571                     	xdef	_ADC1_ConversionConfig
3572                     	xdef	_ADC1_SchmittTriggerConfig
3573                     	xdef	_ADC1_PrescalerConfig
3574                     	xdef	_ADC1_ITConfig
3575                     	xdef	_ADC1_DataBufferCmd
3576                     	xdef	_ADC1_ScanModeCmd
3577                     	xdef	_ADC1_Cmd
3578                     	xdef	_ADC1_Init
3579                     	xdef	_ADC1_DeInit
3580                     	xref	_assert_failed
3581                     .const:	section	.text
3582  0000               L542:
3583  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_a"
3584  0012 6463312e6300  	dc.b	"dc1.c",0
3604                     	end
