   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  63                     ; 47 void delay(u32 dly)
  63                     ; 48 {
  65                     	switch	.text
  66  0000               _delay:
  68  0000 5204          	subw	sp,#4
  69       00000004      OFST:	set	4
  72                     ; 51 	for(i = 0; i < dly; i++)
  74  0002 ae0000        	ldw	x,#0
  75  0005 1f03          	ldw	(OFST-1,sp),x
  76  0007 ae0000        	ldw	x,#0
  77  000a 1f01          	ldw	(OFST-3,sp),x
  79  000c 2009          	jra	L73
  80  000e               L33:
  84  000e 96            	ldw	x,sp
  85  000f 1c0001        	addw	x,#OFST-3
  86  0012 a601          	ld	a,#1
  87  0014 cd0000        	call	c_lgadc
  89  0017               L73:
  92  0017 96            	ldw	x,sp
  93  0018 1c0001        	addw	x,#OFST-3
  94  001b cd0000        	call	c_ltor
  96  001e 96            	ldw	x,sp
  97  001f 1c0007        	addw	x,#OFST+3
  98  0022 cd0000        	call	c_lcmp
 100  0025 25e7          	jrult	L33
 101                     ; 55 }
 104  0027 5b04          	addw	sp,#4
 105  0029 81            	ret
 142                     ; 58 void Beep_inputClkSelect(void)
 142                     ; 59 {
 143                     	switch	.text
 144  002a               _Beep_inputClkSelect:
 146  002a 89            	pushw	x
 147       00000002      OFST:	set	2
 150                     ; 62   value = FLASH_ReadOptionByte(0x4807);  // 读出选项字OPT4地址0x4807 存储的数据
 152  002b ae4807        	ldw	x,#18439
 153  002e cd0000        	call	_FLASH_ReadOptionByte
 155  0031 1f01          	ldw	(OFST-1,sp),x
 156                     ; 63   if(value&0x0400)  // 判断CKAWUSEL 位是否为1，若是1，将该位清零
 158  0033 7b01          	ld	a,(OFST-1,sp)
 159  0035 a504          	bcp	a,#4
 160  0037 2714          	jreq	L16
 161                     ; 64   	FLASH_ProgramOptionByte(0x4807,(uint8_t)((value&0xFBFF)>>8));
 163  0039 1e01          	ldw	x,(OFST-1,sp)
 164  003b 01            	rrwa	x,a
 165  003c a4ff          	and	a,#255
 166  003e 01            	rrwa	x,a
 167  003f a4fb          	and	a,#251
 168  0041 01            	rrwa	x,a
 169  0042 4f            	clr	a
 170  0043 01            	rrwa	x,a
 171  0044 9f            	ld	a,xl
 172  0045 88            	push	a
 173  0046 ae4807        	ldw	x,#18439
 174  0049 cd0000        	call	_FLASH_ProgramOptionByte
 176  004c 84            	pop	a
 177  004d               L16:
 178                     ; 65 }
 181  004d 85            	popw	x
 182  004e 81            	ret
 209                     ; 68 void clk_config(void)
 209                     ; 69 {
 210                     	switch	.text
 211  004f               _clk_config:
 215                     ; 71 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);  // HSI时钟预分频, 分频系数1
 217  004f 4f            	clr	a
 218  0050 cd0000        	call	_CLK_HSIPrescalerConfig
 220                     ; 72 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);  // 系统时钟配置, HSI, 分频系数1
 222  0053 4f            	clr	a
 223  0054 cd0000        	call	_CLK_SYSCLKConfig
 225                     ; 73 	CLK_HSICmd(ENABLE);   // 使能HSI
 227  0057 a601          	ld	a,#1
 228  0059 cd0000        	call	_CLK_HSICmd
 231  005c               L57:
 232                     ; 74 	while(RESET == CLK_GetFlagStatus(CLK_FLAG_HSIRDY));  // 等待HSI ready
 234  005c ae0102        	ldw	x,#258
 235  005f cd0000        	call	_CLK_GetFlagStatus
 237  0062 4d            	tnz	a
 238  0063 27f7          	jreq	L57
 239                     ; 75 }
 242  0065 81            	ret
 267                     ; 77 void LSI_enable(void)
 267                     ; 78 {
 268                     	switch	.text
 269  0066               _LSI_enable:
 273                     ; 79 	CLK_LSICmd(ENABLE);   // 使能LSI
 275  0066 a601          	ld	a,#1
 276  0068 cd0000        	call	_CLK_LSICmd
 279  006b               L311:
 280                     ; 80 	while(RESET == CLK_GetFlagStatus(CLK_FLAG_LSIRDY));  // 等待LSI ready
 282  006b ae0110        	ldw	x,#272
 283  006e cd0000        	call	_CLK_GetFlagStatus
 285  0071 4d            	tnz	a
 286  0072 27f7          	jreq	L311
 287                     ; 81 }
 290  0074 81            	ret
 317                     ; 84 void init_beep(void)
 317                     ; 85 {
 318                     	switch	.text
 319  0075               _init_beep:
 323                     ; 86 	BEEP_DeInit();
 325  0075 cd0000        	call	_BEEP_DeInit
 327                     ; 88 	LSI_enable();
 329  0078 adec          	call	_LSI_enable
 331                     ; 89 	BEEP_LSICalibrationConfig(128000);
 333  007a aef400        	ldw	x,#62464
 334  007d 89            	pushw	x
 335  007e ae0001        	ldw	x,#1
 336  0081 89            	pushw	x
 337  0082 cd0000        	call	_BEEP_LSICalibrationConfig
 339  0085 5b04          	addw	sp,#4
 340                     ; 90 	BEEP_Init(BEEP_FREQUENCY_1KHZ);
 342  0087 4f            	clr	a
 343  0088 cd0000        	call	_BEEP_Init
 345                     ; 92 }
 348  008b 81            	ret
 384                     ; 94 void change_beep_freq(u8 freq_group)
 384                     ; 95 {
 385                     	switch	.text
 386  008c               _change_beep_freq:
 388  008c 88            	push	a
 389       00000000      OFST:	set	0
 392                     ; 97 	BEEP_Cmd(DISABLE);
 394  008d 4f            	clr	a
 395  008e cd0000        	call	_BEEP_Cmd
 397                     ; 99 	switch(freq_group)
 399  0091 7b01          	ld	a,(OFST+1,sp)
 401                     ; 104 		default: BEEP_Init(BEEP_FREQUENCY_1KHZ); break;
 402  0093 4d            	tnz	a
 403  0094 270c          	jreq	L721
 404  0096 4a            	dec	a
 405  0097 270f          	jreq	L131
 406  0099 4a            	dec	a
 407  009a 2713          	jreq	L331
 408  009c               L531:
 411  009c 4f            	clr	a
 412  009d cd0000        	call	_BEEP_Init
 416  00a0 2012          	jra	L751
 417  00a2               L721:
 418                     ; 101 		case 0:	BEEP_Init(BEEP_FREQUENCY_1KHZ); break;
 420  00a2 4f            	clr	a
 421  00a3 cd0000        	call	_BEEP_Init
 425  00a6 200c          	jra	L751
 426  00a8               L131:
 427                     ; 102 		case 1:	BEEP_Init(BEEP_FREQUENCY_2KHZ); break;
 429  00a8 a640          	ld	a,#64
 430  00aa cd0000        	call	_BEEP_Init
 434  00ad 2005          	jra	L751
 435  00af               L331:
 436                     ; 103 		case 2:	BEEP_Init(BEEP_FREQUENCY_4KHZ); break;
 438  00af a680          	ld	a,#128
 439  00b1 cd0000        	call	_BEEP_Init
 443  00b4               L751:
 444                     ; 109 }
 447  00b4 84            	pop	a
 448  00b5 81            	ret
 489                     ; 117 void main(void)
 489                     ; 118 {	
 490                     	switch	.text
 491  00b6               _main:
 493  00b6 89            	pushw	x
 494       00000002      OFST:	set	2
 497                     ; 119 	int dly = 1500;
 499  00b7 ae05dc        	ldw	x,#1500
 500  00ba 1f01          	ldw	(OFST-1,sp),x
 501                     ; 122 	disableInterrupts();
 504  00bc 9b            sim
 506                     ; 124 	clk_config();
 509  00bd ad90          	call	_clk_config
 511                     ; 126 	GPIO_DeInit(GPIOD);
 513  00bf ae500f        	ldw	x,#20495
 514  00c2 cd0000        	call	_GPIO_DeInit
 516                     ; 128 	init_beep();
 518  00c5 adae          	call	_init_beep
 520  00c7               L771:
 521                     ; 136 		BEEP_Cmd(DISABLE);
 523  00c7 4f            	clr	a
 524  00c8 cd0000        	call	_BEEP_Cmd
 526                     ; 137 		change_beep_freq(0); //beep 的输出频率1kHz
 528  00cb 4f            	clr	a
 529  00cc adbe          	call	_change_beep_freq
 531                     ; 138 		BEEP_Cmd(ENABLE);
 533  00ce a601          	ld	a,#1
 534  00d0 cd0000        	call	_BEEP_Cmd
 536                     ; 139 		delay(dly);  // 延时
 538  00d3 1e01          	ldw	x,(OFST-1,sp)
 539  00d5 cd0000        	call	c_itolx
 541  00d8 be02          	ldw	x,c_lreg+2
 542  00da 89            	pushw	x
 543  00db be00          	ldw	x,c_lreg
 544  00dd 89            	pushw	x
 545  00de cd0000        	call	_delay
 547  00e1 5b04          	addw	sp,#4
 548                     ; 142 		BEEP_Cmd(DISABLE);
 550  00e3 4f            	clr	a
 551  00e4 cd0000        	call	_BEEP_Cmd
 553                     ; 143 		delay(dly);  // 延时
 555  00e7 1e01          	ldw	x,(OFST-1,sp)
 556  00e9 cd0000        	call	c_itolx
 558  00ec be02          	ldw	x,c_lreg+2
 559  00ee 89            	pushw	x
 560  00ef be00          	ldw	x,c_lreg
 561  00f1 89            	pushw	x
 562  00f2 cd0000        	call	_delay
 564  00f5 5b04          	addw	sp,#4
 565                     ; 146 		BEEP_Cmd(DISABLE);
 567  00f7 4f            	clr	a
 568  00f8 cd0000        	call	_BEEP_Cmd
 570                     ; 147 		change_beep_freq(1); //beep 的输出频率2kHz
 572  00fb a601          	ld	a,#1
 573  00fd ad8d          	call	_change_beep_freq
 575                     ; 148 		BEEP_Cmd(ENABLE);
 577  00ff a601          	ld	a,#1
 578  0101 cd0000        	call	_BEEP_Cmd
 580                     ; 149 		delay(dly);  // 延时
 582  0104 1e01          	ldw	x,(OFST-1,sp)
 583  0106 cd0000        	call	c_itolx
 585  0109 be02          	ldw	x,c_lreg+2
 586  010b 89            	pushw	x
 587  010c be00          	ldw	x,c_lreg
 588  010e 89            	pushw	x
 589  010f cd0000        	call	_delay
 591  0112 5b04          	addw	sp,#4
 592                     ; 152 		BEEP_Cmd(DISABLE);
 594  0114 4f            	clr	a
 595  0115 cd0000        	call	_BEEP_Cmd
 597                     ; 153 		delay(dly);  // 延时
 599  0118 1e01          	ldw	x,(OFST-1,sp)
 600  011a cd0000        	call	c_itolx
 602  011d be02          	ldw	x,c_lreg+2
 603  011f 89            	pushw	x
 604  0120 be00          	ldw	x,c_lreg
 605  0122 89            	pushw	x
 606  0123 cd0000        	call	_delay
 608  0126 5b04          	addw	sp,#4
 609                     ; 156 		BEEP_Cmd(DISABLE);
 611  0128 4f            	clr	a
 612  0129 cd0000        	call	_BEEP_Cmd
 614                     ; 157 		change_beep_freq(2); //beep 的输出频率4kHz
 616  012c a602          	ld	a,#2
 617  012e cd008c        	call	_change_beep_freq
 619                     ; 158 		BEEP_Cmd(ENABLE);
 621  0131 a601          	ld	a,#1
 622  0133 cd0000        	call	_BEEP_Cmd
 624                     ; 159 		delay(dly);  // 延时
 626  0136 1e01          	ldw	x,(OFST-1,sp)
 627  0138 cd0000        	call	c_itolx
 629  013b be02          	ldw	x,c_lreg+2
 630  013d 89            	pushw	x
 631  013e be00          	ldw	x,c_lreg
 632  0140 89            	pushw	x
 633  0141 cd0000        	call	_delay
 635  0144 5b04          	addw	sp,#4
 636                     ; 162 		BEEP_Cmd(DISABLE);
 638  0146 4f            	clr	a
 639  0147 cd0000        	call	_BEEP_Cmd
 641                     ; 163 		delay(dly);  // 延时
 643  014a 1e01          	ldw	x,(OFST-1,sp)
 644  014c cd0000        	call	c_itolx
 646  014f be02          	ldw	x,c_lreg+2
 647  0151 89            	pushw	x
 648  0152 be00          	ldw	x,c_lreg
 649  0154 89            	pushw	x
 650  0155 cd0000        	call	_delay
 652  0158 5b04          	addw	sp,#4
 654  015a acc700c7      	jpf	L771
 689                     ; 176 void assert_failed(u8* file, u32 line)
 689                     ; 177 { 
 690                     	switch	.text
 691  015e               _assert_failed:
 695  015e               L122:
 696  015e 20fe          	jra	L122
 709                     	xdef	_main
 710                     	xdef	_change_beep_freq
 711                     	xdef	_init_beep
 712                     	xdef	_LSI_enable
 713                     	xdef	_clk_config
 714                     	xdef	_Beep_inputClkSelect
 715                     	xdef	_delay
 716                     	xdef	_assert_failed
 717                     	xref	_GPIO_DeInit
 718                     	xref	_FLASH_ProgramOptionByte
 719                     	xref	_FLASH_ReadOptionByte
 720                     	xref	_CLK_GetFlagStatus
 721                     	xref	_CLK_SYSCLKConfig
 722                     	xref	_CLK_HSIPrescalerConfig
 723                     	xref	_CLK_LSICmd
 724                     	xref	_CLK_HSICmd
 725                     	xref	_BEEP_LSICalibrationConfig
 726                     	xref	_BEEP_Cmd
 727                     	xref	_BEEP_Init
 728                     	xref	_BEEP_DeInit
 729                     	xref.b	c_lreg
 748                     	xref	c_itolx
 749                     	xref	c_lcmp
 750                     	xref	c_ltor
 751                     	xref	c_lgadc
 752                     	end
