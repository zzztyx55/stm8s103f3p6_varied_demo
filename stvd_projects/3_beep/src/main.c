
/**
  ******************************************************************************
  * @file    Project/main.c 
  * @author  MCD Application Team
  * @version V2.1.0
  * @date    18-November-2011
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */ 

/**
* author : tianyx
* email  : zzztyx55@sina.com
* qq     : 609421258
* github : https://github.com/zzztyx55
*/

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"


/**
* author : tianyx
* email  : zzztyx55@sina.com
* qq     : 609421258
* github : https://github.com/zzztyx55
*/
/* Private defines -----------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/
void delay(u32 dly);
void Beep_inputClkSelect(void);

/* Private functions ---------------------------------------------------------*/
void delay(u32 dly)
{
	u32 i;

	for(i = 0; i < dly; i++)
	{
		; //空操作
	}
}

// 选择LSI RC 128KHz 为beep输入时钟
void Beep_inputClkSelect(void)
{
  uint16_t value;
  
  value = FLASH_ReadOptionByte(0x4807);  // 读出选项字OPT4地址0x4807 存储的数据
  if(value&0x0400)  // 判断CKAWUSEL 位是否为1，若是1，将该位清零
  	FLASH_ProgramOptionByte(0x4807,(uint8_t)((value&0xFBFF)>>8));
}


void clk_config(void)
{
	// HSI 时钟 16MHz
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);  // HSI时钟预分频, 分频系数1
	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);  // 系统时钟配置, HSI, 分频系数1
	CLK_HSICmd(ENABLE);   // 使能HSI
	while(RESET == CLK_GetFlagStatus(CLK_FLAG_HSIRDY));  // 等待HSI ready
}

void LSI_enable(void)
{
	CLK_LSICmd(ENABLE);   // 使能LSI
	while(RESET == CLK_GetFlagStatus(CLK_FLAG_LSIRDY));  // 等待LSI ready
}


void init_beep(void)
{
	BEEP_DeInit();
	//Set_Beep_OptionByte();  // select LSI 128k as LS clock
	LSI_enable();
	BEEP_LSICalibrationConfig(128000);
	BEEP_Init(BEEP_FREQUENCY_1KHZ);
	// BEEP_Cmd(ENABLE);
}

void change_beep_freq(u8 freq_group)
{
	//
	BEEP_Cmd(DISABLE);

	switch(freq_group)
	{
		case 0:	BEEP_Init(BEEP_FREQUENCY_1KHZ); break;
		case 1:	BEEP_Init(BEEP_FREQUENCY_2KHZ); break;
		case 2:	BEEP_Init(BEEP_FREQUENCY_4KHZ); break;
		default: BEEP_Init(BEEP_FREQUENCY_1KHZ); break;
	}

	//BEEP_Cmd(ENABLE);
	//
}

/**
* author : tianyx
* email  : zzztyx55@sina.com
* qq     : 609421258
* github : https://github.com/zzztyx55
*/
void main(void)
{	
	int dly = 1500;
	
	// 关中断 
	disableInterrupts();
	// 系统时钟配置
	clk_config();
	
	GPIO_DeInit(GPIOD);
	// 初始化Beep
	init_beep();
	// 开中断
	//enableInterrupts();
	
	/* Infinite loop */
	while (1)
	{		
		// 使用1kHz的频率驱动蜂鸣器
		BEEP_Cmd(DISABLE);
		change_beep_freq(0); //beep 的输出频率1kHz
		BEEP_Cmd(ENABLE);
		delay(dly);  // 延时

		// 关闭蜂鸣器
		BEEP_Cmd(DISABLE);
		delay(dly);  // 延时

		// 使用2kHz的频率驱动蜂鸣器
		BEEP_Cmd(DISABLE);
		change_beep_freq(1); //beep 的输出频率2kHz
		BEEP_Cmd(ENABLE);
		delay(dly);  // 延时

		// 关闭蜂鸣器
		BEEP_Cmd(DISABLE);
		delay(dly);  // 延时

		// 使用4kHz的频率驱动蜂鸣器
		BEEP_Cmd(DISABLE);
		change_beep_freq(2); //beep 的输出频率4kHz
		BEEP_Cmd(ENABLE);
		delay(dly);  // 延时

		// 关闭蜂鸣器
		BEEP_Cmd(DISABLE);
		delay(dly);  // 延时
	}
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/

