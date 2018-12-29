   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 44 void main(void)
  43                     ; 45 {
  45                     	switch	.text
  46  0000               _main:
  50  0000               L12:
  51  0000 20fe          	jra	L12
  86                     ; 62 void assert_failed(u8* file, u32 line)
  86                     ; 63 { 
  87                     	switch	.text
  88  0002               _assert_failed:
  92  0002               L34:
  93  0002 20fe          	jra	L34
 106                     	xdef	_main
 107                     	xdef	_assert_failed
 126                     	end
