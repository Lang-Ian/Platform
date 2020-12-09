// Reference:  1) https://www.youtube.com/watch?v=lQRCDl0tFiQ&t=2200s
//             2) https://github.com/torvalds/linux/blob/master/include/uapi/linux/gpio.h
//             3) https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841873/Linux%2BDrivers
//                This is all the Xilinx Linux drivers.  They are actually still using SYSFS for GPIO,
//				  not this method, which is called CHARDEV and is the recommended way now.
//                Nevertheless, it's good to know where the driver iformation is at last.
// This is a user-space program.
// To do:
// open a different file pointer for the LEDs and for the buttons

#include <stdio.h>
#include <stdio.h>
#include <string.h>
#include <linux/gpio.h>
#include <linux/input.h>
#include <fcntl.h>

#include<linux/watchdog.h>

int main()
{
    struct gpiochip_info cinfo;
    struct gpioline_info linfo;
    struct gpiohandle_request req2,  req3,  req4;
    struct gpiohandle_data    data2, data3, data4;
    int flash = 0;

	printf( "Accessing LEDs\n");

    int fd2 = open( "/dev/gpiochip2", 0 );
    (void) ioctl( fd2, GPIO_GET_CHIPINFO_IOCTL, &cinfo );
    fprintf( stdout, "GPIO chip: %s, \"%s\", %u GPIO lines\n", cinfo.name, cinfo.label, cinfo.lines );

    linfo.line_offset = 1;
    (void) ioctl( fd2, GPIO_GET_LINEINFO_IOCTL, &linfo );
    fprintf( stdout, "line %2d: %s\n", linfo.line_offset, linfo.name );

    int fd3 = open( "/dev/gpiochip3", 0 );
    (void) ioctl( fd3, GPIO_GET_CHIPINFO_IOCTL, &cinfo );
    fprintf( stdout, "GPIO chip: %s, \"%s\", %u GPIO lines\n", cinfo.name, cinfo.label, cinfo.lines );

    linfo.line_offset = 1;
    (void) ioctl( fd3, GPIO_GET_LINEINFO_IOCTL, &linfo );
    fprintf( stdout, "line %2d: %s\n", linfo.line_offset, linfo.name );

    int fd4 = open( "/dev/gpiochip4", 0 );
    (void) ioctl( fd4, GPIO_GET_CHIPINFO_IOCTL, &cinfo );
    fprintf( stdout, "GPIO chip: %s, \"%s\", %u GPIO lines\n", cinfo.name, cinfo.label, cinfo.lines );

    linfo.line_offset = 1;
    (void) ioctl( fd4, GPIO_GET_LINEINFO_IOCTL, &linfo );
    fprintf( stdout, "line %2d: %s\n", linfo.line_offset, linfo.name );

//    return 1;

    req2.lineoffsets[0] = 0;
    req2.lineoffsets[1] = 1;

    req3.lineoffsets[0] = 0;
    req3.lineoffsets[1] = 1;
    req3.lineoffsets[2] = 2;
    req3.lineoffsets[3] = 3;

    req4.lineoffsets[0] = 54;
    req4.lineoffsets[1] = 55;

    while( 1 )
    {
    // read PL switches
    data2.values[0] = 1;
    data2.values[1] = 1;

    req2.lines = 2;  // Both push buttons
    req2.flags = GPIOHANDLE_REQUEST_INPUT;
    strcpy( req2.consumer_label, "PL pushbutton" );

    (void) ioctl( fd2, GPIO_GET_LINEHANDLE_IOCTL, &req2 );
    (void) ioctl( req2.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data2 );

    printf( "line 0 is %s\n", data2.values[0]? "high" : "low" );
    printf( "line 1 is %s\n", data2.values[1]? "high" : "low" );



    // read PS switches
    data4.values[54] = 1;  // 54 is this weird offset that applies to the PS side GPIOs.
    data4.values[55] = 1;

    req4.lines = 2;  // Both push buttons
    req4.flags = GPIOHANDLE_REQUEST_INPUT;
    strcpy( req4.consumer_label, "PS pushbutton" );

    (void) ioctl( fd4, GPIO_GET_LINEHANDLE_IOCTL, &req4 );
    (void) ioctl( req4.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data4 );

    printf( "line 0 is %s\n", data4.values[0]? "high" : "low" );
    printf( "line 1 is %s\n", data4.values[1]? "high" : "low" );



    // write PL LEDs
    req3.flags = GPIOHANDLE_REQUEST_OUTPUT;
    req3.lines = 4; // All 4 LEDs
    strcpy( req3.consumer_label, "PL blinker" );

    flash = ~flash;
    data3.values[0] = flash;
    data3.values[1] = ~flash;
    data3.values[2] = flash;
    data3.values[3] = ~flash;

    (void) ioctl( fd3, GPIO_GET_LINEHANDLE_IOCTL, &req3 );
    (void) ioctl( req3.fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data3 );
   }

    return 0;
}
