   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 61 void I2C_DeInit(void)
  43                     ; 62 {
  45                     	switch	.text
  46  0000               _I2C_DeInit:
  50                     ; 63   I2C->CR1 = I2C_CR1_RESET_VALUE;
  52  0000 725f5210      	clr	21008
  53                     ; 64   I2C->CR2 = I2C_CR2_RESET_VALUE;
  55  0004 725f5211      	clr	21009
  56                     ; 65   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  58  0008 725f5212      	clr	21010
  59                     ; 66   I2C->OARL = I2C_OARL_RESET_VALUE;
  61  000c 725f5213      	clr	21011
  62                     ; 67   I2C->OARH = I2C_OARH_RESET_VALUE;
  64  0010 725f5214      	clr	21012
  65                     ; 68   I2C->ITR = I2C_ITR_RESET_VALUE;
  67  0014 725f521a      	clr	21018
  68                     ; 69   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  70  0018 725f521b      	clr	21019
  71                     ; 70   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  73  001c 725f521c      	clr	21020
  74                     ; 71   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  76  0020 3502521d      	mov	21021,#2
  77                     ; 72 }
  80  0024 81            	ret
 260                     .const:	section	.text
 261  0000               L44:
 262  0000 00061a81      	dc.l	400001
 263  0004               L05:
 264  0004 000186a1      	dc.l	100001
 265  0008               L25:
 266  0008 000f4240      	dc.l	1000000
 267                     ; 90 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 267                     ; 91               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 267                     ; 92               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 267                     ; 93 {
 268                     	switch	.text
 269  0025               _I2C_Init:
 271  0025 5209          	subw	sp,#9
 272       00000009      OFST:	set	9
 275                     ; 94   uint16_t result = 0x0004;
 277                     ; 95   uint16_t tmpval = 0;
 279                     ; 96   uint8_t tmpccrh = 0;
 281  0027 0f07          	clr	(OFST-2,sp)
 282                     ; 99   assert_param(IS_I2C_ACK_OK(Ack));
 284  0029 0d13          	tnz	(OFST+10,sp)
 285  002b 270c          	jreq	L21
 286  002d 7b13          	ld	a,(OFST+10,sp)
 287  002f a101          	cp	a,#1
 288  0031 2706          	jreq	L21
 289  0033 7b13          	ld	a,(OFST+10,sp)
 290  0035 a102          	cp	a,#2
 291  0037 2603          	jrne	L01
 292  0039               L21:
 293  0039 4f            	clr	a
 294  003a 2010          	jra	L41
 295  003c               L01:
 296  003c ae0063        	ldw	x,#99
 297  003f 89            	pushw	x
 298  0040 ae0000        	ldw	x,#0
 299  0043 89            	pushw	x
 300  0044 ae000c        	ldw	x,#L131
 301  0047 cd0000        	call	_assert_failed
 303  004a 5b04          	addw	sp,#4
 304  004c               L41:
 305                     ; 100   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 307  004c 0d14          	tnz	(OFST+11,sp)
 308  004e 2706          	jreq	L02
 309  0050 7b14          	ld	a,(OFST+11,sp)
 310  0052 a180          	cp	a,#128
 311  0054 2603          	jrne	L61
 312  0056               L02:
 313  0056 4f            	clr	a
 314  0057 2010          	jra	L22
 315  0059               L61:
 316  0059 ae0064        	ldw	x,#100
 317  005c 89            	pushw	x
 318  005d ae0000        	ldw	x,#0
 319  0060 89            	pushw	x
 320  0061 ae000c        	ldw	x,#L131
 321  0064 cd0000        	call	_assert_failed
 323  0067 5b04          	addw	sp,#4
 324  0069               L22:
 325                     ; 101   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 327  0069 1e10          	ldw	x,(OFST+7,sp)
 328  006b a30400        	cpw	x,#1024
 329  006e 2403          	jruge	L42
 330  0070 4f            	clr	a
 331  0071 2010          	jra	L62
 332  0073               L42:
 333  0073 ae0065        	ldw	x,#101
 334  0076 89            	pushw	x
 335  0077 ae0000        	ldw	x,#0
 336  007a 89            	pushw	x
 337  007b ae000c        	ldw	x,#L131
 338  007e cd0000        	call	_assert_failed
 340  0081 5b04          	addw	sp,#4
 341  0083               L62:
 342                     ; 102   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 344  0083 0d12          	tnz	(OFST+9,sp)
 345  0085 2706          	jreq	L23
 346  0087 7b12          	ld	a,(OFST+9,sp)
 347  0089 a140          	cp	a,#64
 348  008b 2603          	jrne	L03
 349  008d               L23:
 350  008d 4f            	clr	a
 351  008e 2010          	jra	L43
 352  0090               L03:
 353  0090 ae0066        	ldw	x,#102
 354  0093 89            	pushw	x
 355  0094 ae0000        	ldw	x,#0
 356  0097 89            	pushw	x
 357  0098 ae000c        	ldw	x,#L131
 358  009b cd0000        	call	_assert_failed
 360  009e 5b04          	addw	sp,#4
 361  00a0               L43:
 362                     ; 103   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 364  00a0 0d15          	tnz	(OFST+12,sp)
 365  00a2 2709          	jreq	L63
 366  00a4 7b15          	ld	a,(OFST+12,sp)
 367  00a6 a111          	cp	a,#17
 368  00a8 2403          	jruge	L63
 369  00aa 4f            	clr	a
 370  00ab 2010          	jra	L04
 371  00ad               L63:
 372  00ad ae0067        	ldw	x,#103
 373  00b0 89            	pushw	x
 374  00b1 ae0000        	ldw	x,#0
 375  00b4 89            	pushw	x
 376  00b5 ae000c        	ldw	x,#L131
 377  00b8 cd0000        	call	_assert_failed
 379  00bb 5b04          	addw	sp,#4
 380  00bd               L04:
 381                     ; 104   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 383  00bd 96            	ldw	x,sp
 384  00be 1c000c        	addw	x,#OFST+3
 385  00c1 cd0000        	call	c_lzmp
 387  00c4 2712          	jreq	L24
 388  00c6 96            	ldw	x,sp
 389  00c7 1c000c        	addw	x,#OFST+3
 390  00ca cd0000        	call	c_ltor
 392  00cd ae0000        	ldw	x,#L44
 393  00d0 cd0000        	call	c_lcmp
 395  00d3 2403          	jruge	L24
 396  00d5 4f            	clr	a
 397  00d6 2010          	jra	L64
 398  00d8               L24:
 399  00d8 ae0068        	ldw	x,#104
 400  00db 89            	pushw	x
 401  00dc ae0000        	ldw	x,#0
 402  00df 89            	pushw	x
 403  00e0 ae000c        	ldw	x,#L131
 404  00e3 cd0000        	call	_assert_failed
 406  00e6 5b04          	addw	sp,#4
 407  00e8               L64:
 408                     ; 109   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 410  00e8 c65212        	ld	a,21010
 411  00eb a4c0          	and	a,#192
 412  00ed c75212        	ld	21010,a
 413                     ; 111   I2C->FREQR |= InputClockFrequencyMHz;
 415  00f0 c65212        	ld	a,21010
 416  00f3 1a15          	or	a,(OFST+12,sp)
 417  00f5 c75212        	ld	21010,a
 418                     ; 115   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 420  00f8 72115210      	bres	21008,#0
 421                     ; 118   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 423  00fc c6521c        	ld	a,21020
 424  00ff a430          	and	a,#48
 425  0101 c7521c        	ld	21020,a
 426                     ; 119   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 428  0104 725f521b      	clr	21019
 429                     ; 122   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 431  0108 96            	ldw	x,sp
 432  0109 1c000c        	addw	x,#OFST+3
 433  010c cd0000        	call	c_ltor
 435  010f ae0004        	ldw	x,#L05
 436  0112 cd0000        	call	c_lcmp
 438  0115 2403          	jruge	L45
 439  0117 cc01a4        	jp	L331
 440  011a               L45:
 441                     ; 125     tmpccrh = I2C_CCRH_FS;
 443  011a a680          	ld	a,#128
 444  011c 6b07          	ld	(OFST-2,sp),a
 445                     ; 127     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 447  011e 0d12          	tnz	(OFST+9,sp)
 448  0120 2630          	jrne	L531
 449                     ; 130       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 451  0122 96            	ldw	x,sp
 452  0123 1c000c        	addw	x,#OFST+3
 453  0126 cd0000        	call	c_ltor
 455  0129 a603          	ld	a,#3
 456  012b cd0000        	call	c_smul
 458  012e 96            	ldw	x,sp
 459  012f 1c0001        	addw	x,#OFST-8
 460  0132 cd0000        	call	c_rtol
 462  0135 7b15          	ld	a,(OFST+12,sp)
 463  0137 b703          	ld	c_lreg+3,a
 464  0139 3f02          	clr	c_lreg+2
 465  013b 3f01          	clr	c_lreg+1
 466  013d 3f00          	clr	c_lreg
 467  013f ae0008        	ldw	x,#L25
 468  0142 cd0000        	call	c_lmul
 470  0145 96            	ldw	x,sp
 471  0146 1c0001        	addw	x,#OFST-8
 472  0149 cd0000        	call	c_ludv
 474  014c be02          	ldw	x,c_lreg+2
 475  014e 1f08          	ldw	(OFST-1,sp),x
 477  0150 2034          	jra	L731
 478  0152               L531:
 479                     ; 135       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 481  0152 96            	ldw	x,sp
 482  0153 1c000c        	addw	x,#OFST+3
 483  0156 cd0000        	call	c_ltor
 485  0159 a619          	ld	a,#25
 486  015b cd0000        	call	c_smul
 488  015e 96            	ldw	x,sp
 489  015f 1c0001        	addw	x,#OFST-8
 490  0162 cd0000        	call	c_rtol
 492  0165 7b15          	ld	a,(OFST+12,sp)
 493  0167 b703          	ld	c_lreg+3,a
 494  0169 3f02          	clr	c_lreg+2
 495  016b 3f01          	clr	c_lreg+1
 496  016d 3f00          	clr	c_lreg
 497  016f ae0008        	ldw	x,#L25
 498  0172 cd0000        	call	c_lmul
 500  0175 96            	ldw	x,sp
 501  0176 1c0001        	addw	x,#OFST-8
 502  0179 cd0000        	call	c_ludv
 504  017c be02          	ldw	x,c_lreg+2
 505  017e 1f08          	ldw	(OFST-1,sp),x
 506                     ; 137       tmpccrh |= I2C_CCRH_DUTY;
 508  0180 7b07          	ld	a,(OFST-2,sp)
 509  0182 aa40          	or	a,#64
 510  0184 6b07          	ld	(OFST-2,sp),a
 511  0186               L731:
 512                     ; 141     if (result < (uint16_t)0x01)
 514  0186 1e08          	ldw	x,(OFST-1,sp)
 515  0188 2605          	jrne	L141
 516                     ; 144       result = (uint16_t)0x0001;
 518  018a ae0001        	ldw	x,#1
 519  018d 1f08          	ldw	(OFST-1,sp),x
 520  018f               L141:
 521                     ; 150     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 523  018f 7b15          	ld	a,(OFST+12,sp)
 524  0191 97            	ld	xl,a
 525  0192 a603          	ld	a,#3
 526  0194 42            	mul	x,a
 527  0195 a60a          	ld	a,#10
 528  0197 cd0000        	call	c_sdivx
 530  019a 5c            	incw	x
 531  019b 1f05          	ldw	(OFST-4,sp),x
 532                     ; 151     I2C->TRISER = (uint8_t)tmpval;
 534  019d 7b06          	ld	a,(OFST-3,sp)
 535  019f c7521d        	ld	21021,a
 537  01a2 2043          	jra	L341
 538  01a4               L331:
 539                     ; 158     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 541  01a4 96            	ldw	x,sp
 542  01a5 1c000c        	addw	x,#OFST+3
 543  01a8 cd0000        	call	c_ltor
 545  01ab 3803          	sll	c_lreg+3
 546  01ad 3902          	rlc	c_lreg+2
 547  01af 3901          	rlc	c_lreg+1
 548  01b1 3900          	rlc	c_lreg
 549  01b3 96            	ldw	x,sp
 550  01b4 1c0001        	addw	x,#OFST-8
 551  01b7 cd0000        	call	c_rtol
 553  01ba 7b15          	ld	a,(OFST+12,sp)
 554  01bc b703          	ld	c_lreg+3,a
 555  01be 3f02          	clr	c_lreg+2
 556  01c0 3f01          	clr	c_lreg+1
 557  01c2 3f00          	clr	c_lreg
 558  01c4 ae0008        	ldw	x,#L25
 559  01c7 cd0000        	call	c_lmul
 561  01ca 96            	ldw	x,sp
 562  01cb 1c0001        	addw	x,#OFST-8
 563  01ce cd0000        	call	c_ludv
 565  01d1 be02          	ldw	x,c_lreg+2
 566  01d3 1f08          	ldw	(OFST-1,sp),x
 567                     ; 161     if (result < (uint16_t)0x0004)
 569  01d5 1e08          	ldw	x,(OFST-1,sp)
 570  01d7 a30004        	cpw	x,#4
 571  01da 2405          	jruge	L541
 572                     ; 164       result = (uint16_t)0x0004;
 574  01dc ae0004        	ldw	x,#4
 575  01df 1f08          	ldw	(OFST-1,sp),x
 576  01e1               L541:
 577                     ; 170     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 579  01e1 7b15          	ld	a,(OFST+12,sp)
 580  01e3 4c            	inc	a
 581  01e4 c7521d        	ld	21021,a
 582  01e7               L341:
 583                     ; 175   I2C->CCRL = (uint8_t)result;
 585  01e7 7b09          	ld	a,(OFST+0,sp)
 586  01e9 c7521b        	ld	21019,a
 587                     ; 176   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 589  01ec 7b08          	ld	a,(OFST-1,sp)
 590  01ee a40f          	and	a,#15
 591  01f0 1a07          	or	a,(OFST-2,sp)
 592  01f2 c7521c        	ld	21020,a
 593                     ; 179   I2C->CR1 |= I2C_CR1_PE;
 595  01f5 72105210      	bset	21008,#0
 596                     ; 182   I2C_AcknowledgeConfig(Ack);
 598  01f9 7b13          	ld	a,(OFST+10,sp)
 599  01fb cd0323        	call	_I2C_AcknowledgeConfig
 601                     ; 185   I2C->OARL = (uint8_t)(OwnAddress);
 603  01fe 7b11          	ld	a,(OFST+8,sp)
 604  0200 c75213        	ld	21011,a
 605                     ; 186   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 605                     ; 187                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 607  0203 7b10          	ld	a,(OFST+7,sp)
 608  0205 97            	ld	xl,a
 609  0206 7b11          	ld	a,(OFST+8,sp)
 610  0208 9f            	ld	a,xl
 611  0209 a403          	and	a,#3
 612  020b 97            	ld	xl,a
 613  020c 4f            	clr	a
 614  020d 02            	rlwa	x,a
 615  020e 4f            	clr	a
 616  020f 01            	rrwa	x,a
 617  0210 48            	sll	a
 618  0211 59            	rlcw	x
 619  0212 9f            	ld	a,xl
 620  0213 6b04          	ld	(OFST-5,sp),a
 621  0215 7b14          	ld	a,(OFST+11,sp)
 622  0217 aa40          	or	a,#64
 623  0219 1a04          	or	a,(OFST-5,sp)
 624  021b c75214        	ld	21012,a
 625                     ; 188 }
 628  021e 5b09          	addw	sp,#9
 629  0220 81            	ret
 685                     ; 196 void I2C_Cmd(FunctionalState NewState)
 685                     ; 197 {
 686                     	switch	.text
 687  0221               _I2C_Cmd:
 689  0221 88            	push	a
 690       00000000      OFST:	set	0
 693                     ; 200   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 695  0222 4d            	tnz	a
 696  0223 2704          	jreq	L26
 697  0225 a101          	cp	a,#1
 698  0227 2603          	jrne	L06
 699  0229               L26:
 700  0229 4f            	clr	a
 701  022a 2010          	jra	L46
 702  022c               L06:
 703  022c ae00c8        	ldw	x,#200
 704  022f 89            	pushw	x
 705  0230 ae0000        	ldw	x,#0
 706  0233 89            	pushw	x
 707  0234 ae000c        	ldw	x,#L131
 708  0237 cd0000        	call	_assert_failed
 710  023a 5b04          	addw	sp,#4
 711  023c               L46:
 712                     ; 202   if (NewState != DISABLE)
 714  023c 0d01          	tnz	(OFST+1,sp)
 715  023e 2706          	jreq	L571
 716                     ; 205     I2C->CR1 |= I2C_CR1_PE;
 718  0240 72105210      	bset	21008,#0
 720  0244 2004          	jra	L771
 721  0246               L571:
 722                     ; 210     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 724  0246 72115210      	bres	21008,#0
 725  024a               L771:
 726                     ; 212 }
 729  024a 84            	pop	a
 730  024b 81            	ret
 766                     ; 220 void I2C_GeneralCallCmd(FunctionalState NewState)
 766                     ; 221 {
 767                     	switch	.text
 768  024c               _I2C_GeneralCallCmd:
 770  024c 88            	push	a
 771       00000000      OFST:	set	0
 774                     ; 224   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 776  024d 4d            	tnz	a
 777  024e 2704          	jreq	L27
 778  0250 a101          	cp	a,#1
 779  0252 2603          	jrne	L07
 780  0254               L27:
 781  0254 4f            	clr	a
 782  0255 2010          	jra	L47
 783  0257               L07:
 784  0257 ae00e0        	ldw	x,#224
 785  025a 89            	pushw	x
 786  025b ae0000        	ldw	x,#0
 787  025e 89            	pushw	x
 788  025f ae000c        	ldw	x,#L131
 789  0262 cd0000        	call	_assert_failed
 791  0265 5b04          	addw	sp,#4
 792  0267               L47:
 793                     ; 226   if (NewState != DISABLE)
 795  0267 0d01          	tnz	(OFST+1,sp)
 796  0269 2706          	jreq	L712
 797                     ; 229     I2C->CR1 |= I2C_CR1_ENGC;
 799  026b 721c5210      	bset	21008,#6
 801  026f 2004          	jra	L122
 802  0271               L712:
 803                     ; 234     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 805  0271 721d5210      	bres	21008,#6
 806  0275               L122:
 807                     ; 236 }
 810  0275 84            	pop	a
 811  0276 81            	ret
 847                     ; 246 void I2C_GenerateSTART(FunctionalState NewState)
 847                     ; 247 {
 848                     	switch	.text
 849  0277               _I2C_GenerateSTART:
 851  0277 88            	push	a
 852       00000000      OFST:	set	0
 855                     ; 250   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 857  0278 4d            	tnz	a
 858  0279 2704          	jreq	L201
 859  027b a101          	cp	a,#1
 860  027d 2603          	jrne	L001
 861  027f               L201:
 862  027f 4f            	clr	a
 863  0280 2010          	jra	L401
 864  0282               L001:
 865  0282 ae00fa        	ldw	x,#250
 866  0285 89            	pushw	x
 867  0286 ae0000        	ldw	x,#0
 868  0289 89            	pushw	x
 869  028a ae000c        	ldw	x,#L131
 870  028d cd0000        	call	_assert_failed
 872  0290 5b04          	addw	sp,#4
 873  0292               L401:
 874                     ; 252   if (NewState != DISABLE)
 876  0292 0d01          	tnz	(OFST+1,sp)
 877  0294 2706          	jreq	L142
 878                     ; 255     I2C->CR2 |= I2C_CR2_START;
 880  0296 72105211      	bset	21009,#0
 882  029a 2004          	jra	L342
 883  029c               L142:
 884                     ; 260     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 886  029c 72115211      	bres	21009,#0
 887  02a0               L342:
 888                     ; 262 }
 891  02a0 84            	pop	a
 892  02a1 81            	ret
 928                     ; 270 void I2C_GenerateSTOP(FunctionalState NewState)
 928                     ; 271 {
 929                     	switch	.text
 930  02a2               _I2C_GenerateSTOP:
 932  02a2 88            	push	a
 933       00000000      OFST:	set	0
 936                     ; 274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 938  02a3 4d            	tnz	a
 939  02a4 2704          	jreq	L211
 940  02a6 a101          	cp	a,#1
 941  02a8 2603          	jrne	L011
 942  02aa               L211:
 943  02aa 4f            	clr	a
 944  02ab 2010          	jra	L411
 945  02ad               L011:
 946  02ad ae0112        	ldw	x,#274
 947  02b0 89            	pushw	x
 948  02b1 ae0000        	ldw	x,#0
 949  02b4 89            	pushw	x
 950  02b5 ae000c        	ldw	x,#L131
 951  02b8 cd0000        	call	_assert_failed
 953  02bb 5b04          	addw	sp,#4
 954  02bd               L411:
 955                     ; 276   if (NewState != DISABLE)
 957  02bd 0d01          	tnz	(OFST+1,sp)
 958  02bf 2706          	jreq	L362
 959                     ; 279     I2C->CR2 |= I2C_CR2_STOP;
 961  02c1 72125211      	bset	21009,#1
 963  02c5 2004          	jra	L562
 964  02c7               L362:
 965                     ; 284     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 967  02c7 72135211      	bres	21009,#1
 968  02cb               L562:
 969                     ; 286 }
 972  02cb 84            	pop	a
 973  02cc 81            	ret
1010                     ; 294 void I2C_SoftwareResetCmd(FunctionalState NewState)
1010                     ; 295 {
1011                     	switch	.text
1012  02cd               _I2C_SoftwareResetCmd:
1014  02cd 88            	push	a
1015       00000000      OFST:	set	0
1018                     ; 297   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1020  02ce 4d            	tnz	a
1021  02cf 2704          	jreq	L221
1022  02d1 a101          	cp	a,#1
1023  02d3 2603          	jrne	L021
1024  02d5               L221:
1025  02d5 4f            	clr	a
1026  02d6 2010          	jra	L421
1027  02d8               L021:
1028  02d8 ae0129        	ldw	x,#297
1029  02db 89            	pushw	x
1030  02dc ae0000        	ldw	x,#0
1031  02df 89            	pushw	x
1032  02e0 ae000c        	ldw	x,#L131
1033  02e3 cd0000        	call	_assert_failed
1035  02e6 5b04          	addw	sp,#4
1036  02e8               L421:
1037                     ; 299   if (NewState != DISABLE)
1039  02e8 0d01          	tnz	(OFST+1,sp)
1040  02ea 2706          	jreq	L503
1041                     ; 302     I2C->CR2 |= I2C_CR2_SWRST;
1043  02ec 721e5211      	bset	21009,#7
1045  02f0 2004          	jra	L703
1046  02f2               L503:
1047                     ; 307     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1049  02f2 721f5211      	bres	21009,#7
1050  02f6               L703:
1051                     ; 309 }
1054  02f6 84            	pop	a
1055  02f7 81            	ret
1092                     ; 318 void I2C_StretchClockCmd(FunctionalState NewState)
1092                     ; 319 {
1093                     	switch	.text
1094  02f8               _I2C_StretchClockCmd:
1096  02f8 88            	push	a
1097       00000000      OFST:	set	0
1100                     ; 321   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1102  02f9 4d            	tnz	a
1103  02fa 2704          	jreq	L231
1104  02fc a101          	cp	a,#1
1105  02fe 2603          	jrne	L031
1106  0300               L231:
1107  0300 4f            	clr	a
1108  0301 2010          	jra	L431
1109  0303               L031:
1110  0303 ae0141        	ldw	x,#321
1111  0306 89            	pushw	x
1112  0307 ae0000        	ldw	x,#0
1113  030a 89            	pushw	x
1114  030b ae000c        	ldw	x,#L131
1115  030e cd0000        	call	_assert_failed
1117  0311 5b04          	addw	sp,#4
1118  0313               L431:
1119                     ; 323   if (NewState != DISABLE)
1121  0313 0d01          	tnz	(OFST+1,sp)
1122  0315 2706          	jreq	L723
1123                     ; 326     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1125  0317 721f5210      	bres	21008,#7
1127  031b 2004          	jra	L133
1128  031d               L723:
1129                     ; 332     I2C->CR1 |= I2C_CR1_NOSTRETCH;
1131  031d 721e5210      	bset	21008,#7
1132  0321               L133:
1133                     ; 334 }
1136  0321 84            	pop	a
1137  0322 81            	ret
1174                     ; 343 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
1174                     ; 344 {
1175                     	switch	.text
1176  0323               _I2C_AcknowledgeConfig:
1178  0323 88            	push	a
1179       00000000      OFST:	set	0
1182                     ; 347   assert_param(IS_I2C_ACK_OK(Ack));
1184  0324 4d            	tnz	a
1185  0325 2708          	jreq	L241
1186  0327 a101          	cp	a,#1
1187  0329 2704          	jreq	L241
1188  032b a102          	cp	a,#2
1189  032d 2603          	jrne	L041
1190  032f               L241:
1191  032f 4f            	clr	a
1192  0330 2010          	jra	L441
1193  0332               L041:
1194  0332 ae015b        	ldw	x,#347
1195  0335 89            	pushw	x
1196  0336 ae0000        	ldw	x,#0
1197  0339 89            	pushw	x
1198  033a ae000c        	ldw	x,#L131
1199  033d cd0000        	call	_assert_failed
1201  0340 5b04          	addw	sp,#4
1202  0342               L441:
1203                     ; 349   if (Ack == I2C_ACK_NONE)
1205  0342 0d01          	tnz	(OFST+1,sp)
1206  0344 2606          	jrne	L153
1207                     ; 352     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1209  0346 72155211      	bres	21009,#2
1211  034a 2014          	jra	L353
1212  034c               L153:
1213                     ; 357     I2C->CR2 |= I2C_CR2_ACK;
1215  034c 72145211      	bset	21009,#2
1216                     ; 359     if (Ack == I2C_ACK_CURR)
1218  0350 7b01          	ld	a,(OFST+1,sp)
1219  0352 a101          	cp	a,#1
1220  0354 2606          	jrne	L553
1221                     ; 362       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1223  0356 72175211      	bres	21009,#3
1225  035a 2004          	jra	L353
1226  035c               L553:
1227                     ; 367       I2C->CR2 |= I2C_CR2_POS;
1229  035c 72165211      	bset	21009,#3
1230  0360               L353:
1231                     ; 370 }
1234  0360 84            	pop	a
1235  0361 81            	ret
1308                     ; 380 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1308                     ; 381 {
1309                     	switch	.text
1310  0362               _I2C_ITConfig:
1312  0362 89            	pushw	x
1313       00000000      OFST:	set	0
1316                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1318  0363 9e            	ld	a,xh
1319  0364 a101          	cp	a,#1
1320  0366 271e          	jreq	L251
1321  0368 9e            	ld	a,xh
1322  0369 a102          	cp	a,#2
1323  036b 2719          	jreq	L251
1324  036d 9e            	ld	a,xh
1325  036e a104          	cp	a,#4
1326  0370 2714          	jreq	L251
1327  0372 9e            	ld	a,xh
1328  0373 a103          	cp	a,#3
1329  0375 270f          	jreq	L251
1330  0377 9e            	ld	a,xh
1331  0378 a105          	cp	a,#5
1332  037a 270a          	jreq	L251
1333  037c 9e            	ld	a,xh
1334  037d a106          	cp	a,#6
1335  037f 2705          	jreq	L251
1336  0381 9e            	ld	a,xh
1337  0382 a107          	cp	a,#7
1338  0384 2603          	jrne	L051
1339  0386               L251:
1340  0386 4f            	clr	a
1341  0387 2010          	jra	L451
1342  0389               L051:
1343  0389 ae0180        	ldw	x,#384
1344  038c 89            	pushw	x
1345  038d ae0000        	ldw	x,#0
1346  0390 89            	pushw	x
1347  0391 ae000c        	ldw	x,#L131
1348  0394 cd0000        	call	_assert_failed
1350  0397 5b04          	addw	sp,#4
1351  0399               L451:
1352                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1354  0399 0d02          	tnz	(OFST+2,sp)
1355  039b 2706          	jreq	L061
1356  039d 7b02          	ld	a,(OFST+2,sp)
1357  039f a101          	cp	a,#1
1358  03a1 2603          	jrne	L651
1359  03a3               L061:
1360  03a3 4f            	clr	a
1361  03a4 2010          	jra	L261
1362  03a6               L651:
1363  03a6 ae0181        	ldw	x,#385
1364  03a9 89            	pushw	x
1365  03aa ae0000        	ldw	x,#0
1366  03ad 89            	pushw	x
1367  03ae ae000c        	ldw	x,#L131
1368  03b1 cd0000        	call	_assert_failed
1370  03b4 5b04          	addw	sp,#4
1371  03b6               L261:
1372                     ; 387   if (NewState != DISABLE)
1374  03b6 0d02          	tnz	(OFST+2,sp)
1375  03b8 270a          	jreq	L514
1376                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1378  03ba c6521a        	ld	a,21018
1379  03bd 1a01          	or	a,(OFST+1,sp)
1380  03bf c7521a        	ld	21018,a
1382  03c2 2009          	jra	L714
1383  03c4               L514:
1384                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1386  03c4 7b01          	ld	a,(OFST+1,sp)
1387  03c6 43            	cpl	a
1388  03c7 c4521a        	and	a,21018
1389  03ca c7521a        	ld	21018,a
1390  03cd               L714:
1391                     ; 397 }
1394  03cd 85            	popw	x
1395  03ce 81            	ret
1432                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1432                     ; 406 {
1433                     	switch	.text
1434  03cf               _I2C_FastModeDutyCycleConfig:
1436  03cf 88            	push	a
1437       00000000      OFST:	set	0
1440                     ; 409   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1442  03d0 4d            	tnz	a
1443  03d1 2704          	jreq	L071
1444  03d3 a140          	cp	a,#64
1445  03d5 2603          	jrne	L661
1446  03d7               L071:
1447  03d7 4f            	clr	a
1448  03d8 2010          	jra	L271
1449  03da               L661:
1450  03da ae0199        	ldw	x,#409
1451  03dd 89            	pushw	x
1452  03de ae0000        	ldw	x,#0
1453  03e1 89            	pushw	x
1454  03e2 ae000c        	ldw	x,#L131
1455  03e5 cd0000        	call	_assert_failed
1457  03e8 5b04          	addw	sp,#4
1458  03ea               L271:
1459                     ; 411   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1461  03ea 7b01          	ld	a,(OFST+1,sp)
1462  03ec a140          	cp	a,#64
1463  03ee 2606          	jrne	L734
1464                     ; 414     I2C->CCRH |= I2C_CCRH_DUTY;
1466  03f0 721c521c      	bset	21020,#6
1468  03f4 2004          	jra	L144
1469  03f6               L734:
1470                     ; 419     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1472  03f6 721d521c      	bres	21020,#6
1473  03fa               L144:
1474                     ; 421 }
1477  03fa 84            	pop	a
1478  03fb 81            	ret
1501                     ; 428 uint8_t I2C_ReceiveData(void)
1501                     ; 429 {
1502                     	switch	.text
1503  03fc               _I2C_ReceiveData:
1507                     ; 431   return ((uint8_t)I2C->DR);
1509  03fc c65216        	ld	a,21014
1512  03ff 81            	ret
1578                     ; 441 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1578                     ; 442 {
1579                     	switch	.text
1580  0400               _I2C_Send7bitAddress:
1582  0400 89            	pushw	x
1583       00000000      OFST:	set	0
1586                     ; 444   assert_param(IS_I2C_ADDRESS_OK(Address));
1588  0401 9e            	ld	a,xh
1589  0402 a501          	bcp	a,#1
1590  0404 2603          	jrne	L002
1591  0406 4f            	clr	a
1592  0407 2010          	jra	L202
1593  0409               L002:
1594  0409 ae01bc        	ldw	x,#444
1595  040c 89            	pushw	x
1596  040d ae0000        	ldw	x,#0
1597  0410 89            	pushw	x
1598  0411 ae000c        	ldw	x,#L131
1599  0414 cd0000        	call	_assert_failed
1601  0417 5b04          	addw	sp,#4
1602  0419               L202:
1603                     ; 445   assert_param(IS_I2C_DIRECTION_OK(Direction));
1605  0419 0d02          	tnz	(OFST+2,sp)
1606  041b 2706          	jreq	L602
1607  041d 7b02          	ld	a,(OFST+2,sp)
1608  041f a101          	cp	a,#1
1609  0421 2603          	jrne	L402
1610  0423               L602:
1611  0423 4f            	clr	a
1612  0424 2010          	jra	L012
1613  0426               L402:
1614  0426 ae01bd        	ldw	x,#445
1615  0429 89            	pushw	x
1616  042a ae0000        	ldw	x,#0
1617  042d 89            	pushw	x
1618  042e ae000c        	ldw	x,#L131
1619  0431 cd0000        	call	_assert_failed
1621  0434 5b04          	addw	sp,#4
1622  0436               L012:
1623                     ; 448   Address &= (uint8_t)0xFE;
1625  0436 7b01          	ld	a,(OFST+1,sp)
1626  0438 a4fe          	and	a,#254
1627  043a 6b01          	ld	(OFST+1,sp),a
1628                     ; 451   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1630  043c 7b01          	ld	a,(OFST+1,sp)
1631  043e 1a02          	or	a,(OFST+2,sp)
1632  0440 c75216        	ld	21014,a
1633                     ; 452 }
1636  0443 85            	popw	x
1637  0444 81            	ret
1671                     ; 459 void I2C_SendData(uint8_t Data)
1671                     ; 460 {
1672                     	switch	.text
1673  0445               _I2C_SendData:
1677                     ; 462   I2C->DR = Data;
1679  0445 c75216        	ld	21014,a
1680                     ; 463 }
1683  0448 81            	ret
1908                     ; 579 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1908                     ; 580 {
1909                     	switch	.text
1910  0449               _I2C_CheckEvent:
1912  0449 89            	pushw	x
1913  044a 5206          	subw	sp,#6
1914       00000006      OFST:	set	6
1917                     ; 581   __IO uint16_t lastevent = 0x00;
1919  044c 5f            	clrw	x
1920  044d 1f04          	ldw	(OFST-2,sp),x
1921                     ; 582   uint8_t flag1 = 0x00 ;
1923                     ; 583   uint8_t flag2 = 0x00;
1925                     ; 584   ErrorStatus status = ERROR;
1927                     ; 587   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1929  044f 1e07          	ldw	x,(OFST+1,sp)
1930  0451 a30682        	cpw	x,#1666
1931  0454 2769          	jreq	L022
1932  0456 1e07          	ldw	x,(OFST+1,sp)
1933  0458 a30202        	cpw	x,#514
1934  045b 2762          	jreq	L022
1935  045d 1e07          	ldw	x,(OFST+1,sp)
1936  045f a31200        	cpw	x,#4608
1937  0462 275b          	jreq	L022
1938  0464 1e07          	ldw	x,(OFST+1,sp)
1939  0466 a30240        	cpw	x,#576
1940  0469 2754          	jreq	L022
1941  046b 1e07          	ldw	x,(OFST+1,sp)
1942  046d a30350        	cpw	x,#848
1943  0470 274d          	jreq	L022
1944  0472 1e07          	ldw	x,(OFST+1,sp)
1945  0474 a30684        	cpw	x,#1668
1946  0477 2746          	jreq	L022
1947  0479 1e07          	ldw	x,(OFST+1,sp)
1948  047b a30794        	cpw	x,#1940
1949  047e 273f          	jreq	L022
1950  0480 1e07          	ldw	x,(OFST+1,sp)
1951  0482 a30004        	cpw	x,#4
1952  0485 2738          	jreq	L022
1953  0487 1e07          	ldw	x,(OFST+1,sp)
1954  0489 a30010        	cpw	x,#16
1955  048c 2731          	jreq	L022
1956  048e 1e07          	ldw	x,(OFST+1,sp)
1957  0490 a30301        	cpw	x,#769
1958  0493 272a          	jreq	L022
1959  0495 1e07          	ldw	x,(OFST+1,sp)
1960  0497 a30782        	cpw	x,#1922
1961  049a 2723          	jreq	L022
1962  049c 1e07          	ldw	x,(OFST+1,sp)
1963  049e a30302        	cpw	x,#770
1964  04a1 271c          	jreq	L022
1965  04a3 1e07          	ldw	x,(OFST+1,sp)
1966  04a5 a30340        	cpw	x,#832
1967  04a8 2715          	jreq	L022
1968  04aa 1e07          	ldw	x,(OFST+1,sp)
1969  04ac a30784        	cpw	x,#1924
1970  04af 270e          	jreq	L022
1971  04b1 1e07          	ldw	x,(OFST+1,sp)
1972  04b3 a30780        	cpw	x,#1920
1973  04b6 2707          	jreq	L022
1974  04b8 1e07          	ldw	x,(OFST+1,sp)
1975  04ba a30308        	cpw	x,#776
1976  04bd 2603          	jrne	L612
1977  04bf               L022:
1978  04bf 4f            	clr	a
1979  04c0 2010          	jra	L222
1980  04c2               L612:
1981  04c2 ae024b        	ldw	x,#587
1982  04c5 89            	pushw	x
1983  04c6 ae0000        	ldw	x,#0
1984  04c9 89            	pushw	x
1985  04ca ae000c        	ldw	x,#L131
1986  04cd cd0000        	call	_assert_failed
1988  04d0 5b04          	addw	sp,#4
1989  04d2               L222:
1990                     ; 589   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1992  04d2 1e07          	ldw	x,(OFST+1,sp)
1993  04d4 a30004        	cpw	x,#4
1994  04d7 260b          	jrne	L336
1995                     ; 591     lastevent = I2C->SR2 & I2C_SR2_AF;
1997  04d9 c65218        	ld	a,21016
1998  04dc a404          	and	a,#4
1999  04de 5f            	clrw	x
2000  04df 97            	ld	xl,a
2001  04e0 1f04          	ldw	(OFST-2,sp),x
2003  04e2 201f          	jra	L536
2004  04e4               L336:
2005                     ; 595     flag1 = I2C->SR1;
2007  04e4 c65217        	ld	a,21015
2008  04e7 6b03          	ld	(OFST-3,sp),a
2009                     ; 596     flag2 = I2C->SR3;
2011  04e9 c65219        	ld	a,21017
2012  04ec 6b06          	ld	(OFST+0,sp),a
2013                     ; 597     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
2015  04ee 7b03          	ld	a,(OFST-3,sp)
2016  04f0 5f            	clrw	x
2017  04f1 97            	ld	xl,a
2018  04f2 1f01          	ldw	(OFST-5,sp),x
2019  04f4 7b06          	ld	a,(OFST+0,sp)
2020  04f6 5f            	clrw	x
2021  04f7 97            	ld	xl,a
2022  04f8 4f            	clr	a
2023  04f9 02            	rlwa	x,a
2024  04fa 01            	rrwa	x,a
2025  04fb 1a02          	or	a,(OFST-4,sp)
2026  04fd 01            	rrwa	x,a
2027  04fe 1a01          	or	a,(OFST-5,sp)
2028  0500 01            	rrwa	x,a
2029  0501 1f04          	ldw	(OFST-2,sp),x
2030  0503               L536:
2031                     ; 600   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
2033  0503 1e04          	ldw	x,(OFST-2,sp)
2034  0505 01            	rrwa	x,a
2035  0506 1408          	and	a,(OFST+2,sp)
2036  0508 01            	rrwa	x,a
2037  0509 1407          	and	a,(OFST+1,sp)
2038  050b 01            	rrwa	x,a
2039  050c 1307          	cpw	x,(OFST+1,sp)
2040  050e 2606          	jrne	L736
2041                     ; 603     status = SUCCESS;
2043  0510 a601          	ld	a,#1
2044  0512 6b06          	ld	(OFST+0,sp),a
2046  0514 2002          	jra	L146
2047  0516               L736:
2048                     ; 608     status = ERROR;
2050  0516 0f06          	clr	(OFST+0,sp)
2051  0518               L146:
2052                     ; 612   return status;
2054  0518 7b06          	ld	a,(OFST+0,sp)
2057  051a 5b08          	addw	sp,#8
2058  051c 81            	ret
2111                     ; 629 I2C_Event_TypeDef I2C_GetLastEvent(void)
2111                     ; 630 {
2112                     	switch	.text
2113  051d               _I2C_GetLastEvent:
2115  051d 5206          	subw	sp,#6
2116       00000006      OFST:	set	6
2119                     ; 631   __IO uint16_t lastevent = 0;
2121  051f 5f            	clrw	x
2122  0520 1f05          	ldw	(OFST-1,sp),x
2123                     ; 632   uint16_t flag1 = 0;
2125                     ; 633   uint16_t flag2 = 0;
2127                     ; 635   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
2129  0522 c65218        	ld	a,21016
2130  0525 a504          	bcp	a,#4
2131  0527 2707          	jreq	L176
2132                     ; 637     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
2134  0529 ae0004        	ldw	x,#4
2135  052c 1f05          	ldw	(OFST-1,sp),x
2137  052e 201b          	jra	L376
2138  0530               L176:
2139                     ; 642     flag1 = I2C->SR1;
2141  0530 c65217        	ld	a,21015
2142  0533 5f            	clrw	x
2143  0534 97            	ld	xl,a
2144  0535 1f01          	ldw	(OFST-5,sp),x
2145                     ; 643     flag2 = I2C->SR3;
2147  0537 c65219        	ld	a,21017
2148  053a 5f            	clrw	x
2149  053b 97            	ld	xl,a
2150  053c 1f03          	ldw	(OFST-3,sp),x
2151                     ; 646     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
2153  053e 1e03          	ldw	x,(OFST-3,sp)
2154  0540 4f            	clr	a
2155  0541 02            	rlwa	x,a
2156  0542 01            	rrwa	x,a
2157  0543 1a02          	or	a,(OFST-4,sp)
2158  0545 01            	rrwa	x,a
2159  0546 1a01          	or	a,(OFST-5,sp)
2160  0548 01            	rrwa	x,a
2161  0549 1f05          	ldw	(OFST-1,sp),x
2162  054b               L376:
2163                     ; 649   return (I2C_Event_TypeDef)lastevent;
2165  054b 1e05          	ldw	x,(OFST-1,sp)
2168  054d 5b06          	addw	sp,#6
2169  054f 81            	ret
2385                     ; 680 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
2385                     ; 681 {
2386                     	switch	.text
2387  0550               _I2C_GetFlagStatus:
2389  0550 89            	pushw	x
2390  0551 89            	pushw	x
2391       00000002      OFST:	set	2
2394                     ; 682   uint8_t tempreg = 0;
2396  0552 0f02          	clr	(OFST+0,sp)
2397                     ; 683   uint8_t regindex = 0;
2399                     ; 684   FlagStatus bitstatus = RESET;
2401                     ; 687   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
2403  0554 a30180        	cpw	x,#384
2404  0557 274b          	jreq	L232
2405  0559 a30140        	cpw	x,#320
2406  055c 2746          	jreq	L232
2407  055e a30110        	cpw	x,#272
2408  0561 2741          	jreq	L232
2409  0563 a30108        	cpw	x,#264
2410  0566 273c          	jreq	L232
2411  0568 a30104        	cpw	x,#260
2412  056b 2737          	jreq	L232
2413  056d a30102        	cpw	x,#258
2414  0570 2732          	jreq	L232
2415  0572 a30101        	cpw	x,#257
2416  0575 272d          	jreq	L232
2417  0577 a30220        	cpw	x,#544
2418  057a 2728          	jreq	L232
2419  057c a30208        	cpw	x,#520
2420  057f 2723          	jreq	L232
2421  0581 a30204        	cpw	x,#516
2422  0584 271e          	jreq	L232
2423  0586 a30202        	cpw	x,#514
2424  0589 2719          	jreq	L232
2425  058b a30201        	cpw	x,#513
2426  058e 2714          	jreq	L232
2427  0590 a30310        	cpw	x,#784
2428  0593 270f          	jreq	L232
2429  0595 a30304        	cpw	x,#772
2430  0598 270a          	jreq	L232
2431  059a a30302        	cpw	x,#770
2432  059d 2705          	jreq	L232
2433  059f a30301        	cpw	x,#769
2434  05a2 2603          	jrne	L032
2435  05a4               L232:
2436  05a4 4f            	clr	a
2437  05a5 2010          	jra	L432
2438  05a7               L032:
2439  05a7 ae02af        	ldw	x,#687
2440  05aa 89            	pushw	x
2441  05ab ae0000        	ldw	x,#0
2442  05ae 89            	pushw	x
2443  05af ae000c        	ldw	x,#L131
2444  05b2 cd0000        	call	_assert_failed
2446  05b5 5b04          	addw	sp,#4
2447  05b7               L432:
2448                     ; 690   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2450  05b7 7b03          	ld	a,(OFST+1,sp)
2451  05b9 6b01          	ld	(OFST-1,sp),a
2452                     ; 692   switch (regindex)
2454  05bb 7b01          	ld	a,(OFST-1,sp)
2456                     ; 709     default:
2456                     ; 710       break;
2457  05bd 4a            	dec	a
2458  05be 2708          	jreq	L576
2459  05c0 4a            	dec	a
2460  05c1 270c          	jreq	L776
2461  05c3 4a            	dec	a
2462  05c4 2710          	jreq	L107
2463  05c6 2013          	jra	L5101
2464  05c8               L576:
2465                     ; 695     case 0x01:
2465                     ; 696       tempreg = (uint8_t)I2C->SR1;
2467  05c8 c65217        	ld	a,21015
2468  05cb 6b02          	ld	(OFST+0,sp),a
2469                     ; 697       break;
2471  05cd 200c          	jra	L5101
2472  05cf               L776:
2473                     ; 700     case 0x02:
2473                     ; 701       tempreg = (uint8_t)I2C->SR2;
2475  05cf c65218        	ld	a,21016
2476  05d2 6b02          	ld	(OFST+0,sp),a
2477                     ; 702       break;
2479  05d4 2005          	jra	L5101
2480  05d6               L107:
2481                     ; 705     case 0x03:
2481                     ; 706       tempreg = (uint8_t)I2C->SR3;
2483  05d6 c65219        	ld	a,21017
2484  05d9 6b02          	ld	(OFST+0,sp),a
2485                     ; 707       break;
2487  05db               L307:
2488                     ; 709     default:
2488                     ; 710       break;
2490  05db               L5101:
2491                     ; 714   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2493  05db 7b04          	ld	a,(OFST+2,sp)
2494  05dd 1502          	bcp	a,(OFST+0,sp)
2495  05df 2706          	jreq	L7101
2496                     ; 717     bitstatus = SET;
2498  05e1 a601          	ld	a,#1
2499  05e3 6b02          	ld	(OFST+0,sp),a
2501  05e5 2002          	jra	L1201
2502  05e7               L7101:
2503                     ; 722     bitstatus = RESET;
2505  05e7 0f02          	clr	(OFST+0,sp)
2506  05e9               L1201:
2507                     ; 725   return bitstatus;
2509  05e9 7b02          	ld	a,(OFST+0,sp)
2512  05eb 5b04          	addw	sp,#4
2513  05ed 81            	ret
2558                     ; 760 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2558                     ; 761 {
2559                     	switch	.text
2560  05ee               _I2C_ClearFlag:
2562  05ee 89            	pushw	x
2563  05ef 89            	pushw	x
2564       00000002      OFST:	set	2
2567                     ; 762   uint16_t flagpos = 0;
2569                     ; 764   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2571  05f0 01            	rrwa	x,a
2572  05f1 9f            	ld	a,xl
2573  05f2 a4fd          	and	a,#253
2574  05f4 97            	ld	xl,a
2575  05f5 4f            	clr	a
2576  05f6 02            	rlwa	x,a
2577  05f7 5d            	tnzw	x
2578  05f8 2607          	jrne	L042
2579  05fa 1e03          	ldw	x,(OFST+1,sp)
2580  05fc 2703          	jreq	L042
2581  05fe 4f            	clr	a
2582  05ff 2010          	jra	L242
2583  0601               L042:
2584  0601 ae02fc        	ldw	x,#764
2585  0604 89            	pushw	x
2586  0605 ae0000        	ldw	x,#0
2587  0608 89            	pushw	x
2588  0609 ae000c        	ldw	x,#L131
2589  060c cd0000        	call	_assert_failed
2591  060f 5b04          	addw	sp,#4
2592  0611               L242:
2593                     ; 767   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2595  0611 7b03          	ld	a,(OFST+1,sp)
2596  0613 97            	ld	xl,a
2597  0614 7b04          	ld	a,(OFST+2,sp)
2598  0616 a4ff          	and	a,#255
2599  0618 5f            	clrw	x
2600  0619 02            	rlwa	x,a
2601  061a 1f01          	ldw	(OFST-1,sp),x
2602  061c 01            	rrwa	x,a
2603                     ; 769   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2605  061d 7b02          	ld	a,(OFST+0,sp)
2606  061f 43            	cpl	a
2607  0620 c75218        	ld	21016,a
2608                     ; 770 }
2611  0623 5b04          	addw	sp,#4
2612  0625 81            	ret
2779                     ; 792 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2779                     ; 793 {
2780                     	switch	.text
2781  0626               _I2C_GetITStatus:
2783  0626 89            	pushw	x
2784  0627 5204          	subw	sp,#4
2785       00000004      OFST:	set	4
2788                     ; 794   ITStatus bitstatus = RESET;
2790                     ; 795   __IO uint8_t enablestatus = 0;
2792  0629 0f03          	clr	(OFST-1,sp)
2793                     ; 796   uint16_t tempregister = 0;
2795                     ; 799     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2797  062b a31680        	cpw	x,#5760
2798  062e 2737          	jreq	L052
2799  0630 a31640        	cpw	x,#5696
2800  0633 2732          	jreq	L052
2801  0635 a31210        	cpw	x,#4624
2802  0638 272d          	jreq	L052
2803  063a a31208        	cpw	x,#4616
2804  063d 2728          	jreq	L052
2805  063f a31204        	cpw	x,#4612
2806  0642 2723          	jreq	L052
2807  0644 a31202        	cpw	x,#4610
2808  0647 271e          	jreq	L052
2809  0649 a31201        	cpw	x,#4609
2810  064c 2719          	jreq	L052
2811  064e a32220        	cpw	x,#8736
2812  0651 2714          	jreq	L052
2813  0653 a32108        	cpw	x,#8456
2814  0656 270f          	jreq	L052
2815  0658 a32104        	cpw	x,#8452
2816  065b 270a          	jreq	L052
2817  065d a32102        	cpw	x,#8450
2818  0660 2705          	jreq	L052
2819  0662 a32101        	cpw	x,#8449
2820  0665 2603          	jrne	L642
2821  0667               L052:
2822  0667 4f            	clr	a
2823  0668 2010          	jra	L252
2824  066a               L642:
2825  066a ae031f        	ldw	x,#799
2826  066d 89            	pushw	x
2827  066e ae0000        	ldw	x,#0
2828  0671 89            	pushw	x
2829  0672 ae000c        	ldw	x,#L131
2830  0675 cd0000        	call	_assert_failed
2832  0678 5b04          	addw	sp,#4
2833  067a               L252:
2834                     ; 801   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2836  067a 7b05          	ld	a,(OFST+1,sp)
2837  067c 97            	ld	xl,a
2838  067d 7b06          	ld	a,(OFST+2,sp)
2839  067f 9f            	ld	a,xl
2840  0680 a407          	and	a,#7
2841  0682 97            	ld	xl,a
2842  0683 4f            	clr	a
2843  0684 02            	rlwa	x,a
2844  0685 4f            	clr	a
2845  0686 01            	rrwa	x,a
2846  0687 9f            	ld	a,xl
2847  0688 5f            	clrw	x
2848  0689 97            	ld	xl,a
2849  068a 1f01          	ldw	(OFST-3,sp),x
2850                     ; 804   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2852  068c c6521a        	ld	a,21018
2853  068f 1402          	and	a,(OFST-2,sp)
2854  0691 6b03          	ld	(OFST-1,sp),a
2855                     ; 806   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2857  0693 7b05          	ld	a,(OFST+1,sp)
2858  0695 97            	ld	xl,a
2859  0696 7b06          	ld	a,(OFST+2,sp)
2860  0698 9f            	ld	a,xl
2861  0699 a430          	and	a,#48
2862  069b 97            	ld	xl,a
2863  069c 4f            	clr	a
2864  069d 02            	rlwa	x,a
2865  069e a30100        	cpw	x,#256
2866  06a1 2615          	jrne	L3311
2867                     ; 809     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2869  06a3 c65217        	ld	a,21015
2870  06a6 1506          	bcp	a,(OFST+2,sp)
2871  06a8 270a          	jreq	L5311
2873  06aa 0d03          	tnz	(OFST-1,sp)
2874  06ac 2706          	jreq	L5311
2875                     ; 812       bitstatus = SET;
2877  06ae a601          	ld	a,#1
2878  06b0 6b04          	ld	(OFST+0,sp),a
2880  06b2 2017          	jra	L1411
2881  06b4               L5311:
2882                     ; 817       bitstatus = RESET;
2884  06b4 0f04          	clr	(OFST+0,sp)
2885  06b6 2013          	jra	L1411
2886  06b8               L3311:
2887                     ; 823     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2889  06b8 c65218        	ld	a,21016
2890  06bb 1506          	bcp	a,(OFST+2,sp)
2891  06bd 270a          	jreq	L3411
2893  06bf 0d03          	tnz	(OFST-1,sp)
2894  06c1 2706          	jreq	L3411
2895                     ; 826       bitstatus = SET;
2897  06c3 a601          	ld	a,#1
2898  06c5 6b04          	ld	(OFST+0,sp),a
2900  06c7 2002          	jra	L1411
2901  06c9               L3411:
2902                     ; 831       bitstatus = RESET;
2904  06c9 0f04          	clr	(OFST+0,sp)
2905  06cb               L1411:
2906                     ; 835   return  bitstatus;
2908  06cb 7b04          	ld	a,(OFST+0,sp)
2911  06cd 5b06          	addw	sp,#6
2912  06cf 81            	ret
2958                     ; 873 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2958                     ; 874 {
2959                     	switch	.text
2960  06d0               _I2C_ClearITPendingBit:
2962  06d0 89            	pushw	x
2963  06d1 89            	pushw	x
2964       00000002      OFST:	set	2
2967                     ; 875   uint16_t flagpos = 0;
2969                     ; 878   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2971  06d2 a32220        	cpw	x,#8736
2972  06d5 2714          	jreq	L062
2973  06d7 a32108        	cpw	x,#8456
2974  06da 270f          	jreq	L062
2975  06dc a32104        	cpw	x,#8452
2976  06df 270a          	jreq	L062
2977  06e1 a32102        	cpw	x,#8450
2978  06e4 2705          	jreq	L062
2979  06e6 a32101        	cpw	x,#8449
2980  06e9 2603          	jrne	L652
2981  06eb               L062:
2982  06eb 4f            	clr	a
2983  06ec 2010          	jra	L262
2984  06ee               L652:
2985  06ee ae036e        	ldw	x,#878
2986  06f1 89            	pushw	x
2987  06f2 ae0000        	ldw	x,#0
2988  06f5 89            	pushw	x
2989  06f6 ae000c        	ldw	x,#L131
2990  06f9 cd0000        	call	_assert_failed
2992  06fc 5b04          	addw	sp,#4
2993  06fe               L262:
2994                     ; 881   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2996  06fe 7b03          	ld	a,(OFST+1,sp)
2997  0700 97            	ld	xl,a
2998  0701 7b04          	ld	a,(OFST+2,sp)
2999  0703 a4ff          	and	a,#255
3000  0705 5f            	clrw	x
3001  0706 02            	rlwa	x,a
3002  0707 1f01          	ldw	(OFST-1,sp),x
3003  0709 01            	rrwa	x,a
3004                     ; 884   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
3006  070a 7b02          	ld	a,(OFST+0,sp)
3007  070c 43            	cpl	a
3008  070d c75218        	ld	21016,a
3009                     ; 885 }
3012  0710 5b04          	addw	sp,#4
3013  0712 81            	ret
3026                     	xdef	_I2C_ClearITPendingBit
3027                     	xdef	_I2C_GetITStatus
3028                     	xdef	_I2C_ClearFlag
3029                     	xdef	_I2C_GetFlagStatus
3030                     	xdef	_I2C_GetLastEvent
3031                     	xdef	_I2C_CheckEvent
3032                     	xdef	_I2C_SendData
3033                     	xdef	_I2C_Send7bitAddress
3034                     	xdef	_I2C_ReceiveData
3035                     	xdef	_I2C_ITConfig
3036                     	xdef	_I2C_FastModeDutyCycleConfig
3037                     	xdef	_I2C_AcknowledgeConfig
3038                     	xdef	_I2C_StretchClockCmd
3039                     	xdef	_I2C_SoftwareResetCmd
3040                     	xdef	_I2C_GenerateSTOP
3041                     	xdef	_I2C_GenerateSTART
3042                     	xdef	_I2C_GeneralCallCmd
3043                     	xdef	_I2C_Cmd
3044                     	xdef	_I2C_Init
3045                     	xdef	_I2C_DeInit
3046                     	xref	_assert_failed
3047                     	switch	.const
3048  000c               L131:
3049  000c 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_i"
3050  001e 32632e6300    	dc.b	"2c.c",0
3051                     	xref.b	c_lreg
3052                     	xref.b	c_x
3072                     	xref	c_sdivx
3073                     	xref	c_ludv
3074                     	xref	c_rtol
3075                     	xref	c_smul
3076                     	xref	c_lmul
3077                     	xref	c_lcmp
3078                     	xref	c_ltor
3079                     	xref	c_lzmp
3080                     	end
