/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xgpiops.h"
#include "sleep.h"



static int InterruptFlag;
static XGpioPs psGpioInstancePtr;
static XGpio   GPIOInstance_Ptr;


static int iPinNumber     = 10;
static int iPinNumberEMIO = 54;  // https://forums.xilinx.com/t5/Embedded-Development-Tools/EMIO-PIN-numbers-ZYNQ-platform/td-p/273212
u32 uPinDirection = 0x1;
u32 uPinDirectionEMIO = 0x0;


int xStatus;
XGpioPs_Config *GpioConfigPtr;

u32 Readstatus=0;



void InterruptHandler( void *data, u8 TmrCtrNumber )
{
print( "PMOD ISR \n \r ");


print("LED ON \r\n");
XGpioPs_WritePin( &psGpioInstancePtr, iPinNumber, 1 );
XGpio_DiscreteWrite( &GPIOInstance_Ptr, 2, 0x00000009 );  // Turn on outer LEDs

InterruptFlag = 1;
}




int main()  // UG585, General Purpose I/O
{
    init_platform();

    print( "Two PS switches will be polled; two PL switches will use interrupts\n\r" );

    // AXI GPIO Initialization
    xStatus = XGpio_Initialize( &GPIOInstance_Ptr, XPAR_I_DGRM_WRAPPER_DGRM_I_PMOD_DEVICE_ID );
    if( XST_SUCCESS != xStatus )
    	print("GPIO INIT FAILED\n\r");

    // AXI GPIO Set the Direction
    XGpio_SetDataDirection( &GPIOInstance_Ptr, 1, 3);  // Port 1 can read two of the four PMOD switches in its bottom two bits.
    XGpio_SetDataDirection( &GPIOInstance_Ptr, 2, 0);  // Port 2 drives the four PMOD LEDs.
    XGpio_DiscreteWrite( &GPIOInstance_Ptr, 2, 0x00000005 );  // Start with two LEDs lit.


    // PS GPIO Intialization
    GpioConfigPtr = XGpioPs_LookupConfig( XPAR_PS7_GPIO_0_DEVICE_ID );
    if( GpioConfigPtr == NULL )
    	return XST_FAILURE;
    xStatus = XGpioPs_CfgInitialize( &psGpioInstancePtr, GpioConfigPtr, GpioConfigPtr->BaseAddr );
    if( XST_SUCCESS != xStatus )
    	print(" PS GPIO INIT FAILED \n\r");


    // Step-8 :PS GPIO set to Output
    XGpioPs_SetDirectionPin(    &psGpioInstancePtr, iPinNumber,     uPinDirection);
    XGpioPs_SetOutputEnablePin( &psGpioInstancePtr, iPinNumber,     1 );


    XGpioPs_SetDirectionPin(    &psGpioInstancePtr, iPinNumberEMIO, uPinDirectionEMIO);
    XGpioPs_SetOutputEnablePin( &psGpioInstancePtr, iPinNumberEMIO, 0);



    while( 1 )
    {
        usleep( 500000 );

        // Invert the four LEDs with a read modify write
        XGpio_DiscreteWrite( &GPIOInstance_Ptr, 2, ~XGpio_DiscreteRead( &GPIOInstance_Ptr, 2 ) );





        // Print out the two PS switches
        //CRAPprintf( "PS switch status = %d\n\r",  (int) XGpio_DiscreteRead( &psGpioInstancePtr, 1 ) );

        Readstatus = XGpioPs_ReadPin( &psGpioInstancePtr, iPinNumberEMIO );
        printf( "PS switch status = %d\n\r", (int) Readstatus );

        Readstatus = XGpioPs_ReadPin( &psGpioInstancePtr, iPinNumberEMIO+1 );
         printf( "PS switch status +1 = %d\n\r", (int) Readstatus );

         usleep( 500000 );

         // Print out the two PMOD switches connected over AXI
         printf( "AXI GPIO Channel 1 (bottom 2 bits connected) = %d\n\r", (int) XGpio_DiscreteRead( &GPIOInstance_Ptr, 1 ) );


         // Print out the two PMOD switches connected over AXI
         printf( "PS GPIO Bank 2 (bottom 2 bits connected) = %d\n\r", (int) XGpioPs_Read( &psGpioInstancePtr, XGPIOPS_BANK2 ) );

    }

    cleanup_platform();
    return 0;
}
