   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  64                     ; 47 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  64                     ; 48 {
  66                     	switch	.text
  67  0000               _WWDG_Init:
  69  0000 89            	pushw	x
  70       00000000      OFST:	set	0
  73                     ; 50     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  75  0001 9f            	ld	a,xl
  76  0002 a180          	cp	a,#128
  77  0004 2403          	jruge	L6
  78  0006 4f            	clr	a
  79  0007 2010          	jra	L01
  80  0009               L6:
  81  0009 ae0032        	ldw	x,#50
  82  000c 89            	pushw	x
  83  000d ae0000        	ldw	x,#0
  84  0010 89            	pushw	x
  85  0011 ae0000        	ldw	x,#L33
  86  0014 cd0000        	call	_assert_failed
  88  0017 5b04          	addw	sp,#4
  89  0019               L01:
  90                     ; 52     WWDG->WR = WWDG_WR_RESET_VALUE;
  92  0019 357f50d2      	mov	20690,#127
  93                     ; 53     WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  95  001d 7b01          	ld	a,(OFST+1,sp)
  96  001f aac0          	or	a,#192
  97  0021 c750d1        	ld	20689,a
  98                     ; 54     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 100  0024 7b02          	ld	a,(OFST+2,sp)
 101  0026 aa40          	or	a,#64
 102  0028 a47f          	and	a,#127
 103  002a c750d2        	ld	20690,a
 104                     ; 55 }
 107  002d 85            	popw	x
 108  002e 81            	ret
 143                     ; 63 void WWDG_SetCounter(uint8_t Counter)
 143                     ; 64 {
 144                     	switch	.text
 145  002f               _WWDG_SetCounter:
 147  002f 88            	push	a
 148       00000000      OFST:	set	0
 151                     ; 67     assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 153  0030 a180          	cp	a,#128
 154  0032 2403          	jruge	L41
 155  0034 4f            	clr	a
 156  0035 2010          	jra	L61
 157  0037               L41:
 158  0037 ae0043        	ldw	x,#67
 159  003a 89            	pushw	x
 160  003b ae0000        	ldw	x,#0
 161  003e 89            	pushw	x
 162  003f ae0000        	ldw	x,#L33
 163  0042 cd0000        	call	_assert_failed
 165  0045 5b04          	addw	sp,#4
 166  0047               L61:
 167                     ; 71   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 169  0047 7b01          	ld	a,(OFST+1,sp)
 170  0049 a47f          	and	a,#127
 171  004b c750d1        	ld	20689,a
 172                     ; 73 }
 175  004e 84            	pop	a
 176  004f 81            	ret
 199                     ; 82 uint8_t WWDG_GetCounter(void)
 199                     ; 83 {
 200                     	switch	.text
 201  0050               _WWDG_GetCounter:
 205                     ; 84     return(WWDG->CR);
 207  0050 c650d1        	ld	a,20689
 210  0053 81            	ret
 233                     ; 92 void WWDG_SWReset(void)
 233                     ; 93 {
 234                     	switch	.text
 235  0054               _WWDG_SWReset:
 239                     ; 94     WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 241  0054 358050d1      	mov	20689,#128
 242                     ; 95 }
 245  0058 81            	ret
 281                     ; 104 void WWDG_SetWindowValue(uint8_t WindowValue)
 281                     ; 105 {
 282                     	switch	.text
 283  0059               _WWDG_SetWindowValue:
 285  0059 88            	push	a
 286       00000000      OFST:	set	0
 289                     ; 107     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 291  005a a180          	cp	a,#128
 292  005c 2403          	jruge	L62
 293  005e 4f            	clr	a
 294  005f 2010          	jra	L03
 295  0061               L62:
 296  0061 ae006b        	ldw	x,#107
 297  0064 89            	pushw	x
 298  0065 ae0000        	ldw	x,#0
 299  0068 89            	pushw	x
 300  0069 ae0000        	ldw	x,#L33
 301  006c cd0000        	call	_assert_failed
 303  006f 5b04          	addw	sp,#4
 304  0071               L03:
 305                     ; 109     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 307  0071 7b01          	ld	a,(OFST+1,sp)
 308  0073 aa40          	or	a,#64
 309  0075 a47f          	and	a,#127
 310  0077 c750d2        	ld	20690,a
 311                     ; 110 }
 314  007a 84            	pop	a
 315  007b 81            	ret
 328                     	xdef	_WWDG_SetWindowValue
 329                     	xdef	_WWDG_SWReset
 330                     	xdef	_WWDG_GetCounter
 331                     	xdef	_WWDG_SetCounter
 332                     	xdef	_WWDG_Init
 333                     	xref	_assert_failed
 334                     .const:	section	.text
 335  0000               L33:
 336  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_w"
 337  0012 7764672e6300  	dc.b	"wdg.c",0
 357                     	end
