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

int main()
{
    struct gpiochip_info cinfo;
    struct gpioline_info linfo;
    struct gpiohandle_request req;
    struct gpiohandle_data    data;


	printf( "Accessing LEDs\n");

    int fd = open( "/dev/gpiochip2", 0 );
    (void) ioctl( fd, GPIO_GET_CHIPINFO_IOCTL, &cinfo );
    fprintf( stdout, "GPIO chip: %s, \"%s\", %u GPIO lines\n", cinfo.name, cinfo.label, cinfo.lines );

    linfo.line_offset = 1;
    (void) ioctl( fd, GPIO_GET_LINEINFO_IOCTL, &linfo );
    fprintf( stdout, "line %2d: %s\n", linfo.line_offset, linfo.name );


    fd = open( "/dev/gpiochip3", 0 );
    (void) ioctl( fd, GPIO_GET_CHIPINFO_IOCTL, &cinfo );
    fprintf( stdout, "GPIO chip: %s, \"%s\", %u GPIO lines\n", cinfo.name, cinfo.label, cinfo.lines );

    linfo.line_offset = 1;
    (void) ioctl( fd, GPIO_GET_LINEINFO_IOCTL, &linfo );
    fprintf( stdout, "line %2d: %s\n", linfo.line_offset, linfo.name );



/*
    // read

    req.lineoffsets[0] = 1;
    req.lines = 2;
    req.flags = GPIOHANDLE_REQUEST_INPUT;
    strcpy( req.consumer_label, "pushbutton" );
    (void) ioctl( fd, GPIO_GET_LINEHANDLE_IOCTL, &req );
    (void) ioctl( req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data );

    printf( "line 1 is %s\n", data.values[0]? "high" : "low" );

*/
    // write

    req.lineoffsets[0] = 0;
    req.lineoffsets[1] = 1;
    req.lineoffsets[2] = 2;
    req.lineoffsets[3] = 3;

    req.lines = 4; // All 4 LEDs
    req.flags = GPIOHANDLE_REQUEST_OUTPUT;
    strcpy( req.consumer_label, "blinker" );
    (void) ioctl( fd, GPIO_GET_LINEHANDLE_IOCTL, &req );
    data.values[0] = 1;
    data.values[1] = 1;
    data.values[2] = 1;
    data.values[3] = 1;
    (void) ioctl( req.fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data );



    printf( "Accessing LEDs Done\n") ;

    return 0;
}
