/* ----------------------------------------------------------------------------
 * blinky_gpio_emio.c
 *
 * 6/16/2019 D. W. Hawkins (dwh@caltech.edu)
 *
 * Avnet MiniZed bare-metal Blinky LED example using the GPIO MIO and EMIO.
 *
 * The Zynq GPIO MIO is used to toggle the PS bicolor LED, while the
 * GPIO EMIO is routed through the PL to toggle the PL bicolor LED.
 *
 * ----------------------------------------------------------------------------
 */

#include <sleep.h>
#include "platform.h"
#include "xil_printf.h"

int main()
{
	int i = 0;

    init_platform();

    // PS-GPIO-MIO Settings
    // --------------------
	// Clear the data bits
	*(volatile unsigned int *)0xE000A00C = 0xFFCF0000;

	// Set the direction to output
	*(volatile unsigned int *)0xE000A244 = 0x00300000;

	// Enable the outputs
	*(volatile unsigned int *)0xE000A248 = 0x00300000;

    // PS-GPIO-EMIO Settings
    // --------------------
	// Clear the data bits
	*(volatile unsigned int *)0xE000A048 = 0xFFFC0000;

	// Set the direction to output
	*(volatile unsigned int *)0xE000A284 = 0x00000003;

	xil_printf("MiniZed Blinky GPIO EMIO Example\r\n");
	xil_printf("-------------------------------\r\n");

	while (1) {
		switch (i%4) {
			case 0:
				xil_printf("%d: Off\r\n", i);
				*(volatile unsigned int *)0xE000A00C = 0xFFCF0000;
				*(volatile unsigned int *)0xE000A048 = 0xFFFC0000;
				break;

			case 1:
				xil_printf("%d: Green\r\n", i);
				*(volatile unsigned int *)0xE000A00C = 0xFFCF0020;
				*(volatile unsigned int *)0xE000A048 = 0xFFFC0001;
				break;

			case 2:
				xil_printf("%d: Red\r\n", i);
				*(volatile unsigned int *)0xE000A00C = 0xFFCF0010;
				*(volatile unsigned int *)0xE000A048 = 0xFFFC0002;
				break;

			default:
				xil_printf("%d: Amber\r\n", i);
				*(volatile unsigned int *)0xE000A00C = 0xFFCF0030;
				*(volatile unsigned int *)0xE000A048 = 0xFFFC0003;
				break;
		}
		sleep(1);
		i++;
	}

    cleanup_platform();
    return 0;
}
