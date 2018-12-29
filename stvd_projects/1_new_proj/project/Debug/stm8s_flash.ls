   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  76                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  76                     ; 82 {
  78                     	switch	.text
  79  0000               _FLASH_Unlock:
  81  0000 88            	push	a
  82       00000000      OFST:	set	0
  85                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  87  0001 a1fd          	cp	a,#253
  88  0003 2704          	jreq	L01
  89  0005 a1f7          	cp	a,#247
  90  0007 2603          	jrne	L6
  91  0009               L01:
  92  0009 4f            	clr	a
  93  000a 2010          	jra	L21
  94  000c               L6:
  95  000c ae0054        	ldw	x,#84
  96  000f 89            	pushw	x
  97  0010 ae0000        	ldw	x,#0
  98  0013 89            	pushw	x
  99  0014 ae0010        	ldw	x,#L73
 100  0017 cd0000        	call	_assert_failed
 102  001a 5b04          	addw	sp,#4
 103  001c               L21:
 104                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
 106  001c 7b01          	ld	a,(OFST+1,sp)
 107  001e a1fd          	cp	a,#253
 108  0020 260a          	jrne	L14
 109                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
 111  0022 35565062      	mov	20578,#86
 112                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
 114  0026 35ae5062      	mov	20578,#174
 116  002a 2008          	jra	L34
 117  002c               L14:
 118                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 120  002c 35ae5064      	mov	20580,#174
 121                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 123  0030 35565064      	mov	20580,#86
 124  0034               L34:
 125                     ; 98 }
 128  0034 84            	pop	a
 129  0035 81            	ret
 165                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 165                     ; 107 {
 166                     	switch	.text
 167  0036               _FLASH_Lock:
 169  0036 88            	push	a
 170       00000000      OFST:	set	0
 173                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 175  0037 a1fd          	cp	a,#253
 176  0039 2704          	jreq	L02
 177  003b a1f7          	cp	a,#247
 178  003d 2603          	jrne	L61
 179  003f               L02:
 180  003f 4f            	clr	a
 181  0040 2010          	jra	L22
 182  0042               L61:
 183  0042 ae006d        	ldw	x,#109
 184  0045 89            	pushw	x
 185  0046 ae0000        	ldw	x,#0
 186  0049 89            	pushw	x
 187  004a ae0010        	ldw	x,#L73
 188  004d cd0000        	call	_assert_failed
 190  0050 5b04          	addw	sp,#4
 191  0052               L22:
 192                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 194  0052 c6505f        	ld	a,20575
 195  0055 1401          	and	a,(OFST+1,sp)
 196  0057 c7505f        	ld	20575,a
 197                     ; 113 }
 200  005a 84            	pop	a
 201  005b 81            	ret
 224                     ; 120 void FLASH_DeInit(void)
 224                     ; 121 {
 225                     	switch	.text
 226  005c               _FLASH_DeInit:
 230                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 232  005c 725f505a      	clr	20570
 233                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 235  0060 725f505b      	clr	20571
 236                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 238  0064 35ff505c      	mov	20572,#255
 239                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 241  0068 7217505f      	bres	20575,#3
 242                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 244  006c 7213505f      	bres	20575,#1
 245                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 247  0070 c6505f        	ld	a,20575
 248                     ; 128 }
 251  0073 81            	ret
 307                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 307                     ; 137 {
 308                     	switch	.text
 309  0074               _FLASH_ITConfig:
 311  0074 88            	push	a
 312       00000000      OFST:	set	0
 315                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 317  0075 4d            	tnz	a
 318  0076 2704          	jreq	L23
 319  0078 a101          	cp	a,#1
 320  007a 2603          	jrne	L03
 321  007c               L23:
 322  007c 4f            	clr	a
 323  007d 2010          	jra	L43
 324  007f               L03:
 325  007f ae008b        	ldw	x,#139
 326  0082 89            	pushw	x
 327  0083 ae0000        	ldw	x,#0
 328  0086 89            	pushw	x
 329  0087 ae0010        	ldw	x,#L73
 330  008a cd0000        	call	_assert_failed
 332  008d 5b04          	addw	sp,#4
 333  008f               L43:
 334                     ; 141     if (NewState != DISABLE)
 336  008f 0d01          	tnz	(OFST+1,sp)
 337  0091 2706          	jreq	L121
 338                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 340  0093 7212505a      	bset	20570,#1
 342  0097 2004          	jra	L321
 343  0099               L121:
 344                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 346  0099 7213505a      	bres	20570,#1
 347  009d               L321:
 348                     ; 149 }
 351  009d 84            	pop	a
 352  009e 81            	ret
 387                     .const:	section	.text
 388  0000               L64:
 389  0000 00008000      	dc.l	32768
 390  0004               L05:
 391  0004 0000a000      	dc.l	40960
 392  0008               L25:
 393  0008 00004000      	dc.l	16384
 394  000c               L45:
 395  000c 00004280      	dc.l	17024
 396                     ; 158 void FLASH_EraseByte(uint32_t Address)
 396                     ; 159 {
 397                     	switch	.text
 398  009f               _FLASH_EraseByte:
 400       00000000      OFST:	set	0
 403                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 405  009f 96            	ldw	x,sp
 406  00a0 1c0003        	addw	x,#OFST+3
 407  00a3 cd0000        	call	c_ltor
 409  00a6 ae0000        	ldw	x,#L64
 410  00a9 cd0000        	call	c_lcmp
 412  00ac 250f          	jrult	L44
 413  00ae 96            	ldw	x,sp
 414  00af 1c0003        	addw	x,#OFST+3
 415  00b2 cd0000        	call	c_ltor
 417  00b5 ae0004        	ldw	x,#L05
 418  00b8 cd0000        	call	c_lcmp
 420  00bb 251e          	jrult	L24
 421  00bd               L44:
 422  00bd 96            	ldw	x,sp
 423  00be 1c0003        	addw	x,#OFST+3
 424  00c1 cd0000        	call	c_ltor
 426  00c4 ae0008        	ldw	x,#L25
 427  00c7 cd0000        	call	c_lcmp
 429  00ca 2512          	jrult	L04
 430  00cc 96            	ldw	x,sp
 431  00cd 1c0003        	addw	x,#OFST+3
 432  00d0 cd0000        	call	c_ltor
 434  00d3 ae000c        	ldw	x,#L45
 435  00d6 cd0000        	call	c_lcmp
 437  00d9 2403          	jruge	L04
 438  00db               L24:
 439  00db 4f            	clr	a
 440  00dc 2010          	jra	L65
 441  00de               L04:
 442  00de ae00a1        	ldw	x,#161
 443  00e1 89            	pushw	x
 444  00e2 ae0000        	ldw	x,#0
 445  00e5 89            	pushw	x
 446  00e6 ae0010        	ldw	x,#L73
 447  00e9 cd0000        	call	_assert_failed
 449  00ec 5b04          	addw	sp,#4
 450  00ee               L65:
 451                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 453  00ee 1e05          	ldw	x,(OFST+5,sp)
 454  00f0 7f            	clr	(x)
 455                     ; 166 }
 458  00f1 81            	ret
 502                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 502                     ; 177 {
 503                     	switch	.text
 504  00f2               _FLASH_ProgramByte:
 506       00000000      OFST:	set	0
 509                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 511  00f2 96            	ldw	x,sp
 512  00f3 1c0003        	addw	x,#OFST+3
 513  00f6 cd0000        	call	c_ltor
 515  00f9 ae0000        	ldw	x,#L64
 516  00fc cd0000        	call	c_lcmp
 518  00ff 250f          	jrult	L66
 519  0101 96            	ldw	x,sp
 520  0102 1c0003        	addw	x,#OFST+3
 521  0105 cd0000        	call	c_ltor
 523  0108 ae0004        	ldw	x,#L05
 524  010b cd0000        	call	c_lcmp
 526  010e 251e          	jrult	L46
 527  0110               L66:
 528  0110 96            	ldw	x,sp
 529  0111 1c0003        	addw	x,#OFST+3
 530  0114 cd0000        	call	c_ltor
 532  0117 ae0008        	ldw	x,#L25
 533  011a cd0000        	call	c_lcmp
 535  011d 2512          	jrult	L26
 536  011f 96            	ldw	x,sp
 537  0120 1c0003        	addw	x,#OFST+3
 538  0123 cd0000        	call	c_ltor
 540  0126 ae000c        	ldw	x,#L45
 541  0129 cd0000        	call	c_lcmp
 543  012c 2403          	jruge	L26
 544  012e               L46:
 545  012e 4f            	clr	a
 546  012f 2010          	jra	L07
 547  0131               L26:
 548  0131 ae00b3        	ldw	x,#179
 549  0134 89            	pushw	x
 550  0135 ae0000        	ldw	x,#0
 551  0138 89            	pushw	x
 552  0139 ae0010        	ldw	x,#L73
 553  013c cd0000        	call	_assert_failed
 555  013f 5b04          	addw	sp,#4
 556  0141               L07:
 557                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 559  0141 7b07          	ld	a,(OFST+7,sp)
 560  0143 1e05          	ldw	x,(OFST+5,sp)
 561  0145 f7            	ld	(x),a
 562                     ; 181 }
 565  0146 81            	ret
 600                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 600                     ; 191 {
 601                     	switch	.text
 602  0147               _FLASH_ReadByte:
 604       00000000      OFST:	set	0
 607                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 609  0147 96            	ldw	x,sp
 610  0148 1c0003        	addw	x,#OFST+3
 611  014b cd0000        	call	c_ltor
 613  014e ae0000        	ldw	x,#L64
 614  0151 cd0000        	call	c_lcmp
 616  0154 250f          	jrult	L001
 617  0156 96            	ldw	x,sp
 618  0157 1c0003        	addw	x,#OFST+3
 619  015a cd0000        	call	c_ltor
 621  015d ae0004        	ldw	x,#L05
 622  0160 cd0000        	call	c_lcmp
 624  0163 251e          	jrult	L67
 625  0165               L001:
 626  0165 96            	ldw	x,sp
 627  0166 1c0003        	addw	x,#OFST+3
 628  0169 cd0000        	call	c_ltor
 630  016c ae0008        	ldw	x,#L25
 631  016f cd0000        	call	c_lcmp
 633  0172 2512          	jrult	L47
 634  0174 96            	ldw	x,sp
 635  0175 1c0003        	addw	x,#OFST+3
 636  0178 cd0000        	call	c_ltor
 638  017b ae000c        	ldw	x,#L45
 639  017e cd0000        	call	c_lcmp
 641  0181 2403          	jruge	L47
 642  0183               L67:
 643  0183 4f            	clr	a
 644  0184 2010          	jra	L201
 645  0186               L47:
 646  0186 ae00c1        	ldw	x,#193
 647  0189 89            	pushw	x
 648  018a ae0000        	ldw	x,#0
 649  018d 89            	pushw	x
 650  018e ae0010        	ldw	x,#L73
 651  0191 cd0000        	call	_assert_failed
 653  0194 5b04          	addw	sp,#4
 654  0196               L201:
 655                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 657  0196 1e05          	ldw	x,(OFST+5,sp)
 658  0198 f6            	ld	a,(x)
 661  0199 81            	ret
 705                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 705                     ; 208 {
 706                     	switch	.text
 707  019a               _FLASH_ProgramWord:
 709       00000000      OFST:	set	0
 712                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 714  019a 96            	ldw	x,sp
 715  019b 1c0003        	addw	x,#OFST+3
 716  019e cd0000        	call	c_ltor
 718  01a1 ae0000        	ldw	x,#L64
 719  01a4 cd0000        	call	c_lcmp
 721  01a7 250f          	jrult	L211
 722  01a9 96            	ldw	x,sp
 723  01aa 1c0003        	addw	x,#OFST+3
 724  01ad cd0000        	call	c_ltor
 726  01b0 ae0004        	ldw	x,#L05
 727  01b3 cd0000        	call	c_lcmp
 729  01b6 251e          	jrult	L011
 730  01b8               L211:
 731  01b8 96            	ldw	x,sp
 732  01b9 1c0003        	addw	x,#OFST+3
 733  01bc cd0000        	call	c_ltor
 735  01bf ae0008        	ldw	x,#L25
 736  01c2 cd0000        	call	c_lcmp
 738  01c5 2512          	jrult	L601
 739  01c7 96            	ldw	x,sp
 740  01c8 1c0003        	addw	x,#OFST+3
 741  01cb cd0000        	call	c_ltor
 743  01ce ae000c        	ldw	x,#L45
 744  01d1 cd0000        	call	c_lcmp
 746  01d4 2403          	jruge	L601
 747  01d6               L011:
 748  01d6 4f            	clr	a
 749  01d7 2010          	jra	L411
 750  01d9               L601:
 751  01d9 ae00d2        	ldw	x,#210
 752  01dc 89            	pushw	x
 753  01dd ae0000        	ldw	x,#0
 754  01e0 89            	pushw	x
 755  01e1 ae0010        	ldw	x,#L73
 756  01e4 cd0000        	call	_assert_failed
 758  01e7 5b04          	addw	sp,#4
 759  01e9               L411:
 760                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 762  01e9 721c505b      	bset	20571,#6
 763                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 765  01ed 721d505c      	bres	20572,#6
 766                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 768  01f1 7b07          	ld	a,(OFST+7,sp)
 769  01f3 1e05          	ldw	x,(OFST+5,sp)
 770  01f5 f7            	ld	(x),a
 771                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 773  01f6 7b08          	ld	a,(OFST+8,sp)
 774  01f8 1e05          	ldw	x,(OFST+5,sp)
 775  01fa e701          	ld	(1,x),a
 776                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 778  01fc 7b09          	ld	a,(OFST+9,sp)
 779  01fe 1e05          	ldw	x,(OFST+5,sp)
 780  0200 e702          	ld	(2,x),a
 781                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 783  0202 7b0a          	ld	a,(OFST+10,sp)
 784  0204 1e05          	ldw	x,(OFST+5,sp)
 785  0206 e703          	ld	(3,x),a
 786                     ; 224 }
 789  0208 81            	ret
 835                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 835                     ; 233 {
 836                     	switch	.text
 837  0209               _FLASH_ProgramOptionByte:
 839  0209 89            	pushw	x
 840       00000000      OFST:	set	0
 843                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 845  020a a34800        	cpw	x,#18432
 846  020d 2508          	jrult	L021
 847  020f a34880        	cpw	x,#18560
 848  0212 2403          	jruge	L021
 849  0214 4f            	clr	a
 850  0215 2010          	jra	L221
 851  0217               L021:
 852  0217 ae00eb        	ldw	x,#235
 853  021a 89            	pushw	x
 854  021b ae0000        	ldw	x,#0
 855  021e 89            	pushw	x
 856  021f ae0010        	ldw	x,#L73
 857  0222 cd0000        	call	_assert_failed
 859  0225 5b04          	addw	sp,#4
 860  0227               L221:
 861                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 863  0227 721e505b      	bset	20571,#7
 864                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 866  022b 721f505c      	bres	20572,#7
 867                     ; 242     if (Address == 0x4800)
 869  022f 1e01          	ldw	x,(OFST+1,sp)
 870  0231 a34800        	cpw	x,#18432
 871  0234 2607          	jrne	L742
 872                     ; 245        *((NEAR uint8_t*)Address) = Data;
 874  0236 7b05          	ld	a,(OFST+5,sp)
 875  0238 1e01          	ldw	x,(OFST+1,sp)
 876  023a f7            	ld	(x),a
 878  023b 200c          	jra	L152
 879  023d               L742:
 880                     ; 250        *((NEAR uint8_t*)Address) = Data;
 882  023d 7b05          	ld	a,(OFST+5,sp)
 883  023f 1e01          	ldw	x,(OFST+1,sp)
 884  0241 f7            	ld	(x),a
 885                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 887  0242 7b05          	ld	a,(OFST+5,sp)
 888  0244 43            	cpl	a
 889  0245 1e01          	ldw	x,(OFST+1,sp)
 890  0247 e701          	ld	(1,x),a
 891  0249               L152:
 892                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 894  0249 a6fd          	ld	a,#253
 895  024b cd03dd        	call	_FLASH_WaitForLastOperation
 897                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 899  024e 721f505b      	bres	20571,#7
 900                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 902  0252 721e505c      	bset	20572,#7
 903                     ; 258 }
 906  0256 85            	popw	x
 907  0257 81            	ret
 944                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 944                     ; 266 {
 945                     	switch	.text
 946  0258               _FLASH_EraseOptionByte:
 948  0258 89            	pushw	x
 949       00000000      OFST:	set	0
 952                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 954  0259 a34800        	cpw	x,#18432
 955  025c 2508          	jrult	L621
 956  025e a34880        	cpw	x,#18560
 957  0261 2403          	jruge	L621
 958  0263 4f            	clr	a
 959  0264 2010          	jra	L031
 960  0266               L621:
 961  0266 ae010c        	ldw	x,#268
 962  0269 89            	pushw	x
 963  026a ae0000        	ldw	x,#0
 964  026d 89            	pushw	x
 965  026e ae0010        	ldw	x,#L73
 966  0271 cd0000        	call	_assert_failed
 968  0274 5b04          	addw	sp,#4
 969  0276               L031:
 970                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
 972  0276 721e505b      	bset	20571,#7
 973                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 975  027a 721f505c      	bres	20572,#7
 976                     ; 275      if (Address == 0x4800)
 978  027e 1e01          	ldw	x,(OFST+1,sp)
 979  0280 a34800        	cpw	x,#18432
 980  0283 2605          	jrne	L172
 981                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 983  0285 1e01          	ldw	x,(OFST+1,sp)
 984  0287 7f            	clr	(x)
 986  0288 2009          	jra	L372
 987  028a               L172:
 988                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 990  028a 1e01          	ldw	x,(OFST+1,sp)
 991  028c 7f            	clr	(x)
 992                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 994  028d 1e01          	ldw	x,(OFST+1,sp)
 995  028f a6ff          	ld	a,#255
 996  0291 e701          	ld	(1,x),a
 997  0293               L372:
 998                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
1000  0293 a6fd          	ld	a,#253
1001  0295 cd03dd        	call	_FLASH_WaitForLastOperation
1003                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
1005  0298 721f505b      	bres	20571,#7
1006                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
1008  029c 721e505c      	bset	20572,#7
1009                     ; 291 }
1012  02a0 85            	popw	x
1013  02a1 81            	ret
1077                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1077                     ; 298 {
1078                     	switch	.text
1079  02a2               _FLASH_ReadOptionByte:
1081  02a2 89            	pushw	x
1082  02a3 5204          	subw	sp,#4
1083       00000004      OFST:	set	4
1086                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
1088                     ; 300     uint16_t res_value = 0;
1090                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1092  02a5 a34800        	cpw	x,#18432
1093  02a8 2508          	jrult	L431
1094  02aa a34880        	cpw	x,#18560
1095  02ad 2403          	jruge	L431
1096  02af 4f            	clr	a
1097  02b0 2010          	jra	L631
1098  02b2               L431:
1099  02b2 ae012f        	ldw	x,#303
1100  02b5 89            	pushw	x
1101  02b6 ae0000        	ldw	x,#0
1102  02b9 89            	pushw	x
1103  02ba ae0010        	ldw	x,#L73
1104  02bd cd0000        	call	_assert_failed
1106  02c0 5b04          	addw	sp,#4
1107  02c2               L631:
1108                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1110  02c2 1e05          	ldw	x,(OFST+1,sp)
1111  02c4 f6            	ld	a,(x)
1112  02c5 6b02          	ld	(OFST-2,sp),a
1113                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1115  02c7 1e05          	ldw	x,(OFST+1,sp)
1116  02c9 e601          	ld	a,(1,x)
1117  02cb 6b01          	ld	(OFST-3,sp),a
1118                     ; 310     if (Address == 0x4800)	 
1120  02cd 1e05          	ldw	x,(OFST+1,sp)
1121  02cf a34800        	cpw	x,#18432
1122  02d2 2608          	jrne	L723
1123                     ; 312         res_value =	 value_optbyte;
1125  02d4 7b02          	ld	a,(OFST-2,sp)
1126  02d6 5f            	clrw	x
1127  02d7 97            	ld	xl,a
1128  02d8 1f03          	ldw	(OFST-1,sp),x
1130  02da 2023          	jra	L133
1131  02dc               L723:
1132                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
1134  02dc 7b01          	ld	a,(OFST-3,sp)
1135  02de 43            	cpl	a
1136  02df 1102          	cp	a,(OFST-2,sp)
1137  02e1 2617          	jrne	L333
1138                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1140  02e3 7b02          	ld	a,(OFST-2,sp)
1141  02e5 5f            	clrw	x
1142  02e6 97            	ld	xl,a
1143  02e7 4f            	clr	a
1144  02e8 02            	rlwa	x,a
1145  02e9 1f03          	ldw	(OFST-1,sp),x
1146                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
1148  02eb 7b01          	ld	a,(OFST-3,sp)
1149  02ed 5f            	clrw	x
1150  02ee 97            	ld	xl,a
1151  02ef 01            	rrwa	x,a
1152  02f0 1a04          	or	a,(OFST+0,sp)
1153  02f2 01            	rrwa	x,a
1154  02f3 1a03          	or	a,(OFST-1,sp)
1155  02f5 01            	rrwa	x,a
1156  02f6 1f03          	ldw	(OFST-1,sp),x
1158  02f8 2005          	jra	L133
1159  02fa               L333:
1160                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
1162  02fa ae5555        	ldw	x,#21845
1163  02fd 1f03          	ldw	(OFST-1,sp),x
1164  02ff               L133:
1165                     ; 326     return(res_value);
1167  02ff 1e03          	ldw	x,(OFST-1,sp)
1170  0301 5b06          	addw	sp,#6
1171  0303 81            	ret
1246                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1246                     ; 336 {
1247                     	switch	.text
1248  0304               _FLASH_SetLowPowerMode:
1250  0304 88            	push	a
1251       00000000      OFST:	set	0
1254                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1256  0305 a104          	cp	a,#4
1257  0307 270b          	jreq	L441
1258  0309 a108          	cp	a,#8
1259  030b 2707          	jreq	L441
1260  030d 4d            	tnz	a
1261  030e 2704          	jreq	L441
1262  0310 a10c          	cp	a,#12
1263  0312 2603          	jrne	L241
1264  0314               L441:
1265  0314 4f            	clr	a
1266  0315 2010          	jra	L641
1267  0317               L241:
1268  0317 ae0152        	ldw	x,#338
1269  031a 89            	pushw	x
1270  031b ae0000        	ldw	x,#0
1271  031e 89            	pushw	x
1272  031f ae0010        	ldw	x,#L73
1273  0322 cd0000        	call	_assert_failed
1275  0325 5b04          	addw	sp,#4
1276  0327               L641:
1277                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1279  0327 c6505a        	ld	a,20570
1280  032a a4f3          	and	a,#243
1281  032c c7505a        	ld	20570,a
1282                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1284  032f c6505a        	ld	a,20570
1285  0332 1a01          	or	a,(OFST+1,sp)
1286  0334 c7505a        	ld	20570,a
1287                     ; 345 }
1290  0337 84            	pop	a
1291  0338 81            	ret
1350                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1350                     ; 354 {
1351                     	switch	.text
1352  0339               _FLASH_SetProgrammingTime:
1354  0339 88            	push	a
1355       00000000      OFST:	set	0
1358                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1360  033a 4d            	tnz	a
1361  033b 2704          	jreq	L451
1362  033d a101          	cp	a,#1
1363  033f 2603          	jrne	L251
1364  0341               L451:
1365  0341 4f            	clr	a
1366  0342 2010          	jra	L651
1367  0344               L251:
1368  0344 ae0164        	ldw	x,#356
1369  0347 89            	pushw	x
1370  0348 ae0000        	ldw	x,#0
1371  034b 89            	pushw	x
1372  034c ae0010        	ldw	x,#L73
1373  034f cd0000        	call	_assert_failed
1375  0352 5b04          	addw	sp,#4
1376  0354               L651:
1377                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1379  0354 7211505a      	bres	20570,#0
1380                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1382  0358 c6505a        	ld	a,20570
1383  035b 1a01          	or	a,(OFST+1,sp)
1384  035d c7505a        	ld	20570,a
1385                     ; 360 }
1388  0360 84            	pop	a
1389  0361 81            	ret
1414                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1414                     ; 368 {
1415                     	switch	.text
1416  0362               _FLASH_GetLowPowerMode:
1420                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1422  0362 c6505a        	ld	a,20570
1423  0365 a40c          	and	a,#12
1426  0367 81            	ret
1451                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1451                     ; 378 {
1452                     	switch	.text
1453  0368               _FLASH_GetProgrammingTime:
1457                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1459  0368 c6505a        	ld	a,20570
1460  036b a401          	and	a,#1
1463  036d 81            	ret
1497                     ; 387 uint32_t FLASH_GetBootSize(void)
1497                     ; 388 {
1498                     	switch	.text
1499  036e               _FLASH_GetBootSize:
1501  036e 5204          	subw	sp,#4
1502       00000004      OFST:	set	4
1505                     ; 389     uint32_t temp = 0;
1507                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1509  0370 c6505d        	ld	a,20573
1510  0373 5f            	clrw	x
1511  0374 97            	ld	xl,a
1512  0375 90ae0200      	ldw	y,#512
1513  0379 cd0000        	call	c_umul
1515  037c 96            	ldw	x,sp
1516  037d 1c0001        	addw	x,#OFST-3
1517  0380 cd0000        	call	c_rtol
1519                     ; 395     if (FLASH->FPR == 0xFF)
1521  0383 c6505d        	ld	a,20573
1522  0386 a1ff          	cp	a,#255
1523  0388 2611          	jrne	L554
1524                     ; 397         temp += 512;
1526  038a ae0200        	ldw	x,#512
1527  038d bf02          	ldw	c_lreg+2,x
1528  038f ae0000        	ldw	x,#0
1529  0392 bf00          	ldw	c_lreg,x
1530  0394 96            	ldw	x,sp
1531  0395 1c0001        	addw	x,#OFST-3
1532  0398 cd0000        	call	c_lgadd
1534  039b               L554:
1535                     ; 401     return(temp);
1537  039b 96            	ldw	x,sp
1538  039c 1c0001        	addw	x,#OFST-3
1539  039f cd0000        	call	c_ltor
1543  03a2 5b04          	addw	sp,#4
1544  03a4 81            	ret
1647                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1647                     ; 413 {
1648                     	switch	.text
1649  03a5               _FLASH_GetFlagStatus:
1651  03a5 88            	push	a
1652  03a6 88            	push	a
1653       00000001      OFST:	set	1
1656                     ; 414     FlagStatus status = RESET;
1658                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1660  03a7 a108          	cp	a,#8
1661  03a9 270c          	jreq	L271
1662  03ab a104          	cp	a,#4
1663  03ad 2708          	jreq	L271
1664  03af a102          	cp	a,#2
1665  03b1 2704          	jreq	L271
1666  03b3 a101          	cp	a,#1
1667  03b5 2603          	jrne	L071
1668  03b7               L271:
1669  03b7 4f            	clr	a
1670  03b8 2010          	jra	L471
1671  03ba               L071:
1672  03ba ae01a0        	ldw	x,#416
1673  03bd 89            	pushw	x
1674  03be ae0000        	ldw	x,#0
1675  03c1 89            	pushw	x
1676  03c2 ae0010        	ldw	x,#L73
1677  03c5 cd0000        	call	_assert_failed
1679  03c8 5b04          	addw	sp,#4
1680  03ca               L471:
1681                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1683  03ca c6505f        	ld	a,20575
1684  03cd 1502          	bcp	a,(OFST+1,sp)
1685  03cf 2706          	jreq	L525
1686                     ; 421         status = SET; /* FLASH_FLAG is set */
1688  03d1 a601          	ld	a,#1
1689  03d3 6b01          	ld	(OFST+0,sp),a
1691  03d5 2002          	jra	L725
1692  03d7               L525:
1693                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1695  03d7 0f01          	clr	(OFST+0,sp)
1696  03d9               L725:
1697                     ; 429     return status;
1699  03d9 7b01          	ld	a,(OFST+0,sp)
1702  03db 85            	popw	x
1703  03dc 81            	ret
1788                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1788                     ; 532 {
1789                     	switch	.text
1790  03dd               _FLASH_WaitForLastOperation:
1792  03dd 5205          	subw	sp,#5
1793       00000005      OFST:	set	5
1796                     ; 533     uint8_t flagstatus = 0x00;
1798  03df 0f05          	clr	(OFST+0,sp)
1799                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1801  03e1 aeffff        	ldw	x,#65535
1802  03e4 1f03          	ldw	(OFST-2,sp),x
1803  03e6 ae000f        	ldw	x,#15
1804  03e9 1f01          	ldw	(OFST-4,sp),x
1806  03eb 2010          	jra	L575
1807  03ed               L175:
1808                     ; 560         flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1810  03ed c6505f        	ld	a,20575
1811  03f0 a405          	and	a,#5
1812  03f2 6b05          	ld	(OFST+0,sp),a
1813                     ; 561         timeout--;
1815  03f4 96            	ldw	x,sp
1816  03f5 1c0001        	addw	x,#OFST-4
1817  03f8 a601          	ld	a,#1
1818  03fa cd0000        	call	c_lgsbc
1820  03fd               L575:
1821                     ; 558     while ((flagstatus == 0x00) && (timeout != 0x00))
1823  03fd 0d05          	tnz	(OFST+0,sp)
1824  03ff 2609          	jrne	L106
1826  0401 96            	ldw	x,sp
1827  0402 1c0001        	addw	x,#OFST-4
1828  0405 cd0000        	call	c_lzmp
1830  0408 26e3          	jrne	L175
1831  040a               L106:
1832                     ; 566     if (timeout == 0x00 )
1834  040a 96            	ldw	x,sp
1835  040b 1c0001        	addw	x,#OFST-4
1836  040e cd0000        	call	c_lzmp
1838  0411 2604          	jrne	L306
1839                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1841  0413 a602          	ld	a,#2
1842  0415 6b05          	ld	(OFST+0,sp),a
1843  0417               L306:
1844                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1846  0417 7b05          	ld	a,(OFST+0,sp)
1849  0419 5b05          	addw	sp,#5
1850  041b 81            	ret
1914                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1914                     ; 582 {
1915                     	switch	.text
1916  041c               _FLASH_EraseBlock:
1918  041c 89            	pushw	x
1919  041d 5206          	subw	sp,#6
1920       00000006      OFST:	set	6
1923                     ; 583   uint32_t startaddress = 0;
1925                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1927  041f 7b0b          	ld	a,(OFST+5,sp)
1928  0421 a1fd          	cp	a,#253
1929  0423 2706          	jreq	L402
1930  0425 7b0b          	ld	a,(OFST+5,sp)
1931  0427 a1f7          	cp	a,#247
1932  0429 2603          	jrne	L202
1933  042b               L402:
1934  042b 4f            	clr	a
1935  042c 2010          	jra	L602
1936  042e               L202:
1937  042e ae0251        	ldw	x,#593
1938  0431 89            	pushw	x
1939  0432 ae0000        	ldw	x,#0
1940  0435 89            	pushw	x
1941  0436 ae0010        	ldw	x,#L73
1942  0439 cd0000        	call	_assert_failed
1944  043c 5b04          	addw	sp,#4
1945  043e               L602:
1946                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1948  043e 7b0b          	ld	a,(OFST+5,sp)
1949  0440 a1fd          	cp	a,#253
1950  0442 2626          	jrne	L736
1951                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1953  0444 1e07          	ldw	x,(OFST+1,sp)
1954  0446 a30080        	cpw	x,#128
1955  0449 2403          	jruge	L012
1956  044b 4f            	clr	a
1957  044c 2010          	jra	L212
1958  044e               L012:
1959  044e ae0254        	ldw	x,#596
1960  0451 89            	pushw	x
1961  0452 ae0000        	ldw	x,#0
1962  0455 89            	pushw	x
1963  0456 ae0010        	ldw	x,#L73
1964  0459 cd0000        	call	_assert_failed
1966  045c 5b04          	addw	sp,#4
1967  045e               L212:
1968                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1970  045e ae8000        	ldw	x,#32768
1971  0461 1f05          	ldw	(OFST-1,sp),x
1972  0463 ae0000        	ldw	x,#0
1973  0466 1f03          	ldw	(OFST-3,sp),x
1975  0468 2024          	jra	L146
1976  046a               L736:
1977                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1979  046a 1e07          	ldw	x,(OFST+1,sp)
1980  046c a3000a        	cpw	x,#10
1981  046f 2403          	jruge	L412
1982  0471 4f            	clr	a
1983  0472 2010          	jra	L612
1984  0474               L412:
1985  0474 ae0259        	ldw	x,#601
1986  0477 89            	pushw	x
1987  0478 ae0000        	ldw	x,#0
1988  047b 89            	pushw	x
1989  047c ae0010        	ldw	x,#L73
1990  047f cd0000        	call	_assert_failed
1992  0482 5b04          	addw	sp,#4
1993  0484               L612:
1994                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1996  0484 ae4000        	ldw	x,#16384
1997  0487 1f05          	ldw	(OFST-1,sp),x
1998  0489 ae0000        	ldw	x,#0
1999  048c 1f03          	ldw	(OFST-3,sp),x
2000  048e               L146:
2001                     ; 610     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
2003  048e 1e07          	ldw	x,(OFST+1,sp)
2004  0490 a640          	ld	a,#64
2005  0492 cd0000        	call	c_cmulx
2007  0495 96            	ldw	x,sp
2008  0496 1c0003        	addw	x,#OFST-3
2009  0499 cd0000        	call	c_ladd
2011  049c be02          	ldw	x,c_lreg+2
2012  049e 1f01          	ldw	(OFST-5,sp),x
2013                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
2015  04a0 721a505b      	bset	20571,#5
2016                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2018  04a4 721b505c      	bres	20572,#5
2019                     ; 619     *pwFlash = (uint32_t)0;
2021  04a8 1e01          	ldw	x,(OFST-5,sp)
2022  04aa a600          	ld	a,#0
2023  04ac e703          	ld	(3,x),a
2024  04ae a600          	ld	a,#0
2025  04b0 e702          	ld	(2,x),a
2026  04b2 a600          	ld	a,#0
2027  04b4 e701          	ld	(1,x),a
2028  04b6 a600          	ld	a,#0
2029  04b8 f7            	ld	(x),a
2030                     ; 627 }
2033  04b9 5b08          	addw	sp,#8
2034  04bb 81            	ret
2139                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2139                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2139                     ; 640 {
2140                     	switch	.text
2141  04bc               _FLASH_ProgramBlock:
2143  04bc 89            	pushw	x
2144  04bd 5206          	subw	sp,#6
2145       00000006      OFST:	set	6
2148                     ; 641     uint16_t Count = 0;
2150                     ; 642     uint32_t startaddress = 0;
2152                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2154  04bf 7b0b          	ld	a,(OFST+5,sp)
2155  04c1 a1fd          	cp	a,#253
2156  04c3 2706          	jreq	L422
2157  04c5 7b0b          	ld	a,(OFST+5,sp)
2158  04c7 a1f7          	cp	a,#247
2159  04c9 2603          	jrne	L222
2160  04cb               L422:
2161  04cb 4f            	clr	a
2162  04cc 2010          	jra	L622
2163  04ce               L222:
2164  04ce ae0285        	ldw	x,#645
2165  04d1 89            	pushw	x
2166  04d2 ae0000        	ldw	x,#0
2167  04d5 89            	pushw	x
2168  04d6 ae0010        	ldw	x,#L73
2169  04d9 cd0000        	call	_assert_failed
2171  04dc 5b04          	addw	sp,#4
2172  04de               L622:
2173                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2175  04de 0d0c          	tnz	(OFST+6,sp)
2176  04e0 2706          	jreq	L232
2177  04e2 7b0c          	ld	a,(OFST+6,sp)
2178  04e4 a110          	cp	a,#16
2179  04e6 2603          	jrne	L032
2180  04e8               L232:
2181  04e8 4f            	clr	a
2182  04e9 2010          	jra	L432
2183  04eb               L032:
2184  04eb ae0286        	ldw	x,#646
2185  04ee 89            	pushw	x
2186  04ef ae0000        	ldw	x,#0
2187  04f2 89            	pushw	x
2188  04f3 ae0010        	ldw	x,#L73
2189  04f6 cd0000        	call	_assert_failed
2191  04f9 5b04          	addw	sp,#4
2192  04fb               L432:
2193                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2195  04fb 7b0b          	ld	a,(OFST+5,sp)
2196  04fd a1fd          	cp	a,#253
2197  04ff 2626          	jrne	L517
2198                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2200  0501 1e07          	ldw	x,(OFST+1,sp)
2201  0503 a30080        	cpw	x,#128
2202  0506 2403          	jruge	L632
2203  0508 4f            	clr	a
2204  0509 2010          	jra	L042
2205  050b               L632:
2206  050b ae0289        	ldw	x,#649
2207  050e 89            	pushw	x
2208  050f ae0000        	ldw	x,#0
2209  0512 89            	pushw	x
2210  0513 ae0010        	ldw	x,#L73
2211  0516 cd0000        	call	_assert_failed
2213  0519 5b04          	addw	sp,#4
2214  051b               L042:
2215                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2217  051b ae8000        	ldw	x,#32768
2218  051e 1f03          	ldw	(OFST-3,sp),x
2219  0520 ae0000        	ldw	x,#0
2220  0523 1f01          	ldw	(OFST-5,sp),x
2222  0525 2024          	jra	L717
2223  0527               L517:
2224                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2226  0527 1e07          	ldw	x,(OFST+1,sp)
2227  0529 a3000a        	cpw	x,#10
2228  052c 2403          	jruge	L242
2229  052e 4f            	clr	a
2230  052f 2010          	jra	L442
2231  0531               L242:
2232  0531 ae028e        	ldw	x,#654
2233  0534 89            	pushw	x
2234  0535 ae0000        	ldw	x,#0
2235  0538 89            	pushw	x
2236  0539 ae0010        	ldw	x,#L73
2237  053c cd0000        	call	_assert_failed
2239  053f 5b04          	addw	sp,#4
2240  0541               L442:
2241                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2243  0541 ae4000        	ldw	x,#16384
2244  0544 1f03          	ldw	(OFST-3,sp),x
2245  0546 ae0000        	ldw	x,#0
2246  0549 1f01          	ldw	(OFST-5,sp),x
2247  054b               L717:
2248                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2250  054b 1e07          	ldw	x,(OFST+1,sp)
2251  054d a640          	ld	a,#64
2252  054f cd0000        	call	c_cmulx
2254  0552 96            	ldw	x,sp
2255  0553 1c0001        	addw	x,#OFST-5
2256  0556 cd0000        	call	c_lgadd
2258                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2260  0559 0d0c          	tnz	(OFST+6,sp)
2261  055b 260a          	jrne	L127
2262                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
2264  055d 7210505b      	bset	20571,#0
2265                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2267  0561 7211505c      	bres	20572,#0
2269  0565 2008          	jra	L327
2270  0567               L127:
2271                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
2273  0567 7218505b      	bset	20571,#4
2274                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2276  056b 7219505c      	bres	20572,#4
2277  056f               L327:
2278                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2280  056f 5f            	clrw	x
2281  0570 1f05          	ldw	(OFST-1,sp),x
2282  0572               L527:
2283                     ; 682   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2285  0572 1e0d          	ldw	x,(OFST+7,sp)
2286  0574 72fb05        	addw	x,(OFST-1,sp)
2287  0577 f6            	ld	a,(x)
2288  0578 1e03          	ldw	x,(OFST-3,sp)
2289  057a 72fb05        	addw	x,(OFST-1,sp)
2290  057d f7            	ld	(x),a
2291                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2293  057e 1e05          	ldw	x,(OFST-1,sp)
2294  0580 1c0001        	addw	x,#1
2295  0583 1f05          	ldw	(OFST-1,sp),x
2298  0585 1e05          	ldw	x,(OFST-1,sp)
2299  0587 a30040        	cpw	x,#64
2300  058a 25e6          	jrult	L527
2301                     ; 685 }
2304  058c 5b08          	addw	sp,#8
2305  058e 81            	ret
2318                     	xdef	_FLASH_WaitForLastOperation
2319                     	xdef	_FLASH_ProgramBlock
2320                     	xdef	_FLASH_EraseBlock
2321                     	xdef	_FLASH_GetFlagStatus
2322                     	xdef	_FLASH_GetBootSize
2323                     	xdef	_FLASH_GetProgrammingTime
2324                     	xdef	_FLASH_GetLowPowerMode
2325                     	xdef	_FLASH_SetProgrammingTime
2326                     	xdef	_FLASH_SetLowPowerMode
2327                     	xdef	_FLASH_EraseOptionByte
2328                     	xdef	_FLASH_ProgramOptionByte
2329                     	xdef	_FLASH_ReadOptionByte
2330                     	xdef	_FLASH_ProgramWord
2331                     	xdef	_FLASH_ReadByte
2332                     	xdef	_FLASH_ProgramByte
2333                     	xdef	_FLASH_EraseByte
2334                     	xdef	_FLASH_ITConfig
2335                     	xdef	_FLASH_DeInit
2336                     	xdef	_FLASH_Lock
2337                     	xdef	_FLASH_Unlock
2338                     	xref	_assert_failed
2339                     	switch	.const
2340  0010               L73:
2341  0010 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_f"
2342  0022 6c6173682e63  	dc.b	"lash.c",0
2343                     	xref.b	c_lreg
2344                     	xref.b	c_x
2345                     	xref.b	c_y
2365                     	xref	c_ladd
2366                     	xref	c_cmulx
2367                     	xref	c_lzmp
2368                     	xref	c_lgsbc
2369                     	xref	c_lgadd
2370                     	xref	c_rtol
2371                     	xref	c_umul
2372                     	xref	c_lcmp
2373                     	xref	c_ltor
2374                     	end
