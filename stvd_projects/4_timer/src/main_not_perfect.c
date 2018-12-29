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

u8 time_0_5s_upate_flag;
u8 led_cnt;
u8 beep_turn_on_flag;

/**
* author : tianyx
* email  : zzztyx55@sina.com
* qq     : 609421258
* github : https://github.com/zzztyx55
*/
/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void delay(u32 dly)
{
	u32 i;
	for(i = 0; i < dly; i++)
		; //空指令
}

void delay_0_5s(void)
{

}

void delay_10s(void)
{

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


/*
* stm8s103f3p6 的定时器4使用的是 系统时钟
* 本程序中将系统时钟配置为HSI = 16MHz
*/
void Init_Timer4(void)
{
	// 配置定时器4的预分频值16分频和计数值100
	// 定时器计数到100后就会产生溢出中断，中断完之后又重新从0开始计数
	// time4 定时中断周期T = 100*(16/16MHz) = 0.1ms
	// 所以中断服务函数就会每0.1ms被调用一次
	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 100);
 	 /* Clear TIM4 update flag */
  	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	 /* Enable update interrupt */
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);  // 使能time4溢出更新中断
	TIM4_Cmd(ENABLE);  // 使能timer4
}

/**
* author : tianyx
* email  : zzztyx55@sina.com
* qq     : 609421258
* github : https://github.com/zzztyx55
*/
void main(void)
{	
	// 关中断 
	disableInterrupts();
	// 系统时钟配置
	clk_config();

	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOD);

	// init: PA1 - led, output high
	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_WriteHigh(GPIOA, GPIO_PIN_1); // turn off led
	// PB4, key input
	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
	
	time_0_5s_upate_flag = 0;
	led_cnt = 0;
	beep_turn_on_flag = 0;

	// 初始化并使能time4
	Init_Timer4();  
	// 初始化Beep
	init_beep();

	delay(100);
	
	// 开中断
	enableInterrupts();
	
	/* Infinite loop */
  	while (1)
	{
		GPIO_WriteLow(GPIOA, GPIO_PIN_1); // turn on led
		delay_0_5s();
		GPIO_WriteHigh(GPIOA, GPIO_PIN_1); // turn off led
		delay_10s();

		if(0 == GPIO_ReadInputPin(GPIOB, GPIO_PIN_4))  // PB4拉低 --> 按键按下
		{
			BEEP_Cmd(ENABLE);       // 启动蜂鸣器
			delay_0_5s();
			BEEP_Cmd(DISABLE);      // 关闭蜂鸣器
		}
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
