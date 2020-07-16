// This file is a total mess.  But it works!
// It can be useful to refer to:  http://ece-research.unm.edu/jimp/codesign/labs/V2Pro/EDK_INTERRUPT_DEMO_TUT/MY_INTC_CODE/GpioInterrupt.c
// Ian Lang



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
#include "xgpio.h"
#include "xscugic.h"
#include "sleep.h"

#include "xparameters.h"


// Function prototype (I'm writing the function at the bottom).
void GPIO_InterruptHandler(void *InstancePtr);



XScuGic InterruptController;     /* Instance of the Interrupt Controller */
static XScuGic_Config *GicConfig;/* The configuration parameters of the interrupt controller */

static XGpio   GPIOInstance_Ptr; /* Instance of the PMOD GPIO */
int xStatus;


// THIS WILL ALSO GO
//void GPIO_InterruptHandler_put_back( void *data, u8 TmrCtrNumber )
//{
//print(" Inside GPIO ISR \n \r ");
//}



int SetUpInterruptSystem( XScuGic *XScuGicInstancePtr )
{
	printf( "HERE 1!" );


/*
* Connect the interrupt controller interrupt handler to the hardware
* interrupt handling logic in the ARM processor.
*/
Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
(Xil_ExceptionHandler) XScuGic_InterruptHandler,
XScuGicInstancePtr);
/*
* Enable interrupts in the ARM
*/
Xil_ExceptionEnable();
return XST_SUCCESS;
}



int ScuGicInterrupt_Init( u16 DeviceId, XGpio *GPIOInstancePtr )
{
int Status;


printf( "HERE 2!" );

/*
* Initialize the interrupt controller driver so that it is ready to
* use.
* */
GicConfig = XScuGic_LookupConfig( DeviceId );
if (NULL == GicConfig) {
return XST_FAILURE;
}
Status = XScuGic_CfgInitialize( &InterruptController, GicConfig, GicConfig->CpuBaseAddress);
if (Status != XST_SUCCESS) {
return XST_FAILURE;
}



/*
* Setup the Interrupt System
* */
Status = SetUpInterruptSystem(&InterruptController);
if (Status != XST_SUCCESS) {
return XST_FAILURE;
}





/*
* Connect a device driver handler that will be called when an
* interrupt for the device occurs, the device driver handler performs
* the specific interrupt processing for the device
*/
Status = XScuGic_Connect(
		                &InterruptController,
						XPAR_FABRIC_I_DGRM_WRAPPER_DGRM_I_PMOD_IP2INTC_IRPT_INTR,
						(Xil_ExceptionHandler)GPIO_InterruptHandler,
						(void *)GPIOInstancePtr
						);
if (Status != XST_SUCCESS) {
return XST_FAILURE;
}





/*
* Enable the interrupt for the device and then cause (simulate) an
* interrupt so the handlers will be called
*/
XScuGic_Enable(&InterruptController, XPAR_FABRIC_I_DGRM_WRAPPER_DGRM_I_PMOD_IP2INTC_IRPT_INTR);
return XST_SUCCESS;
}





int main()
{
    init_platform();

    print("Ian's interrupt triggered button hanlding\n\r");


    // AXI GPIO
    // Initialization
    xStatus = XGpio_Initialize( &GPIOInstance_Ptr, XPAR_I_DGRM_WRAPPER_DGRM_I_PMOD_DEVICE_ID );
    if( XST_SUCCESS != xStatus )
    	print("GPIO INIT FAILED\n\r");
    // Set the Direction
    XGpio_SetDataDirection( &GPIOInstance_Ptr, 1, 3 );           // Port 1 can read two of the four PMOD switches in its bottom two bits.
    XGpio_SetDataDirection( &GPIOInstance_Ptr, 2, 0 );           // Port 2 drives the four PMOD LEDs.
    XGpio_DiscreteWrite(    &GPIOInstance_Ptr, 2, 0x0000000F );  // Start with four LEDs lit.
    XGpio_InterruptGlobalEnable( &GPIOInstance_Ptr );
    XGpio_InterruptEnable( &GPIOInstance_Ptr, 0x00000003 );

    printf( "hereeee\n\r" );


    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //Step-10 : SCUGIC interrupt controller Intialization
    //Registration of the Timer ISR
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    xStatus=
    ScuGicInterrupt_Init(XPAR_PS7_SCUGIC_0_DEVICE_ID, &GPIOInstance_Ptr);
    if(XST_SUCCESS != xStatus)
    print(" :( SCUGIC INIT FAILED \n\r");



    while(1)
    {
    	sleep( 2 );
	    printf( "background loop\n\r" );
    }



    cleanup_platform();
    return 0;
}



//-------------------- Hand written below here. ---------------------






// I got this from xtmrctr_intr.c and am about to modify it heavily.
// It was originally called XTmrCtr_InterruptHandler.
void GPIO_InterruptHandler(void *InstancePtr)
{

	XGpio   *GPIOInstance_Ptr;

//	XTmrCtr *TmrCtrPtr = NULL;
//	u8 TmrCtrNumber;
//	u32 ControlStatusReg;

	/*
	 * Verify that each of the inputs are valid.
	 */
	Xil_AssertVoid(InstancePtr != NULL);

	/*
	 * Convert the non-typed pointer to an timer/counter instance pointer
	 * such that there is access to the timer/counter
	 */
	GPIOInstance_Ptr = (XGpio *) InstancePtr;


	printf( "THIS IS IAN'S INTERRUPT HAnDLER.  CHANGE ITS NAME AND FILL IT OUT!\n\t" );


	// Experimental - clear interrupt without checking anything.
	 XGpio_InterruptClear(GPIOInstance_Ptr, 3);

//	/*
//	 * Loop thru each timer counter in the device and call the callback
//	 * function for each timer which has caused an interrupt
//	 */
//	for (TmrCtrNumber = 0;
//		TmrCtrNumber < XTC_DEVICE_TIMER_COUNT; TmrCtrNumber++) {
//
//		ControlStatusReg = XTmrCtr_ReadReg(TmrCtrPtr->BaseAddress,
//						   TmrCtrNumber,
//						   XTC_TCSR_OFFSET);
//		/*
//		 * Check if interrupt is enabled
//		 */
//		if (ControlStatusReg & XTC_CSR_ENABLE_INT_MASK) {
//
//			/*
//			 * Check if timer expired and interrupt occured
//			 */
//			if (ControlStatusReg & XTC_CSR_INT_OCCURED_MASK) {
//				/*
//				 * Increment statistics for the number of
//				 * interrupts and call the callback to handle
//				 * any application specific processing
//				 */
//				TmrCtrPtr->Stats.Interrupts++;
//				TmrCtrPtr->Handler(TmrCtrPtr->CallBackRef,
//						   TmrCtrNumber);
//				/*
//				 * Read the new Control/Status Register content.
//				 */
//				ControlStatusReg =
//					XTmrCtr_ReadReg(TmrCtrPtr->BaseAddress,
//								TmrCtrNumber,
//								XTC_TCSR_OFFSET);
//				/*
//				 * If in compare mode and a single shot rather
//				 * than auto reload mode then disable the timer
//				 * and reset it such so that the interrupt can
//				 * be acknowledged, this should be only temporary
//				 * till the hardware is fixed
//				 */
//				if (((ControlStatusReg &
//					XTC_CSR_AUTO_RELOAD_MASK) == 0) &&
//					((ControlStatusReg &
//					  XTC_CSR_CAPTURE_MODE_MASK)== 0)) {
//						/*
//						 * Disable the timer counter and
//						 * reset it such that the timer
//						 * counter is loaded with the
//						 * reset value allowing the
//						 * interrupt to be acknowledged
//						 */
//						ControlStatusReg &=
//							~XTC_CSR_ENABLE_TMR_MASK;
//
//						XTmrCtr_WriteReg(
//							TmrCtrPtr->BaseAddress,
//							TmrCtrNumber,
//							XTC_TCSR_OFFSET,
//							ControlStatusReg |
//							XTC_CSR_LOAD_MASK);
//
//						/*
//						 * Clear the reset condition,
//						 * the reset bit must be
//						 * manually cleared by a 2nd write
//						 * to the register
//						 */
//						XTmrCtr_WriteReg(
//							TmrCtrPtr->BaseAddress,
//							TmrCtrNumber,
//							XTC_TCSR_OFFSET,
//							ControlStatusReg);
//				}
//
//				/*
//				 * Acknowledge the interrupt by clearing the
//				 * interrupt bit in the timer control status
//				 * register, this is done after calling the
//				 * handler so the application could call
//				 * IsExpired, the interrupt is cleared by
//				 * writing a 1 to the interrupt bit of the
//				 * register without changing any of the other
//				 * bits
//				 */
//				XTmrCtr_WriteReg(TmrCtrPtr->BaseAddress,
//						 TmrCtrNumber,
//						 XTC_TCSR_OFFSET,
//						 ControlStatusReg |
//						 XTC_CSR_INT_OCCURED_MASK);
//			}
//		}
//	}
}
