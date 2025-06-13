# Blinky project

The Blinky project is a simple example that verifies the basic tool and hardware setup.

It is compliant with the Cortex Microcontroller Software Interface Standard (CMSIS) and uses the CMSIS-RTOS2 API
interface for RTOS functionality. The CMSIS-RTOS2 API is available with various real-time operating systems, for
example RTX5 or FreeRTOS.

## Step 1: Connect the Hardware

1. Connect the development board to your computer using a Micro-USB cable. Next, launch VS Code.
2. If the ST-Link is not recognized automatically, you might be missing the correct drivers. Please download the
   drivers from [st.com](https://www.st.com/en/development-tools/stsw-link009.html#st-get-software) and install them
   on your machine.
3. Check if the board has been recognized correctly by opening the **Device Manager View**. It should show the board
   that is being connected to your computer:  
   ![NUCLEO-F756ZG connected to the computer](./img/ConnectedDevice.png)

## Step 2: Build the Project

1. Go to the **CMSIS View**.
2. Build the project:  
   ![Build the project in the CMSIS View](./img/BuildProject.png)  
   The project should be built without warnings.

## Step 3: Start the Debug Session

1. Switch to **Run and Debug** and select **STLink@pyOCD (launch)**.
2. Click the **Play** icon to launch the debug session.  
   ![Starting a debug session](./img/DebugView.png)

### Operation

- At start the vioLED0 blinks in 1 sec interval.
- The vioBUTTON0 changes the blink frequency and starts/stops vioLED1.

  ![STM32F756ZG_B1-LEDs](https://github.com/user-attachments/assets/33bfe7b3-e4cb-4d66-85e7-a579bace7356)

### CMSIS-Driver Virtual I/O mapping

| CMSIS-Driver VIO      | Board component
|:----------------------|:--------------------------------------
| vioBUTTON0            | USER button (B1)
| vioLED0               | LED red     (LD3)
| vioLED1               | LED green   (LD1)
| vioLED2               | LED blue    (LD2)

## Conclusion

By now, you should have a tools and hardware setup that works with Keil Studio.

## Where to go next

The next lab talks about how to convert µVision uvprojx files to CMSIS solution projects. Please check the
[README](../uv2csolution/README.md)
