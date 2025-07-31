# Board: STMicroelectronics [NUCLEO-F756ZG](https://www.st.com/en/evaluation-tools/nucleo-f756zg.html)

## Default Board Layer

Device: **STM32F756ZGTx**

System Core Clock: **216 MHz**

This setup is configured using **STM32CubeMX**, an interactive tool provided by STMicroelectronics for device configuration.
Refer to ["Configure STM32 Devices with CubeMX"](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/CubeMX.md) for additional information.

### System Configuration

| System resource       | Setting
|:----------------------|:--------------------------------------
| Heap                  | 64 kB (configured in the STM32CubeMX)
| Stack (MSP)           |  1 kB (configured in the STM32CubeMX)

### STDIO mapping

**STDIO** is routed to Virtual COM port on the ST-LINK (using **USART3** peripheral)

### CMSIS-Driver mapping

| CMSIS-Driver          | Peripheral            | Board connector/component                     | Connection
|:----------------------|:----------------------|:----------------------------------------------|:------------------------------
| Driver_ETH_MAC0       | ETH                   | Ethernet RJ45 connector (CN14)                | CMSIS_ETH
| Driver_ETH_PHY0       | LAN8742A (external)   | Ethernet RJ45 connector (CN14)                | CMSIS_ETH
| Driver_GPIO0          | GPIO                  | Arduino digital I/O pins D2..D10, D14..D19    | ARDUINO_UNO_D2..D10, D14..D19
| Driver_I2C1           | I2C1                  | Arduino I2C pins D20..D21                     | ARDUINO_UNO_I2C
| Driver_USART2         | USART2                | ZIO pins D52, D53 (CN9)                       | CMSIS_USART
| Driver_USART3         | USART3                | ST-LINK connector (CN1)                       | STDIN, STDOUT, STDERR
| Driver_USART6         | USART6                | Arduino UART pins D0..D1                      | ARDUINO_UNO_UART
| Driver_USBD0          | USB_OTG_FS            | User USB connector (CN13)                     | CMSIS_USB_Device
| CMSIS-Driver VIO      | GPIO                  | LEDs (LD3, LD1, LD2) and USER button (B1)     | CMSIS_VIO

> Note: D11 (SPI_COPI) pin on Arduino Connector is unavailable, because it is used by the Ethernet configuration.

Reference to [Arduino UNO connector description](https://github.com/Open-CMSIS-Pack/cmsis-toolbox/blob/main/docs/ReferenceApplications.md#arduino-shield).

### CMSIS-Driver Virtual I/O mapping

| CMSIS-Driver VIO      | Board component
|:----------------------|:--------------------------------------
| vioBUTTON0            | USER button (B1)
| vioLED0               | LED red     (LD3)
| vioLED1               | LED green   (LD1)
| vioLED2               | LED blue    (LD2)
