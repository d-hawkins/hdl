/* ----------------------------------------------------------------------------
 * blinky_gpio_mio.c
 *
 * 6/29/2019 D. W. Hawkins (dwh@caltech.edu)
 *
 * Avnet MiniZed bare-metal Blinky LED example using the GPIO MIO.
 *
 * The Zynq GPIO MIO is used to toggle the PS bicolor LED.
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

	xil_printf("MiniZed Blinky GPIO MIO Example\r\n");
	xil_printf("-------------------------------\r\n");

	// Clear the data (DATA) bits
	*(volatile unsigned int *)0xE000A00C = 0xFFCF0000;

	// Set the direction (DIRM) to output
	*(volatile unsigned int *)0xE000A244 = 0x00300000;

	// Enable the outputs (OEN)
	*(volatile unsigned int *)0xE000A248 = 0x00300000;

	// Blink the bicolor LED
	while (1) {
		switch (i%4) {
			case 0:
				xil_printf("%d: Off\r\n", i);
				*(volatile unsigned int *)0xE000A00C = 0xFFCF0000;
				break;

			case 1:
				xil_printf("%d: Green\r\n", i);
				*(volatile unsigned int *)0xE000A00C = 0xFFCF0020;
				break;

			case 2:
				xil_printf("%d: Red\r\n", i);
				*(volatile unsigned int *)0xE000A00C = 0xFFCF0010;
				break;

			default:
				xil_printf("%d: Amber\r\n", i);
				*(volatile unsigned int *)0xE000A00C = 0xFFCF0030;
				break;
		}
		sleep(1);
		i++;
	}

    cleanup_platform();
    return 0;
}
