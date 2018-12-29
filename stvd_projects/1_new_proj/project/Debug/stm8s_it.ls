   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 47 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  44                     ; 48 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 52 }
  53  0000 80            	iret
  75                     ; 60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 61 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 65 }
  84  0001 80            	iret
 106                     ; 72 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 106                     ; 73 
 106                     ; 74 {
 107                     	switch	.text
 108  0002               f_TLI_IRQHandler:
 112                     ; 78 }
 115  0002 80            	iret
 137                     ; 85 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 137                     ; 86 {
 138                     	switch	.text
 139  0003               f_AWU_IRQHandler:
 143                     ; 90 }
 146  0003 80            	iret
 168                     ; 97 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 168                     ; 98 {
 169                     	switch	.text
 170  0004               f_CLK_IRQHandler:
 174                     ; 102 }
 177  0004 80            	iret
 200                     ; 109 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 200                     ; 110 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTA_IRQHandler:
 206                     ; 114 }
 209  0005 80            	iret
 232                     ; 121 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 232                     ; 122 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTB_IRQHandler:
 238                     ; 126 }
 241  0006 80            	iret
 264                     ; 133 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 264                     ; 134 {
 265                     	switch	.text
 266  0007               f_EXTI_PORTC_IRQHandler:
 270                     ; 138 }
 273  0007 80            	iret
 296                     ; 145 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 296                     ; 146 {
 297                     	switch	.text
 298  0008               f_EXTI_PORTD_IRQHandler:
 302                     ; 150 }
 305  0008 80            	iret
 328                     ; 157 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 328                     ; 158 {
 329                     	switch	.text
 330  0009               f_EXTI_PORTE_IRQHandler:
 334                     ; 162 }
 337  0009 80            	iret
 359                     ; 209 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 359                     ; 210 {
 360                     	switch	.text
 361  000a               f_SPI_IRQHandler:
 365                     ; 214 }
 368  000a 80            	iret
 391                     ; 221 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 391                     ; 222 {
 392                     	switch	.text
 393  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 397                     ; 226 }
 400  000b 80            	iret
 423                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 423                     ; 234 {
 424                     	switch	.text
 425  000c               f_TIM1_CAP_COM_IRQHandler:
 429                     ; 238 }
 432  000c 80            	iret
 455                     ; 271  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 455                     ; 272  {
 456                     	switch	.text
 457  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 461                     ; 276  }
 464  000d 80            	iret
 487                     ; 283  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 487                     ; 284  {
 488                     	switch	.text
 489  000e               f_TIM2_CAP_COM_IRQHandler:
 493                     ; 288  }
 496  000e 80            	iret
 519                     ; 325  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 519                     ; 326  {
 520                     	switch	.text
 521  000f               f_UART1_TX_IRQHandler:
 525  000f               L112:
 526                     ; 330     while(1);
 528  000f 20fe          	jra	L112
 551                     ; 338  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 551                     ; 339  {
 552                     	switch	.text
 553  0011               f_UART1_RX_IRQHandler:
 557  0011               L522:
 558                     ; 343     while(1);
 560  0011 20fe          	jra	L522
 582                     ; 352 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 582                     ; 353 {
 583                     	switch	.text
 584  0013               f_I2C_IRQHandler:
 588                     ; 357 }
 591  0013 80            	iret
 613                     ; 431  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 613                     ; 432  {
 614                     	switch	.text
 615  0014               f_ADC1_IRQHandler:
 619                     ; 436  }
 622  0014 80            	iret
 645                     ; 457  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 645                     ; 458  {
 646                     	switch	.text
 647  0015               f_TIM4_UPD_OVF_IRQHandler:
 651                     ; 463  }
 654  0015 80            	iret
 677                     ; 471 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 677                     ; 472 {
 678                     	switch	.text
 679  0016               f_EEPROM_EEC_IRQHandler:
 683                     ; 476 }
 686  0016 80            	iret
 698                     	xdef	f_EEPROM_EEC_IRQHandler
 699                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 700                     	xdef	f_ADC1_IRQHandler
 701                     	xdef	f_I2C_IRQHandler
 702                     	xdef	f_UART1_RX_IRQHandler
 703                     	xdef	f_UART1_TX_IRQHandler
 704                     	xdef	f_TIM2_CAP_COM_IRQHandler
 705                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 706                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 707                     	xdef	f_TIM1_CAP_COM_IRQHandler
 708                     	xdef	f_SPI_IRQHandler
 709                     	xdef	f_EXTI_PORTE_IRQHandler
 710                     	xdef	f_EXTI_PORTD_IRQHandler
 711                     	xdef	f_EXTI_PORTC_IRQHandler
 712                     	xdef	f_EXTI_PORTB_IRQHandler
 713                     	xdef	f_EXTI_PORTA_IRQHandler
 714                     	xdef	f_CLK_IRQHandler
 715                     	xdef	f_AWU_IRQHandler
 716                     	xdef	f_TLI_IRQHandler
 717                     	xdef	f_TRAP_IRQHandler
 718                     	xdef	f_NonHandledInterrupt
 737                     	end
