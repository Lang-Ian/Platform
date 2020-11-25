
#ifndef GENERAL_H
#define GENERAL_H


/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"

#define GENERAL_S00_AXI_SLV_REG0_OFFSET 0
#define GENERAL_S00_AXI_SLV_REG1_OFFSET 4
#define GENERAL_S00_AXI_SLV_REG2_OFFSET 8
#define GENERAL_S00_AXI_SLV_REG3_OFFSET 12
#define GENERAL_S00_AXI_SLV_REG4_OFFSET 16
#define GENERAL_S00_AXI_SLV_REG5_OFFSET 20
#define GENERAL_S00_AXI_SLV_REG6_OFFSET 24
#define GENERAL_S00_AXI_SLV_REG7_OFFSET 28
#define GENERAL_S00_AXI_SLV_REG8_OFFSET 32
#define GENERAL_S00_AXI_SLV_REG9_OFFSET 36
#define GENERAL_S00_AXI_SLV_REG10_OFFSET 40
#define GENERAL_S00_AXI_SLV_REG11_OFFSET 44
#define GENERAL_S00_AXI_SLV_REG12_OFFSET 48
#define GENERAL_S00_AXI_SLV_REG13_OFFSET 52
#define GENERAL_S00_AXI_SLV_REG14_OFFSET 56
#define GENERAL_S00_AXI_SLV_REG15_OFFSET 60
#define GENERAL_S00_AXI_SLV_REG16_OFFSET 64
#define GENERAL_S00_AXI_SLV_REG17_OFFSET 68
#define GENERAL_S00_AXI_SLV_REG18_OFFSET 72
#define GENERAL_S00_AXI_SLV_REG19_OFFSET 76
#define GENERAL_S00_AXI_SLV_REG20_OFFSET 80
#define GENERAL_S00_AXI_SLV_REG21_OFFSET 84
#define GENERAL_S00_AXI_SLV_REG22_OFFSET 88
#define GENERAL_S00_AXI_SLV_REG23_OFFSET 92
#define GENERAL_S00_AXI_SLV_REG24_OFFSET 96
#define GENERAL_S00_AXI_SLV_REG25_OFFSET 100
#define GENERAL_S00_AXI_SLV_REG26_OFFSET 104
#define GENERAL_S00_AXI_SLV_REG27_OFFSET 108
#define GENERAL_S00_AXI_SLV_REG28_OFFSET 112
#define GENERAL_S00_AXI_SLV_REG29_OFFSET 116
#define GENERAL_S00_AXI_SLV_REG30_OFFSET 120
#define GENERAL_S00_AXI_SLV_REG31_OFFSET 124
#define GENERAL_S00_AXI_SLV_REG32_OFFSET 128
#define GENERAL_S00_AXI_SLV_REG33_OFFSET 132
#define GENERAL_S00_AXI_SLV_REG34_OFFSET 136
#define GENERAL_S00_AXI_SLV_REG35_OFFSET 140
#define GENERAL_S00_AXI_SLV_REG36_OFFSET 144
#define GENERAL_S00_AXI_SLV_REG37_OFFSET 148
#define GENERAL_S00_AXI_SLV_REG38_OFFSET 152
#define GENERAL_S00_AXI_SLV_REG39_OFFSET 156
#define GENERAL_S00_AXI_SLV_REG40_OFFSET 160
#define GENERAL_S00_AXI_SLV_REG41_OFFSET 164
#define GENERAL_S00_AXI_SLV_REG42_OFFSET 168
#define GENERAL_S00_AXI_SLV_REG43_OFFSET 172
#define GENERAL_S00_AXI_SLV_REG44_OFFSET 176
#define GENERAL_S00_AXI_SLV_REG45_OFFSET 180
#define GENERAL_S00_AXI_SLV_REG46_OFFSET 184
#define GENERAL_S00_AXI_SLV_REG47_OFFSET 188
#define GENERAL_S00_AXI_SLV_REG48_OFFSET 192
#define GENERAL_S00_AXI_SLV_REG49_OFFSET 196
#define GENERAL_S00_AXI_SLV_REG50_OFFSET 200
#define GENERAL_S00_AXI_SLV_REG51_OFFSET 204
#define GENERAL_S00_AXI_SLV_REG52_OFFSET 208
#define GENERAL_S00_AXI_SLV_REG53_OFFSET 212
#define GENERAL_S00_AXI_SLV_REG54_OFFSET 216
#define GENERAL_S00_AXI_SLV_REG55_OFFSET 220
#define GENERAL_S00_AXI_SLV_REG56_OFFSET 224
#define GENERAL_S00_AXI_SLV_REG57_OFFSET 228
#define GENERAL_S00_AXI_SLV_REG58_OFFSET 232
#define GENERAL_S00_AXI_SLV_REG59_OFFSET 236
#define GENERAL_S00_AXI_SLV_REG60_OFFSET 240
#define GENERAL_S00_AXI_SLV_REG61_OFFSET 244
#define GENERAL_S00_AXI_SLV_REG62_OFFSET 248
#define GENERAL_S00_AXI_SLV_REG63_OFFSET 252


/**************************** Type Definitions *****************************/
/**
 *
 * Write a value to a GENERAL register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the GENERALdevice.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void GENERAL_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define GENERAL_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a GENERAL register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the GENERAL device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 GENERAL_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define GENERAL_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the GENERAL instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus GENERAL_Reg_SelfTest(void * baseaddr_p);

#endif // GENERAL_H
