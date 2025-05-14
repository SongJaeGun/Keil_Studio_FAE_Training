![Reference Applications](./img/RefAppWorkflow.png)

# Reference Applications

CMSIS v6 introduces the concept of
[software layers](https://open-cmsis-pack.github.io/cmsis-toolbox/build-overview/#software-layers), enabling developers
to create flexible and portable
[reference applications](https://open-cmsis-pack.github.io/cmsis-toolbox/ReferenceApplications/) that scale across
various supported devices and boards.

## Objective

This lab demonstrates how to use CMSIS layers to build a simple HTTP web server application on the NUCLEO-F756ZG
development board. The application utilizes components from the
[MDK-Middleware](https://github.com/ARM-software/MDK-Middleware) and serves as a practical reference implementation.

## Procedure

### Create the project

1. Open a new empty instance of VS Code.
2. Go to **CMSIS View** and select “Create a New Solution”:  
   ![Create a New Solution](./img/CreateNewSolution.png)
3. In the "Create Solution" dialog, configure as follows:
   
   - Target Board: NUCLEO-F756ZG  
   - Reference Application: Network  
   - Choose a suitable base directory.  
   ![Create a New Solution](./img/CreateNetworkApp.png)
4. Click “Create”.
5. In the following "Configure Solution" dialog just press OK.  
   ![Configure Solution](./img/ConfigureSolution.png)

### Configure Project

1. Go to **CMSIS View**.
2. Press the cog wheel to open the "Manage Solution" dialog.
3. In the dialog, set the "HTTP_Server" as active project.  
   ![Context Set](./img/ContextSet.png)  
4. Modify the following project files as per
   [setup documentation](https://github.com/Open-CMSIS-Pack/vscode-cmsis-debugger/blob/main/docs/setup.md):

   In `Network.csolution.yml`, insert before the `- projects` section:

   ```yml
   misc:
    - for-compiler: AC6
      C-CPP:
        - -gdwarf-5
      ASM:
        - -gdwarf-5
      Link:
        - --entry=Reset_Handler
   ```

   In `HTTP_Server/HTTP_Server.cproject.yml`, add at the end:

   ```yml
   output:
     type:
      - elf
      - hex
   ```

5. In the `HTTP_Server/RTE/Network/Net_Config_ETH_0.h` file, set the Ethernet MAC address to the one printed on your
   development board box.
6. Build the project. It should build without errors or warnings.

### Debug configuration

1. Using the GUI view, add the Arm GNU Toolchain to the `vcpkg_configuration.json` file as you need it for debugging.
   Save the file.
2. Go to **CMSIS View – Manage Solution Settings** - **Run and Debug** and create a new debug configuration
   (“+ Add New”).
3. Select **CMSIS Debugger: pyOCD**. This will create a `launch.json` file in the `.vscode` directory.
4. In the **Explorer View**, go to `out/HTTP_Server/STM32F756ZGTx/Debug` and right-click `HTTP_Server.hex`.
   Select “Copy relative path”.
5. Add that path to the `load` command around line 15 in the `.vscode/launch.json` file:

   ```json
                   "load out/HTTP_Server/STM32F756ZGTx/Debug/HTTP_Server.hex",
   ```

### Open a serial Terminal

1. Go to **Device Manager** view.
2. Open a serial console to the STLink.  
   ![Opening a serial console](./img/DeviceManagerView.png)
3. In the pop up box, enter a baud rate of 115200.

### Start a debug session

1. Go to **Debug View**, select the "CMSIS Debugger: pyOCD".
2. Press "Play".  
   ![Starting a debug session](./img/DebugView.png)

### Using the project

You can use the web server by entering the IP address that is shown in the serial console in your web browser.

Alternatively, to find the IP address programmatically:

- Open `HTTP_Server.c` and locate the line `printf("IP4: %s\n", ip_ascii);`.
- Set a breakpoint at this line.
- Add `ip_ascii` to the Watch window.
- Run the application to the breakpoint and observe the IP address.

## Conclusion

This lab illustrates the ease of setting up a reference application on a CMSIS-supported development board. Leveraging
CMSIS layers and MDK-Middleware components, developers can quickly prototype and validate embedded network
applications with minimal effort.
