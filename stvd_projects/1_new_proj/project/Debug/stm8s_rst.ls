   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 118                     ; 48 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 118                     ; 49 {
 120                     	switch	.text
 121  0000               _RST_GetFlagStatus:
 123  0000 88            	push	a
 124       00000000      OFST:	set	0
 127                     ; 51     assert_param(IS_RST_FLAG_OK(RST_Flag));
 129  0001 a110          	cp	a,#16
 130  0003 2710          	jreq	L01
 131  0005 a108          	cp	a,#8
 132  0007 270c          	jreq	L01
 133  0009 a104          	cp	a,#4
 134  000b 2708          	jreq	L01
 135  000d a102          	cp	a,#2
 136  000f 2704          	jreq	L01
 137  0011 a101          	cp	a,#1
 138  0013 2603          	jrne	L6
 139  0015               L01:
 140  0015 4f            	clr	a
 141  0016 2010          	jra	L21
 142  0018               L6:
 143  0018 ae0033        	ldw	x,#51
 144  001b 89            	pushw	x
 145  001c ae0000        	ldw	x,#0
 146  001f 89            	pushw	x
 147  0020 ae0000        	ldw	x,#L55
 148  0023 cd0000        	call	_assert_failed
 150  0026 5b04          	addw	sp,#4
 151  0028               L21:
 152                     ; 55     return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 154  0028 c650b3        	ld	a,20659
 155  002b 1401          	and	a,(OFST+1,sp)
 158  002d 5b01          	addw	sp,#1
 159  002f 81            	ret
 195                     ; 64 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 195                     ; 65 {
 196                     	switch	.text
 197  0030               _RST_ClearFlag:
 199  0030 88            	push	a
 200       00000000      OFST:	set	0
 203                     ; 67     assert_param(IS_RST_FLAG_OK(RST_Flag));
 205  0031 a110          	cp	a,#16
 206  0033 2710          	jreq	L02
 207  0035 a108          	cp	a,#8
 208  0037 270c          	jreq	L02
 209  0039 a104          	cp	a,#4
 210  003b 2708          	jreq	L02
 211  003d a102          	cp	a,#2
 212  003f 2704          	jreq	L02
 213  0041 a101          	cp	a,#1
 214  0043 2603          	jrne	L61
 215  0045               L02:
 216  0045 4f            	clr	a
 217  0046 2010          	jra	L22
 218  0048               L61:
 219  0048 ae0043        	ldw	x,#67
 220  004b 89            	pushw	x
 221  004c ae0000        	ldw	x,#0
 222  004f 89            	pushw	x
 223  0050 ae0000        	ldw	x,#L55
 224  0053 cd0000        	call	_assert_failed
 226  0056 5b04          	addw	sp,#4
 227  0058               L22:
 228                     ; 69     RST->SR = (uint8_t)RST_Flag;
 230  0058 7b01          	ld	a,(OFST+1,sp)
 231  005a c750b3        	ld	20659,a
 232                     ; 70 }
 235  005d 84            	pop	a
 236  005e 81            	ret
 249                     	xdef	_RST_ClearFlag
 250                     	xdef	_RST_GetFlagStatus
 251                     	xref	_assert_failed
 252                     .const:	section	.text
 253  0000               L55:
 254  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_r"
 255  0012 73742e6300    	dc.b	"st.c",0
 275                     	end
