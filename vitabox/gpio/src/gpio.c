// Reference:  https://www.youtube.com/watch?v=lQRCDl0tFiQ&t=2200s

#include <stdio.h>
#include <linux/gpio.h>
#include <linux/input.h>
#include <fcntl.h>

int main()
{
    struct gpiochip_info cinfo;
    struct gpioline_info linfo;

	printf( "Accessing LEDs\n") ;

    int fd = open( "/dev/gpiochip3", 0 );

    (void) ioctl( fd, GPIO_GET_CHIPINFO_IOCTL, &cinfo );

    fprintf( stdout, "GPIO chip: %s, \"%s\", %u GPIO lines\n", cinfo.name, cinfo.label, cinfo.lines );



    (void) ioctl( fd, GPIO_GET_LINEINFO_IOCTL, &linfo );

    fprintf( stdout, "line %2d: %s\n", linfo.line_offset, linfo.name );
    printf( "Accessing LEDs Done\n") ;

    return 0;
}
