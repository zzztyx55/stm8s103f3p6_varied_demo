   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _led_update:
  17  0000 00            	dc.b	0
  18  0001               _key_press_cnt:
  19  0001 00            	dc.b	0
  52                     ; 46 void clk_config(void)
  52                     ; 47 {
  54                     	switch	.text
  55  0000               _clk_config:
  59                     ; 48 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);  // HSI时钟预分频, 分频系数1
  61  0000 4f            	clr	a
  62  0001 cd0000        	call	_CLK_HSIPrescalerConfig
  64                     ; 49 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);  // 系统时钟配置, HSI, 分频系数1
  66  0004 4f            	clr	a
  67  0005 cd0000        	call	_CLK_SYSCLKConfig
  69                     ; 50 	CLK_HSICmd(ENABLE);   // 使能HSI
  71  0008 a601          	ld	a,#1
  72  000a cd0000        	call	_CLK_HSICmd
  75  000d               L32:
  76                     ; 51 	while(RESET == CLK_GetFlagStatus(CLK_FLAG_HSIRDY));  // 等待HSI ready
  78  000d ae0102        	ldw	x,#258
  79  0010 cd0000        	call	_CLK_GetFlagStatus
  81  0013 4d            	tnz	a
  82  0014 27f7          	jreq	L32
  83                     ; 52 }
  86  0016 81            	ret
  89                     	bsct
  90  0002               L72_key_scan_step:
  91  0002 00            	dc.b	0
  92  0003               L13_down_debounce_cnt:
  93  0003 00            	dc.b	0
  94  0004               L33_up_debounce_cnt:
  95  0004 00            	dc.b	0
  96  0005               L53_wait_next_key_cnt:
  97  0005 00000000      	dc.l	0
 159                     .const:	section	.text
 160  0000               L01:
 161  0000 0000c350      	dc.l	50000
 162                     ; 54 void key_scan_task(void)
 162                     ; 55 {
 163                     	switch	.text
 164  0017               _key_scan_task:
 168                     ; 61 	switch(key_scan_step)
 170  0017 b602          	ld	a,L72_key_scan_step
 172                     ; 145 		default:
 172                     ; 146 			break;
 173  0019 4d            	tnz	a
 174  001a 2713          	jreq	L73
 175  001c 4a            	dec	a
 176  001d 2753          	jreq	L14
 177  001f 4a            	dec	a
 178  0020 2603          	jrne	L21
 179  0022 cc00c9        	jp	L34
 180  0025               L21:
 181  0025 4a            	dec	a
 182  0026 2603          	jrne	L41
 183  0028 cc00e8        	jp	L54
 184  002b               L41:
 185  002b acfc00fc      	jpf	L501
 186  002f               L73:
 187                     ; 63 		case 0:
 187                     ; 64 			if(RESET == GPIO_ReadInputPin(GPIOB, GPIO_PIN_4)) // 低电平
 189  002f 4b10          	push	#16
 190  0031 ae5005        	ldw	x,#20485
 191  0034 cd0000        	call	_GPIO_ReadInputPin
 193  0037 5b01          	addw	sp,#1
 194  0039 4d            	tnz	a
 195  003a 2613          	jrne	L701
 196                     ; 66 				down_debounce_cnt++;  // 消抖
 198  003c 3c03          	inc	L13_down_debounce_cnt
 199                     ; 67 				if(down_debounce_cnt >= KEY_DOWN_DEBOUNCE)  // 连续扫描KEY_DEBOUNCE 次 PB4, 都是低电平才算按键按下
 201  003e b603          	ld	a,L13_down_debounce_cnt
 202  0040 a1c8          	cp	a,#200
 203  0042 2403          	jruge	L61
 204  0044 cc00fc        	jp	L501
 205  0047               L61:
 206                     ; 69 					key_press_cnt = 1;  // 标记按键按下(1次)
 208  0047 35010001      	mov	_key_press_cnt,#1
 209  004b acfc00fc      	jpf	L501
 210  004f               L701:
 211                     ; 72 			else if(key_press_cnt == 1)  // 按键未按下，但是有标记，说明第一次按下按键已松开
 213  004f b601          	ld	a,_key_press_cnt
 214  0051 a101          	cp	a,#1
 215  0053 2616          	jrne	L511
 216                     ; 77 					up_debounce_cnt = 0;
 218  0055 3f04          	clr	L33_up_debounce_cnt
 219                     ; 78 					down_debounce_cnt = 0; // clear
 221  0057 3f03          	clr	L13_down_debounce_cnt
 222                     ; 79 					wait_next_key_cnt = 0; // clear
 224  0059 ae0000        	ldw	x,#0
 225  005c bf07          	ldw	L53_wait_next_key_cnt+2,x
 226  005e ae0000        	ldw	x,#0
 227  0061 bf05          	ldw	L53_wait_next_key_cnt,x
 228                     ; 80 					key_scan_step = 1;  // 跳转next step, 检测是否再次按下
 230  0063 35010002      	mov	L72_key_scan_step,#1
 232  0067 acfc00fc      	jpf	L501
 233  006b               L511:
 234                     ; 85 				down_debounce_cnt = 0;  // 清零消抖计数,抗干扰
 236  006b 3f03          	clr	L13_down_debounce_cnt
 237                     ; 86 				up_debounce_cnt = 0;
 239  006d 3f04          	clr	L33_up_debounce_cnt
 240  006f cc00fc        	jra	L501
 241  0072               L14:
 242                     ; 89 		case 1:
 242                     ; 90 			if(RESET == GPIO_ReadInputPin(GPIOB, GPIO_PIN_4)) // 低电平
 244  0072 4b10          	push	#16
 245  0074 ae5005        	ldw	x,#20485
 246  0077 cd0000        	call	_GPIO_ReadInputPin
 248  007a 5b01          	addw	sp,#1
 249  007c 4d            	tnz	a
 250  007d 261e          	jrne	L121
 251                     ; 93 				if(up_debounce_cnt < KEY_BETWEEN_UP_DEBOUNCE)
 253  007f b604          	ld	a,L33_up_debounce_cnt
 254  0081 a10a          	cp	a,#10
 255  0083 2404          	jruge	L321
 256                     ; 95 					up_debounce_cnt = 0; 
 258  0085 3f04          	clr	L33_up_debounce_cnt
 259                     ; 96 					break; // 重新检测是否有连续按键
 261  0087 2073          	jra	L501
 262  0089               L321:
 263                     ; 99 				down_debounce_cnt++;  // 消抖
 265  0089 3c03          	inc	L13_down_debounce_cnt
 266                     ; 100 				if(down_debounce_cnt >= KEY_DOWN_DEBOUNCE)  // 连续扫描KEY_DEBOUNCE 次 PB4, 都是低电平才算按键按下
 268  008b b603          	ld	a,L13_down_debounce_cnt
 269  008d a1c8          	cp	a,#200
 270  008f 256b          	jrult	L501
 271                     ; 102 					key_press_cnt = 2;  // 标记连续按键
 273  0091 35020001      	mov	_key_press_cnt,#2
 274                     ; 103 					up_debounce_cnt = 0; // clear
 276  0095 3f04          	clr	L33_up_debounce_cnt
 277                     ; 104 					key_scan_step = 2; // 跳转next step, 等待第二次按键松开
 279  0097 35020002      	mov	L72_key_scan_step,#2
 280  009b 205f          	jra	L501
 281  009d               L121:
 282                     ; 109 				up_debounce_cnt++;
 284  009d 3c04          	inc	L33_up_debounce_cnt
 285                     ; 110 				wait_next_key_cnt++;
 287  009f ae0005        	ldw	x,#L53_wait_next_key_cnt
 288  00a2 a601          	ld	a,#1
 289  00a4 cd0000        	call	c_lgadc
 291                     ; 111 				if(wait_next_key_cnt >= KEY_PRESS_TIMEOUT) // 等待连续按键超时，说明是按键单击
 293  00a7 ae0005        	ldw	x,#L53_wait_next_key_cnt
 294  00aa cd0000        	call	c_ltor
 296  00ad ae0000        	ldw	x,#L01
 297  00b0 cd0000        	call	c_lcmp
 299  00b3 2547          	jrult	L501
 300                     ; 113 					wait_next_key_cnt = 0; // clear
 302  00b5 ae0000        	ldw	x,#0
 303  00b8 bf07          	ldw	L53_wait_next_key_cnt+2,x
 304  00ba ae0000        	ldw	x,#0
 305  00bd bf05          	ldw	L53_wait_next_key_cnt,x
 306                     ; 114 					up_debounce_cnt = 0; // clear
 308  00bf 3f04          	clr	L33_up_debounce_cnt
 309                     ; 115 					down_debounce_cnt = 0; // clear
 311  00c1 3f03          	clr	L13_down_debounce_cnt
 312                     ; 116 					key_scan_step = 3; // 跳转next step, 报告按键事件
 314  00c3 35030002      	mov	L72_key_scan_step,#3
 315  00c7 2033          	jra	L501
 316  00c9               L34:
 317                     ; 121 		case 2: // 等待第二次按键松开
 317                     ; 122 			if(RESET == GPIO_ReadInputPin(GPIOB, GPIO_PIN_4)) // 低电平
 319  00c9 4b10          	push	#16
 320  00cb ae5005        	ldw	x,#20485
 321  00ce cd0000        	call	_GPIO_ReadInputPin
 323  00d1 5b01          	addw	sp,#1
 324  00d3 4d            	tnz	a
 325  00d4 2604          	jrne	L331
 326                     ; 124 				up_debounce_cnt = 0;
 328  00d6 3f04          	clr	L33_up_debounce_cnt
 330  00d8 2022          	jra	L501
 331  00da               L331:
 332                     ; 128 				up_debounce_cnt++;
 334  00da 3c04          	inc	L33_up_debounce_cnt
 335                     ; 129 				if(up_debounce_cnt >= KEY_UP_DEBOUNCE)// 消抖
 337  00dc b604          	ld	a,L33_up_debounce_cnt
 338  00de a164          	cp	a,#100
 339  00e0 251a          	jrult	L501
 340                     ; 131 					key_scan_step = 3; // 跳转next step, 报告按键事件
 342  00e2 35030002      	mov	L72_key_scan_step,#3
 343  00e6 2014          	jra	L501
 344  00e8               L54:
 345                     ; 137 		case 3:  //  报告按键事件,单双击由 key_press_cnt 记录
 345                     ; 138 			led_update = 1;   // 通知led_task 有新的按键事件
 347  00e8 35010000      	mov	_led_update,#1
 348                     ; 139 			wait_next_key_cnt = 0; // clear
 350  00ec ae0000        	ldw	x,#0
 351  00ef bf07          	ldw	L53_wait_next_key_cnt+2,x
 352  00f1 ae0000        	ldw	x,#0
 353  00f4 bf05          	ldw	L53_wait_next_key_cnt,x
 354                     ; 140 			up_debounce_cnt = 0; // clear
 356  00f6 3f04          	clr	L33_up_debounce_cnt
 357                     ; 141 			down_debounce_cnt = 0;
 359  00f8 3f03          	clr	L13_down_debounce_cnt
 360                     ; 142 			key_scan_step = 0; // 回到step0，检测新按键
 362  00fa 3f02          	clr	L72_key_scan_step
 363                     ; 143 			break;
 365  00fc               L74:
 366                     ; 145 		default:
 366                     ; 146 			break;
 368  00fc               L501:
 369                     ; 148 }
 372  00fc 81            	ret
 399                     ; 155 void led_task(void)
 399                     ; 156 {
 400                     	switch	.text
 401  00fd               _led_task:
 405                     ; 158 	if(led_update == 0)
 407  00fd 3d00          	tnz	_led_update
 408  00ff 2601          	jrne	L151
 409                     ; 159 		return;
 412  0101 81            	ret
 413  0102               L151:
 414                     ; 161 	led_update = 0; // clear
 416  0102 3f00          	clr	_led_update
 417                     ; 163 	if(key_press_cnt == 1) // 按键单击
 419  0104 b601          	ld	a,_key_press_cnt
 420  0106 a101          	cp	a,#1
 421  0108 260b          	jrne	L351
 422                     ; 164 		GPIO_WriteHigh(GPIOA, GPIO_PIN_1);  // PA1 输出高电平,led灭
 424  010a 4b02          	push	#2
 425  010c ae5000        	ldw	x,#20480
 426  010f cd0000        	call	_GPIO_WriteHigh
 428  0112 84            	pop	a
 430  0113 200f          	jra	L551
 431  0115               L351:
 432                     ; 165 	else if(key_press_cnt == 2) // 按键双击
 434  0115 b601          	ld	a,_key_press_cnt
 435  0117 a102          	cp	a,#2
 436  0119 2609          	jrne	L551
 437                     ; 166 		GPIO_WriteLow(GPIOA, GPIO_PIN_1);	// PA1 输出低电平,led亮
 439  011b 4b02          	push	#2
 440  011d ae5000        	ldw	x,#20480
 441  0120 cd0000        	call	_GPIO_WriteLow
 443  0123 84            	pop	a
 444  0124               L551:
 445                     ; 168 	key_press_cnt = 0; // clear
 447  0124 3f01          	clr	_key_press_cnt
 448                     ; 169 }
 451  0126 81            	ret
 480                     ; 177 void main(void)
 480                     ; 178 {	
 481                     	switch	.text
 482  0127               _main:
 486                     ; 180 	disableInterrupts();
 489  0127 9b            sim
 491                     ; 182 	clk_config();
 494  0128 cd0000        	call	_clk_config
 496                     ; 184 	GPIO_DeInit(GPIOA);
 498  012b ae5000        	ldw	x,#20480
 499  012e cd0000        	call	_GPIO_DeInit
 501                     ; 185 	GPIO_DeInit(GPIOB);
 503  0131 ae5005        	ldw	x,#20485
 504  0134 cd0000        	call	_GPIO_DeInit
 506                     ; 188 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
 508  0137 4b00          	push	#0
 509  0139 4b10          	push	#16
 510  013b ae5005        	ldw	x,#20485
 511  013e cd0000        	call	_GPIO_Init
 513  0141 85            	popw	x
 514                     ; 190 	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_SLOW);
 516  0142 4bd0          	push	#208
 517  0144 4b02          	push	#2
 518  0146 ae5000        	ldw	x,#20480
 519  0149 cd0000        	call	_GPIO_Init
 521  014c 85            	popw	x
 522  014d               L171:
 523                     ; 198 		key_scan_task();
 525  014d cd0017        	call	_key_scan_task
 527                     ; 199 		led_task();
 529  0150 adab          	call	_led_task
 532  0152 20f9          	jra	L171
 567                     ; 213 void assert_failed(u8* file, u32 line)
 567                     ; 214 { 
 568                     	switch	.text
 569  0154               _assert_failed:
 573  0154               L312:
 574  0154 20fe          	jra	L312
 607                     	xdef	_main
 608                     	xdef	_led_task
 609                     	xdef	_key_scan_task
 610                     	xdef	_clk_config
 611                     	xdef	_key_press_cnt
 612                     	xdef	_led_update
 613                     	xdef	_assert_failed
 614                     	xref	_GPIO_ReadInputPin
 615                     	xref	_GPIO_WriteLow
 616                     	xref	_GPIO_WriteHigh
 617                     	xref	_GPIO_Init
 618                     	xref	_GPIO_DeInit
 619                     	xref	_CLK_GetFlagStatus
 620                     	xref	_CLK_SYSCLKConfig
 621                     	xref	_CLK_HSIPrescalerConfig
 622                     	xref	_CLK_HSICmd
 641                     	xref	c_lcmp
 642                     	xref	c_ltor
 643                     	xref	c_lgadc
 644                     	end
