<#--
/*******************************************************************************
  AK4384 Driver Freemarker Template File

  Company:
    Microchip Technology Inc.

  File Name:
    drv_ak4384.ftl

  Summary:
    AK4384 Driver Freemarker Template File

  Description:

*******************************************************************************/

/*******************************************************************************
Copyright (c) 2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED AS IS  WITHOUT  WARRANTY  OF  ANY  KIND,
EITHER EXPRESS  OR  IMPLIED,  INCLUDING  WITHOUT  LIMITATION,  ANY  WARRANTY  OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A  PARTICULAR  PURPOSE.
IN NO EVENT SHALL MICROCHIP OR  ITS  LICENSORS  BE  LIABLE  OR  OBLIGATED  UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION,  BREACH  OF  WARRANTY,  OR
OTHER LEGAL  EQUITABLE  THEORY  ANY  DIRECT  OR  INDIRECT  DAMAGES  OR  EXPENSES
INCLUDING BUT NOT LIMITED TO ANY  INCIDENTAL,  SPECIAL,  INDIRECT,  PUNITIVE  OR
CONSEQUENTIAL DAMAGES, LOST  PROFITS  OR  LOST  DATA,  COST  OF  PROCUREMENT  OF
SUBSTITUTE  GOODS,  TECHNOLOGY,  SERVICES,  OR  ANY  CLAIMS  BY  THIRD   PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE  THEREOF),  OR  OTHER  SIMILAR  COSTS.
*******************************************************************************/
-->

/*** Codec Driver Configuration ***/

<#if CONFIG_USE_DRV_CODEC_AK4384 ==  true>
#define DRV_AK4384_CLIENTS_NUMBER                           ${CONFIG_DRV_AK4384_CLIENTS_NUMBER} 
#define DRV_AK4384_INSTANCES_NUMBER                         1
<#if CONFIG_SYS_CLK_REFCLK_ENABLE == true>
#define DRV_AK4384_INPUT_REFCLOCK    	                	${CONFIG_SYS_CLK_REFCLK_ROSEL}
</#if>
<#if CONFIG_SYS_CLK_REFCLK0_ENABLE == true>
#define DRV_AK4384_INPUT_REFCLOCK    	                	${CONFIG_SYS_CLK_REFCLK_ROSEL0}
</#if>
<#if CONFIG_SYS_CLK_REFCLK1_ENABLE == true>
#define DRV_AK4384_INPUT_REFCLOCK    	                	${CONFIG_SYS_CLK_REFCLK_ROSEL1}
</#if>
<#if CONFIG_SYS_CLK_REFCLK2_ENABLE == true>
#define DRV_AK4384_INPUT_REFCLOCK    	                	${CONFIG_SYS_CLK_REFCLK_ROSEL2}
</#if>
<#if CONFIG_SYS_CLK_REFCLK3_ENABLE == true>
#define DRV_AK4384_INPUT_REFCLOCK    	                	${CONFIG_SYS_CLK_REFCLK_ROSEL3}
</#if>
#define DRV_AK4384_AUDIO_SAMPLING_RATE                      ${CONFIG_DRV_I2S_BAUD_RATE}
#define DRV_AK4384_MCLK_SAMPLE_FREQ_MULTPLIER               (SYS_CLK_BUS_REFERENCE_1/DRV_AK4384_AUDIO_SAMPLING_RATE)
#define DRV_AK4384_BCLK_BIT_CLK_DIVISOR	                	${CONFIG_DRV_AK4384_BCLK_BIT_CLK_DIVISOR}
<#-- Instance 0 -->
<#if CONFIG_DRV_CODEC_AK4384_INST_IDX0 == true>
<#if  CONFIG_USE_DRV_AK4384_BIT_BANGED_SPI_CONTROL_INTERFACE == true>
#define DRV_AK4384_CONTROL_CLOCK                            1000
#define DRV_AK4384_TIMER_DRIVER_MODULE_INDEX                ${CONFIG_DRV_AK4384_TIMER_DRIVER_MODULE_INDEX_IDX0}
<#if CONFIG_PIC32MX>
#define DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY           SYS_CLK_BUS_PERIPHERAL_1
</#if>
<#if CONFIG_PIC32MZ>
#define DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY           SYS_CLK_BUS_PERIPHERAL_3
</#if>
</#if> 
<#if CONFIG_DRV_AK4384_TIMER_DRIVER_MODULE_INDEX_IDX0 == "0">
<#if CONFIG_DRV_TMR_INST_0 == true>
#define DRV_AK4384_TIMER_PERIOD                             (DRV_TMR_PRESCALE_IDX0 == 0x7)? \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<(DRV_TMR_PRESCALE_IDX0+1))/DRV_AK4384_CONTROL_CLOCK): \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<DRV_TMR_PRESCALE_IDX0)/DRV_AK4384_CONTROL_CLOCK)
</#if>
</#if>
<#if CONFIG_DRV_AK4384_TIMER_DRIVER_MODULE_INDEX_IDX0 == "1">
<#if CONFIG_DRV_TMR_INST_1 == true>
#define DRV_AK4384_TIMER_PERIOD                             (DRV_TMR_PRESCALE_IDX1 == 0x7)? \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<(DRV_TMR_PRESCALE_IDX1+1))/DRV_AK4384_CONTROL_CLOCK): \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<DRV_TMR_PRESCALE_IDX1)/DRV_AK4384_CONTROL_CLOCK)
</#if>                                 
</#if> 
<#if CONFIG_DRV_AK4384_TIMER_DRIVER_MODULE_INDEX_IDX0 == "2">
<#if CONFIG_DRV_TMR_INST_2 == true>
#define DRV_AK4384_TIMER_PERIOD                             (DRV_TMR_PRESCALE_IDX2 == 0x7)? \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<(DRV_TMR_PRESCALE_IDX2+1))/DRV_AK4384_CONTROL_CLOCK): \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<DRV_TMR_PRESCALE_IDX2)/DRV_AK4384_CONTROL_CLOCK)
</#if>                                 
</#if> 
<#if CONFIG_DRV_AK4384_TIMER_DRIVER_MODULE_INDEX_IDX0 == "3">
<#if CONFIG_DRV_TMR_INST_3 == true>
#define DRV_AK4384_TIMER_PERIOD                             (DRV_TMR_PRESCALE_IDX3 == 0x7)? \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<(DRV_TMR_PRESCALE_IDX3+1))/DRV_AK4384_CONTROL_CLOCK): \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<DRV_TMR_PRESCALE_IDX3)/DRV_AK4384_CONTROL_CLOCK)
</#if>                                 
</#if> 
<#if CONFIG_DRV_AK4384_TIMER_DRIVER_MODULE_INDEX_IDX0 == "4">
<#if CONFIG_DRV_TMR_INST_4 == true>
#define DRV_AK4384_TIMER_PERIOD                             (DRV_TMR_PRESCALE_IDX4 == 0x7)? \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<(DRV_TMR_PRESCALE_IDX4+1))/DRV_AK4384_CONTROL_CLOCK): \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<DRV_TMR_PRESCALE_IDX4)/DRV_AK4384_CONTROL_CLOCK)
</#if>                                 
</#if> 
<#if CONFIG_DRV_AK4384_TIMER_DRIVER_MODULE_INDEX_IDX0 == "5">
<#if CONFIG_DRV_TMR_INST_5 == true>
#define DRV_AK4384_TIMER_PERIOD                             (DRV_TMR_PRESCALE_IDX5 == 0x7)? \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<(DRV_TMR_PRESCALE_IDX5+1))/DRV_AK4384_CONTROL_CLOCK): \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<DRV_TMR_PRESCALE_IDX5)/DRV_AK4384_CONTROL_CLOCK)
</#if>                                 
</#if> 
<#if CONFIG_DRV_AK4384_TIMER_DRIVER_MODULE_INDEX_IDX0 == "6">
<#if CONFIG_DRV_TMR_INST_6 == true>
#define DRV_AK4384_TIMER_PERIOD                             (DRV_TMR_PRESCALE_IDX6 == 0x7)? \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<(DRV_TMR_PRESCALE_IDX6+1))/DRV_AK4384_CONTROL_CLOCK): \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<DRV_TMR_PRESCALE_IDX6)/DRV_AK4384_CONTROL_CLOCK)
</#if>                                 
</#if> 
<#if CONFIG_DRV_AK4384_TIMER_DRIVER_MODULE_INDEX_IDX0 == "7">
<#if CONFIG_DRV_TMR_INST_7 == true>
#define DRV_AK4384_TIMER_PERIOD                             (DRV_TMR_PRESCALE_IDX7 == 0x7)? \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<(DRV_TMR_PRESCALE_IDX7+1))/DRV_AK4384_CONTROL_CLOCK): \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<DRV_TMR_PRESCALE_IDX7)/DRV_AK4384_CONTROL_CLOCK)
</#if>                                 
</#if> 
<#if CONFIG_DRV_AK4384_TIMER_DRIVER_MODULE_INDEX_IDX0 == "8">
<#if CONFIG_DRV_TMR_INST_8 == true>
#define DRV_AK4384_TIMER_PERIOD                             (DRV_TMR_PRESCALE_IDX8 == 0x7)? \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<(DRV_TMR_PRESCALE_IDX8+1))/DRV_AK4384_CONTROL_CLOCK): \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<DRV_TMR_PRESCALE_IDX8)/DRV_AK4384_CONTROL_CLOCK)
</#if>                                 
</#if> 
<#if CONFIG_DRV_AK4384_TIMER_DRIVER_MODULE_INDEX_IDX0 == "9">
<#if CONFIG_DRV_TMR_INST_9 == true>
#define DRV_AK4384_TIMER_PERIOD                             (DRV_TMR_PRESCALE_IDX9 == 0x7)? \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<(DRV_TMR_PRESCALE_IDX9+1))/DRV_AK4384_CONTROL_CLOCK): \
                                                            (DRV_AK4384_TIMER_PERIPHERAL_BUS_FREQUENCY/(1<<DRV_TMR_PRESCALE_IDX9)/DRV_AK4384_CONTROL_CLOCK)
</#if>                                 
</#if> 
#define DRV_AK4384_I2S_DRIVER_MODULE_INDEX_IDX0             ${CONFIG_DRV_AK4384_I2S_DRIVER_MODULE_INDEX_IDX0}
#define DRV_AK4384_VOLUME                                   ${CONFIG_DRV_AK4384_VOLUME}
#define DRV_AK4384_VOLUME_MIN                               0x0                                              
#define DRV_AK4384_VOLUME_MAX                               0xFF
#define DRV_AK4384_MCLK_MODE_MACRO                          ${CONFIG_DRV_AK4384_MCLK_MODE_MACRO}
<#if CONFIG_DRV_AK4384_I2S_DRIVER_MODULE_INDEX_IDX0 == "DRV_I2S_INDEX_0">
<#if (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX0 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_32CHANNEL"  || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX0 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_16CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX0 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_16BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX0 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX0 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX0 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX0 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX0 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX0 == "DRV_I2S_AUDIO_LFET_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_LEFT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX0 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX0 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX0 == "DRV_I2S_AUDIO_I2S")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_I2S
<#else>
#error "The AK4384 CODEC driver does not supports the selected combination of "Audio Communication Width" and "Audio Protocol Mode" in i2s driver configuration" 
</#if>
</#if>
<#if CONFIG_DRV_AK4384_I2S_DRIVER_MODULE_INDEX_IDX0 == "DRV_I2S_INDEX_1">
<#if (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX1 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_32CHANNEL"  || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX1 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_16CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX1 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_16BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX1 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX1 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX1 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX1 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX1 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX1 == "DRV_I2S_AUDIO_LFET_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_LEFT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX1 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX1 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX1 == "DRV_I2S_AUDIO_I2S")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_I2S
<#else>
#error "The AK4384 CODEC driver does not supports the selected combination of "Audio Communication Width" and "Audio Protocol Mode" in i2s driver configuration" 
</#if>
</#if>
<#if CONFIG_DRV_AK4384_I2S_DRIVER_MODULE_INDEX_IDX0 == "DRV_I2S_INDEX_2">
<#if (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX2 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_32CHANNEL"  || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX2 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_16CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX2 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_16BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX2 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX2 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX2 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX2 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX2 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX2 == "DRV_I2S_AUDIO_LFET_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_LEFT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX2 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX2 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX2 == "DRV_I2S_AUDIO_I2S")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_I2S
<#else>
#error "The AK4384 CODEC driver does not supports the selected combination of "Audio Communication Width" and "Audio Protocol Mode" in i2s driver configuration" 
</#if>
</#if>
<#if CONFIG_DRV_AK4384_I2S_DRIVER_MODULE_INDEX_IDX0 == "DRV_I2S_INDEX_3">
<#if (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX3 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_32CHANNEL"  || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX3 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_16CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX3 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_16BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX3 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX3 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX3 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX3 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX3 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX3 == "DRV_I2S_AUDIO_LFET_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_LEFT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX3 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX3 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX3 == "DRV_I2S_AUDIO_I2S")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_I2S
<#else>
#error "The AK4384 CODEC driver does not supports the selected combination of "Audio Communication Width" and "Audio Protocol Mode" in i2s driver configuration" 
</#if>
</#if>
<#if CONFIG_DRV_AK4384_I2S_DRIVER_MODULE_INDEX_IDX0 == "DRV_I2S_INDEX_4">
<#if (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX4 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_32CHANNEL"  || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX4 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_16CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX4 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_16BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX4 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX4 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX4 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX4 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX4 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX4 == "DRV_I2S_AUDIO_LFET_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_LEFT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX4 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX4 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX4 == "DRV_I2S_AUDIO_I2S")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_I2S
<#else>
#error "The AK4384 CODEC driver does not supports the selected combination of "Audio Communication Width" and "Audio Protocol Mode" in i2s driver configuration" 
</#if>
</#if>
<#if CONFIG_DRV_AK4384_I2S_DRIVER_MODULE_INDEX_IDX0 == "DRV_I2S_INDEX_5">
<#if (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX5 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_32CHANNEL"  || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX5 == "SPI_AUDIO_COMMUNICATION_16DATA_16FIFO_16CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX5 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_16BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX5 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX5 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX5 == "DRV_I2S_AUDIO_RIGHT_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_RIGHT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX5 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX5 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX5 == "DRV_I2S_AUDIO_LFET_JUSTIFIED")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_LEFT_JUSTIFIED
<#elseif (CONFIG_SPI_AUDIO_COMM_WIDTH_IDX5 == "SPI_AUDIO_COMMUNICATION_24DATA_32FIFO_32CHANNEL" || CONFIG_SPI_AUDIO_COMM_WIDTH_IDX5 == "SPI_AUDIO_COMMUNICATION_32DATA_32FIFO_32CHANNEL") && (CONFIG_DRV_I2S_AUDIO_PROTOCOL_MODE_IDX5 == "DRV_I2S_AUDIO_I2S")>
#define DRV_AK4384_AUDIO_DATA_FORMAT_MACRO                  DRV_AK4384_AUDIO_DATA_FORMAT_24BIT_I2S
<#else>
#error "The AK4384 CODEC driver does not supports the selected combination of "Audio Communication Width" and "Audio Protocol Mode" in i2s driver configuration" 
</#if>
</#if>
</#if> 
</#if> 

/* CODEC Driver Abstraction definition */
#define DRV_CODEC_INDEX_0                                   DRV_AK4384_INDEX_0
#define sysObjdrvCodec0                                     sysObj.drvak4384Codec0
#define DRV_CODEC_CHANNEL                                   DRV_AK4384_CHANNEL
#define DRV_CODEC_CHANNEL_LEFT                              DRV_AK4384_CHANNEL_LEFT
#define DRV_CODEC_CHANNEL_RIGHT                             DRV_AK4384_CHANNEL_RIGHT
#define DRV_CODEC_CHANNEL_LEFT_RIGHT                        DRV_AK4384_CHANNEL_LEFT_RIGHT
#define DRV_CODEC_BUFFER_HANDLE                             DRV_AK4384_BUFFER_HANDLE
#define DRV_CODEC_BUFFER_HANDLE_INVALID                     DRV_AK4384_BUFFER_HANDLE_INVALID
#define DRV_CODEC_BUFFER_EVENT_HANDLER                      DRV_AK4384_BUFFER_EVENT_HANDLER
#define DRV_CODEC_BUFFER_EVENT                              DRV_AK4384_BUFFER_EVENT
#define DRV_CODEC_BUFFER_EVENT_COMPLETE                     DRV_AK4384_BUFFER_EVENT_COMPLETE
#define DRV_CODEC_BUFFER_EVENT_ERROR                        DRV_AK4384_BUFFER_EVENT_ERROR
#define DRV_CODEC_BUFFER_EVENT_ABORT                        DRV_AK4384_BUFFER_EVENT_ABORT
#define DRV_CODEC_COMMAND_EVENT_HANDLER                     DRV_AK4384_COMMAND_EVENT_HANDLER
#define DRV_CODEC_VOLUME_MIN                                DRV_AK4384_VOLUME_MIN                                                                             
#define DRV_CODEC_VOLUME_MAX                                DRV_AK4384_VOLUME_MAX 

#define DRV_CODEC_Initialize                                DRV_AK4384_Initialize
#define DRV_CODEC_Deinitialize                              DRV_AK4384_Deinitialize
#define DRV_CODEC_Status                                    DRV_AK4384_Status
#define DRV_CODEC_Tasks                                     DRV_AK4384_Tasks
#define DRV_CODEC_Open                                      DRV_AK4384_Open
#define DRV_CODEC_Close                                     DRV_AK4384_Close
#define DRV_CODEC_BufferEventHandlerSet                     DRV_AK4384_BufferEventHandlerSet
#define DRV_CODEC_BufferAddWrite                            DRV_AK4384_BufferAddWrite
#define DRV_CODEC_BufferCombinedQueueSizeGet                DRV_AK4384_BufferCombinedQueueSizeGet
#define DRV_CODEC_BufferProcessedSizeGet                    DRV_AK4384_BufferProcessedSizeGet
#define DRV_CODEC_SamplingRateSet                           DRV_AK4384_SamplingRateSet
#define DRV_CODEC_SamplingRateGet                           DRV_AK4384_SamplingRateGet
#define DRV_CODEC_VolumeSet                                 DRV_AK4384_VolumeSet
#define DRV_CODEC_VolumeGet                                 DRV_AK4384_VolumeGet
#define DRV_CODEC_MuteOn                                    DRV_AK4384_MuteOn
#define DRV_CODEC_MuteOff                                   DRV_AK4384_MuteOff
#define DRV_CODEC_CommandEventHandlerSet                    DRV_AK4384_CommandEventHandlerSet

<#--
/*******************************************************************************
 End of File
*/
-->