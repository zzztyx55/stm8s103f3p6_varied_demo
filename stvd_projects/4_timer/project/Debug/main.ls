   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  63                     ; 44 void delay(u32 dly)
  63                     ; 45 {
  65                     	switch	.text
  66  0000               _delay:
  68  0000 5204          	subw	sp,#4
  69       00000004      OFST:	set	4
  72                     ; 47 	for(i = 0; i < dly; i++)
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
 101                     ; 49 }
 104  0027 5b04          	addw	sp,#4
 105  0029 81            	ret
 132                     ; 51 void clk_config(void)
 132                     ; 52 {
 133                     	switch	.text
 134  002a               _clk_config:
 138                     ; 54 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);  // HSI时钟预分频, 分频系数1
 140  002a 4f            	clr	a
 141  002b cd0000        	call	_CLK_HSIPrescalerConfig
 143                     ; 55 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);  // 系统时钟配置, HSI, 分频系数1
 145  002e 4f            	clr	a
 146  002f cd0000        	call	_CLK_SYSCLKConfig
 148                     ; 56 	CLK_HSICmd(ENABLE);   // 使能HSI
 150  0032 a601          	ld	a,#1
 151  0034 cd0000        	call	_CLK_HSICmd
 154  0037               L55:
 155                     ; 57 	while(RESET == CLK_GetFlagStatus(CLK_FLAG_HSIRDY));  // 等待HSI ready
 157  0037 ae0102        	ldw	x,#258
 158  003a cd0000        	call	_CLK_GetFlagStatus
 160  003d 4d            	tnz	a
 161  003e 27f7          	jreq	L55
 162                     ; 58 }
 165  0040 81            	ret
 190                     ; 60 void LSI_enable(void)
 190                     ; 61 {
 191                     	switch	.text
 192  0041               _LSI_enable:
 196                     ; 62 	CLK_LSICmd(ENABLE);   // 使能LSI
 198  0041 a601          	ld	a,#1
 199  0043 cd0000        	call	_CLK_LSICmd
 202  0046               L37:
 203                     ; 63 	while(RESET == CLK_GetFlagStatus(CLK_FLAG_LSIRDY));  // 等待LSI ready
 205  0046 ae0110        	ldw	x,#272
 206  0049 cd0000        	call	_CLK_GetFlagStatus
 208  004c 4d            	tnz	a
 209  004d 27f7          	jreq	L37
 210                     ; 64 }
 213  004f 81            	ret
 240                     ; 67 void init_beep(void)
 240                     ; 68 {
 241                     	switch	.text
 242  0050               _init_beep:
 246                     ; 69 	BEEP_DeInit();
 248  0050 cd0000        	call	_BEEP_DeInit
 250                     ; 71 	LSI_enable();
 252  0053 adec          	call	_LSI_enable
 254                     ; 72 	BEEP_LSICalibrationConfig(128000);
 256  0055 aef400        	ldw	x,#62464
 257  0058 89            	pushw	x
 258  0059 ae0001        	ldw	x,#1
 259  005c 89            	pushw	x
 260  005d cd0000        	call	_BEEP_LSICalibrationConfig
 262  0060 5b04          	addw	sp,#4
 263                     ; 73 	BEEP_Init(BEEP_FREQUENCY_1KHZ);
 265  0062 4f            	clr	a
 266  0063 cd0000        	call	_BEEP_Init
 268                     ; 75 }
 271  0066 81            	ret
 298                     ; 82 void Init_Timer4(void)
 298                     ; 83 {
 299                     	switch	.text
 300  0067               _Init_Timer4:
 304                     ; 88 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 100);
 306  0067 ae0064        	ldw	x,#100
 307  006a a604          	ld	a,#4
 308  006c 95            	ld	xh,a
 309  006d cd0000        	call	_TIM4_TimeBaseInit
 311                     ; 90   	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 313  0070 a601          	ld	a,#1
 314  0072 cd0000        	call	_TIM4_ClearFlag
 316                     ; 92 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  // 使能time4溢出更新中断
 318  0075 ae0001        	ldw	x,#1
 319  0078 a601          	ld	a,#1
 320  007a 95            	ld	xh,a
 321  007b cd0000        	call	_TIM4_ITConfig
 323                     ; 93 	TIM4_Cmd(ENABLE);  // 使能timer4
 325  007e a601          	ld	a,#1
 326  0080 cd0000        	call	_TIM4_Cmd
 328                     ; 94 }
 331  0083 81            	ret
 369                     ; 102 void main(void)
 369                     ; 103 {	
 370                     	switch	.text
 371  0084               _main:
 375                     ; 105 	disableInterrupts();
 378  0084 9b            sim
 380                     ; 107 	clk_config();
 383  0085 ada3          	call	_clk_config
 385                     ; 109 	GPIO_DeInit(GPIOA);
 387  0087 ae5000        	ldw	x,#20480
 388  008a cd0000        	call	_GPIO_DeInit
 390                     ; 110 	GPIO_DeInit(GPIOB);
 392  008d ae5005        	ldw	x,#20485
 393  0090 cd0000        	call	_GPIO_DeInit
 395                     ; 111 	GPIO_DeInit(GPIOC);
 397  0093 ae500a        	ldw	x,#20490
 398  0096 cd0000        	call	_GPIO_DeInit
 400                     ; 112 	GPIO_DeInit(GPIOD);
 402  0099 ae500f        	ldw	x,#20495
 403  009c cd0000        	call	_GPIO_DeInit
 405                     ; 115 	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_SLOW);
 407  009f 4bd0          	push	#208
 408  00a1 4b02          	push	#2
 409  00a3 ae5000        	ldw	x,#20480
 410  00a6 cd0000        	call	_GPIO_Init
 412  00a9 85            	popw	x
 413                     ; 116 	GPIO_WriteHigh(GPIOA, GPIO_PIN_1); // turn off led
 415  00aa 4b02          	push	#2
 416  00ac ae5000        	ldw	x,#20480
 417  00af cd0000        	call	_GPIO_WriteHigh
 419  00b2 84            	pop	a
 420                     ; 118 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
 422  00b3 4b00          	push	#0
 423  00b5 4b10          	push	#16
 424  00b7 ae5005        	ldw	x,#20485
 425  00ba cd0000        	call	_GPIO_Init
 427  00bd 85            	popw	x
 428                     ; 120 	time_0_5s_upate_flag = 0;
 430  00be 3f02          	clr	_time_0_5s_upate_flag
 431                     ; 121 	led_cnt = 0;
 433  00c0 3f01          	clr	_led_cnt
 434                     ; 122 	beep_turn_on_flag = 0;
 436  00c2 3f00          	clr	_beep_turn_on_flag
 437                     ; 125 	Init_Timer4();  
 439  00c4 ada1          	call	_Init_Timer4
 441                     ; 127 	init_beep();
 443  00c6 ad88          	call	_init_beep
 445                     ; 129 	delay(100);
 447  00c8 ae0064        	ldw	x,#100
 448  00cb 89            	pushw	x
 449  00cc ae0000        	ldw	x,#0
 450  00cf 89            	pushw	x
 451  00d0 cd0000        	call	_delay
 453  00d3 5b04          	addw	sp,#4
 454                     ; 132 	enableInterrupts();
 457  00d5 9a            rim
 459  00d6               L721:
 460                     ; 138 		if(time_0_5s_upate_flag)  // 定时器0.5s计时标志
 462  00d6 3d02          	tnz	_time_0_5s_upate_flag
 463  00d8 2743          	jreq	L331
 464                     ; 140 			time_0_5s_upate_flag = 0; // clear time flag
 466  00da 3f02          	clr	_time_0_5s_upate_flag
 467                     ; 142 			led_cnt += 1;
 469  00dc 3c01          	inc	_led_cnt
 470                     ; 143 			if(led_cnt == 20)  // 10s = 0.5s*20
 472  00de b601          	ld	a,_led_cnt
 473  00e0 a114          	cp	a,#20
 474  00e2 260b          	jrne	L531
 475                     ; 145 				GPIO_WriteLow(GPIOA, GPIO_PIN_1); // turn on led
 477  00e4 4b02          	push	#2
 478  00e6 ae5000        	ldw	x,#20480
 479  00e9 cd0000        	call	_GPIO_WriteLow
 481  00ec 84            	pop	a
 483  00ed 2011          	jra	L731
 484  00ef               L531:
 485                     ; 147 			else if(led_cnt == 21)  // 10.5s = 0.5s*21，即在10.5s时刻关闭led
 487  00ef b601          	ld	a,_led_cnt
 488  00f1 a115          	cp	a,#21
 489  00f3 260b          	jrne	L731
 490                     ; 149 				GPIO_WriteHigh(GPIOA, GPIO_PIN_1); // turn off led
 492  00f5 4b02          	push	#2
 493  00f7 ae5000        	ldw	x,#20480
 494  00fa cd0000        	call	_GPIO_WriteHigh
 496  00fd 84            	pop	a
 497                     ; 150 				led_cnt = 0; // clear cnt
 499  00fe 3f01          	clr	_led_cnt
 500  0100               L731:
 501                     ; 153 			if(beep_turn_on_flag == 1)  // 蜂鸣器鸣叫标志被置1
 503  0100 b600          	ld	a,_beep_turn_on_flag
 504  0102 a101          	cp	a,#1
 505  0104 260b          	jrne	L341
 506                     ; 155 				beep_turn_on_flag = 2;  // 标志置2
 508  0106 35020000      	mov	_beep_turn_on_flag,#2
 509                     ; 156 				BEEP_Cmd(ENABLE);       // 启动蜂鸣器
 511  010a a601          	ld	a,#1
 512  010c cd0000        	call	_BEEP_Cmd
 515  010f 200c          	jra	L331
 516  0111               L341:
 517                     ; 158 			else if(beep_turn_on_flag == 2) // 蜂鸣器鸣叫标志被置2
 519  0111 b600          	ld	a,_beep_turn_on_flag
 520  0113 a102          	cp	a,#2
 521  0115 2606          	jrne	L331
 522                     ; 160 				beep_turn_on_flag = 0;  // clear
 524  0117 3f00          	clr	_beep_turn_on_flag
 525                     ; 161 				BEEP_Cmd(DISABLE);      // 关闭蜂鸣器
 527  0119 4f            	clr	a
 528  011a cd0000        	call	_BEEP_Cmd
 530  011d               L331:
 531                     ; 166 		if(0 == GPIO_ReadInputPin(GPIOB, GPIO_PIN_4))  // PB4拉低 --> 按键按下
 533  011d 4b10          	push	#16
 534  011f ae5005        	ldw	x,#20485
 535  0122 cd0000        	call	_GPIO_ReadInputPin
 537  0125 5b01          	addw	sp,#1
 538  0127 4d            	tnz	a
 539  0128 26ac          	jrne	L721
 540                     ; 167 			beep_turn_on_flag = 1;      // 蜂鸣器鸣叫标志置1
 542  012a 35010000      	mov	_beep_turn_on_flag,#1
 543  012e 20a6          	jra	L721
 578                     ; 180 void assert_failed(u8* file, u32 line)
 578                     ; 181 { 
 579                     	switch	.text
 580  0130               _assert_failed:
 584  0130               L171:
 585  0130 20fe          	jra	L171
 628                     	xdef	_main
 629                     	xdef	_Init_Timer4
 630                     	xdef	_init_beep
 631                     	xdef	_LSI_enable
 632                     	xdef	_clk_config
 633                     	xdef	_delay
 634                     	switch	.ubsct
 635  0000               _beep_turn_on_flag:
 636  0000 00            	ds.b	1
 637                     	xdef	_beep_turn_on_flag
 638  0001               _led_cnt:
 639  0001 00            	ds.b	1
 640                     	xdef	_led_cnt
 641  0002               _time_0_5s_upate_flag:
 642  0002 00            	ds.b	1
 643                     	xdef	_time_0_5s_upate_flag
 644                     	xdef	_assert_failed
 645                     	xref	_TIM4_ClearFlag
 646                     	xref	_TIM4_ITConfig
 647                     	xref	_TIM4_Cmd
 648                     	xref	_TIM4_TimeBaseInit
 649                     	xref	_GPIO_ReadInputPin
 650                     	xref	_GPIO_WriteLow
 651                     	xref	_GPIO_WriteHigh
 652                     	xref	_GPIO_Init
 653                     	xref	_GPIO_DeInit
 654                     	xref	_CLK_GetFlagStatus
 655                     	xref	_CLK_SYSCLKConfig
 656                     	xref	_CLK_HSIPrescalerConfig
 657                     	xref	_CLK_LSICmd
 658                     	xref	_CLK_HSICmd
 659                     	xref	_BEEP_LSICalibrationConfig
 660                     	xref	_BEEP_Cmd
 661                     	xref	_BEEP_Init
 662                     	xref	_BEEP_DeInit
 682                     	xref	c_lcmp
 683                     	xref	c_ltor
 684                     	xref	c_lgadc
 685                     	end
