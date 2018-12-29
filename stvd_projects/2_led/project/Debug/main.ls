   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  63                     ; 41 void delay(u16 d)
  63                     ; 42 {
  65                     	switch	.text
  66  0000               _delay:
  68  0000 89            	pushw	x
  69  0001 89            	pushw	x
  70       00000002      OFST:	set	2
  73                     ; 45 	for(i = 0; i < d; i++);
  75  0002 5f            	clrw	x
  76  0003 1f01          	ldw	(OFST-1,sp),x
  78  0005 2007          	jra	L73
  79  0007               L33:
  83  0007 1e01          	ldw	x,(OFST-1,sp)
  84  0009 1c0001        	addw	x,#1
  85  000c 1f01          	ldw	(OFST-1,sp),x
  86  000e               L73:
  89  000e 1e01          	ldw	x,(OFST-1,sp)
  90  0010 1303          	cpw	x,(OFST+1,sp)
  91  0012 25f3          	jrult	L33
  92                     ; 46 }
  95  0014 5b04          	addw	sp,#4
  96  0016 81            	ret
 135                     ; 54 void main(void)
 135                     ; 55 {
 136                     	switch	.text
 137  0017               _main:
 139  0017 89            	pushw	x
 140       00000002      OFST:	set	2
 143                     ; 58 	i = 0;
 145  0018 5f            	clrw	x
 146  0019 1f01          	ldw	(OFST-1,sp),x
 147                     ; 59 	i = 5;
 149  001b ae0005        	ldw	x,#5
 150  001e 1f01          	ldw	(OFST-1,sp),x
 151                     ; 60 	i = -1;
 153  0020 aeffff        	ldw	x,#65535
 154  0023 1f01          	ldw	(OFST-1,sp),x
 155                     ; 63 	GPIO_DeInit(GPIOA);
 157  0025 ae5000        	ldw	x,#20480
 158  0028 cd0000        	call	_GPIO_DeInit
 160                     ; 64 	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_SLOW);
 162  002b 4bd0          	push	#208
 163  002d 4b02          	push	#2
 164  002f ae5000        	ldw	x,#20480
 165  0032 cd0000        	call	_GPIO_Init
 167  0035 85            	popw	x
 168                     ; 66 	GPIO_WriteHigh(GPIOA, GPIO_PIN_1);
 170  0036 4b02          	push	#2
 171  0038 ae5000        	ldw	x,#20480
 172  003b cd0000        	call	_GPIO_WriteHigh
 174  003e 84            	pop	a
 175                     ; 69 	delay(100);
 177  003f ae0064        	ldw	x,#100
 178  0042 adbc          	call	_delay
 180  0044               L16:
 181                     ; 80 		delay(20000);		
 183  0044 ae4e20        	ldw	x,#20000
 184  0047 adb7          	call	_delay
 186                     ; 81 		GPIO_WriteReverse(GPIOA, GPIO_PIN_1);  // PA1 输出电平翻转
 188  0049 4b02          	push	#2
 189  004b ae5000        	ldw	x,#20480
 190  004e cd0000        	call	_GPIO_WriteReverse
 192  0051 84            	pop	a
 194  0052 20f0          	jra	L16
 229                     ; 97 void assert_failed(u8* file, u32 line)
 229                     ; 98 { 
 230                     	switch	.text
 231  0054               _assert_failed:
 235  0054               L301:
 236  0054 20fe          	jra	L301
 249                     	xdef	_main
 250                     	xdef	_delay
 251                     	xdef	_assert_failed
 252                     	xref	_GPIO_WriteReverse
 253                     	xref	_GPIO_WriteHigh
 254                     	xref	_GPIO_Init
 255                     	xref	_GPIO_DeInit
 274                     	end
