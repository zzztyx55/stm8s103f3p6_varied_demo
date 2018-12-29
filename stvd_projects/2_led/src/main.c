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


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"


/**
* author : tianyx
* email  : zzztyx55@sina.com
* qq     : 609421258
* github : https://github.com/zzztyx55
*/
/* Private defines -----------------------------------------------------------*/
//typedef unsigned int u16;

/* Private function prototypes -----------------------------------------------*/
void delay(u16 d);


/* Private functions ---------------------------------------------------------*/
void delay(u16 d)
{
	u16 i;
	
	for(i = 0; i < d; i++);
}

/**
* author : tianyx
* email  : zzztyx55@sina.com
* qq     : 609421258
* github : https://github.com/zzztyx55
*/
void main(void)
{
	volatile int i;

	i = 0;
	i = 5;
	i = -1;

	// 初始化 PA1 为推挽输出 // 库文件中提供的函数
	GPIO_DeInit(GPIOA);
	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_SLOW);
	// 控制 PA1 输出高电平，关led // 库文件中提供的函数
	GPIO_WriteHigh(GPIOA, GPIO_PIN_1);

	// 延时，等待系统稳定
	delay(100);

	/* Infinite loop */
	while (1)
	{
#if 0
		//delay(20000);			
		GPIO_WriteHigh(GPIOA, GPIO_PIN_1);   // PA1输出高，灯灭
		//delay(20000);
		GPIO_WriteLow(GPIOA, GPIO_PIN_1);    // PA1输出低，灯亮
#else
		delay(20000);		
		GPIO_WriteReverse(GPIOA, GPIO_PIN_1);  // PA1 输出电平翻转
#endif
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
