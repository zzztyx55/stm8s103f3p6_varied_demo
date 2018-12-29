   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 49 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  44                     ; 50 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 54 }
  53  0000 80            	iret
  75                     ; 62 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 63 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 67 }
  84  0001 80            	iret
 106                     ; 74 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 106                     ; 75 
 106                     ; 76 {
 107                     	switch	.text
 108  0002               f_TLI_IRQHandler:
 112                     ; 80 }
 115  0002 80            	iret
 137                     ; 87 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 137                     ; 88 {
 138                     	switch	.text
 139  0003               f_AWU_IRQHandler:
 143                     ; 92 }
 146  0003 80            	iret
 168                     ; 99 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 168                     ; 100 {
 169                     	switch	.text
 170  0004               f_CLK_IRQHandler:
 174                     ; 104 }
 177  0004 80            	iret
 200                     ; 111 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 200                     ; 112 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTA_IRQHandler:
 206                     ; 116 }
 209  0005 80            	iret
 232                     ; 123 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 232                     ; 124 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTB_IRQHandler:
 238                     ; 128 }
 241  0006 80            	iret
 264                     ; 135 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 264                     ; 136 {
 265                     	switch	.text
 266  0007               f_EXTI_PORTC_IRQHandler:
 270                     ; 140 }
 273  0007 80            	iret
 296                     ; 147 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 296                     ; 148 {
 297                     	switch	.text
 298  0008               f_EXTI_PORTD_IRQHandler:
 302                     ; 152 }
 305  0008 80            	iret
 328                     ; 159 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 328                     ; 160 {
 329                     	switch	.text
 330  0009               f_EXTI_PORTE_IRQHandler:
 334                     ; 164 }
 337  0009 80            	iret
 359                     ; 211 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 359                     ; 212 {
 360                     	switch	.text
 361  000a               f_SPI_IRQHandler:
 365                     ; 216 }
 368  000a 80            	iret
 391                     ; 223 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 391                     ; 224 {
 392                     	switch	.text
 393  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 397                     ; 228 }
 400  000b 80            	iret
 423                     ; 235 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 423                     ; 236 {
 424                     	switch	.text
 425  000c               f_TIM1_CAP_COM_IRQHandler:
 429                     ; 240 }
 432  000c 80            	iret
 455                     ; 273  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 455                     ; 274  {
 456                     	switch	.text
 457  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 461                     ; 278  }
 464  000d 80            	iret
 487                     ; 285  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 487                     ; 286  {
 488                     	switch	.text
 489  000e               f_TIM2_CAP_COM_IRQHandler:
 493                     ; 290  }
 496  000e 80            	iret
 519                     ; 327  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 519                     ; 328  {
 520                     	switch	.text
 521  000f               f_UART1_TX_IRQHandler:
 525                     ; 332  }
 528  000f 80            	iret
 551                     ; 339  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 551                     ; 340  {
 552                     	switch	.text
 553  0010               f_UART1_RX_IRQHandler:
 557                     ; 344  }
 560  0010 80            	iret
 582                     ; 352 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 582                     ; 353 {
 583                     	switch	.text
 584  0011               f_I2C_IRQHandler:
 588                     ; 357 }
 591  0011 80            	iret
 613                     ; 431  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 613                     ; 432  {
 614                     	switch	.text
 615  0012               f_ADC1_IRQHandler:
 619                     ; 436  }
 622  0012 80            	iret
 624                     	bsct
 625  0000               L142_cnt:
 626  0000 0000          	dc.w	0
 661                     ; 457  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 661                     ; 458  {
 662                     	switch	.text
 663  0013               f_TIM4_UPD_OVF_IRQHandler:
 665  0013 3b0002        	push	c_x+2
 666  0016 be00          	ldw	x,c_x
 667  0018 89            	pushw	x
 668  0019 3b0002        	push	c_y+2
 669  001c be00          	ldw	x,c_y
 670  001e 89            	pushw	x
 673                     ; 464 	cnt++;
 675  001f be00          	ldw	x,L142_cnt
 676  0021 1c0001        	addw	x,#1
 677  0024 bf00          	ldw	L142_cnt,x
 678                     ; 465 	if(cnt >= 5000) // 0.1ms *5000 = 0.5s
 680  0026 be00          	ldw	x,L142_cnt
 681  0028 a31388        	cpw	x,#5000
 682  002b 2507          	jrult	L162
 683                     ; 467 		cnt = 0;
 685  002d 5f            	clrw	x
 686  002e bf00          	ldw	L142_cnt,x
 687                     ; 469 		time_0_5s_upate_flag = 1;
 689  0030 35010000      	mov	_time_0_5s_upate_flag,#1
 690  0034               L162:
 691                     ; 472 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);   //  清除中断标志位
 693  0034 a601          	ld	a,#1
 694  0036 cd0000        	call	_TIM4_ClearITPendingBit
 696                     ; 473  }
 699  0039 85            	popw	x
 700  003a bf00          	ldw	c_y,x
 701  003c 320002        	pop	c_y+2
 702  003f 85            	popw	x
 703  0040 bf00          	ldw	c_x,x
 704  0042 320002        	pop	c_x+2
 705  0045 80            	iret
 728                     ; 481 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 728                     ; 482 {
 729                     	switch	.text
 730  0046               f_EEPROM_EEC_IRQHandler:
 734                     ; 486 }
 737  0046 80            	iret
 749                     	xref.b	_time_0_5s_upate_flag
 750                     	xdef	f_EEPROM_EEC_IRQHandler
 751                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 752                     	xdef	f_ADC1_IRQHandler
 753                     	xdef	f_I2C_IRQHandler
 754                     	xdef	f_UART1_RX_IRQHandler
 755                     	xdef	f_UART1_TX_IRQHandler
 756                     	xdef	f_TIM2_CAP_COM_IRQHandler
 757                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 758                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 759                     	xdef	f_TIM1_CAP_COM_IRQHandler
 760                     	xdef	f_SPI_IRQHandler
 761                     	xdef	f_EXTI_PORTE_IRQHandler
 762                     	xdef	f_EXTI_PORTD_IRQHandler
 763                     	xdef	f_EXTI_PORTC_IRQHandler
 764                     	xdef	f_EXTI_PORTB_IRQHandler
 765                     	xdef	f_EXTI_PORTA_IRQHandler
 766                     	xdef	f_CLK_IRQHandler
 767                     	xdef	f_AWU_IRQHandler
 768                     	xdef	f_TLI_IRQHandler
 769                     	xdef	f_TRAP_IRQHandler
 770                     	xdef	f_NonHandledInterrupt
 771                     	xref	_TIM4_ClearITPendingBit
 772                     	xref.b	c_x
 773                     	xref.b	c_y
 792                     	end
