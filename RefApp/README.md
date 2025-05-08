# Reference Applications

## Objective

Demonstrate how to create a reference application based on the MDK-Midleware Networ component for the NUCLEO-F756ZG development board.

## Prerequisites

- VS Code installationwith the following extensions:
    - GitHub Pull Requests and Issues
    - CMSIS Debug
    - Keil Studio Pack
- STMicroelectronics NUCLEO-F756ZG board

## Script Steps

### Create the project

1. Open a new empty instance of VS Code.
2. In Keil Studio, select “Create a New Solution” and use these settings:
   ![Create a New Solution](./images/CreateNetworkApp.png)
3. Click “Create”.

### Configure Project

1. Add the Arm Gnu Toolchain to the `vcpkg_configuration.json` file as you need it for debugging (select it using the GUI view).
2. Go to **CMSIS View – Manage Solution Settings** and select the “HTTP Server/Debug” type. Under **Run and Debug**, create a new debug configuration (“+ Add New”).
3. Create a new debug configuration for “CMSIS Debugger: pyOCD”.
4. Change `csolution/cproject.yml` files according to [documentation](https://github.com/Open-CMSIS-Pack/vscode-cmsis-debugger/blob/main/docs/setup.md):
   In the csolution, add before the `- projects` node:
   ```
     misc:
    - for-compiler: AC6
      C-CPP:
        - -gdwarf-5
      ASM:
        - -gdwarf-5
      Link:
        - --entry=Reset_Handler
   ```
   In the cproject, add at the end:
   ```
     output:
    type:
    - elf
    - hex
    ```
5. Build the project.
6. In the **Explorer View**, go to `./out/HTTP_Server/…/` and right-click `HTTP_Server.hex`. Select “Copy relative path”.
7. Add that path to the load command in the `launch.json` file.
8. In the same file, add after the cbuildRunFile entry:
   `"definitionPath": "/Users/chrsei01/.cache/arm/packs/Keil/STM32F7xx_DFP/3.0.0/CMSIS/SVD/STM32F756xx.svd"` (adapt to your installation)
9.  In the `Net_Config_ETH_0.h` file, set the Ethernet MAC address to the one printed on your development board box.
10. Build the project.
11. Before debugging the project, you need to patch the cbuild-run.yml file. For all RAMs in the `system-resources:` node, add:
    `        access: rwx`
    And for all ROMs, add:
    `        access: rx`
12. Start a debugging session and run the project.
13. How to find the IP address:
    - Open the file HTTP_Server.c
    - Find line 42: `    printf("IP4: %s\n",ip_ascii);` and set a breakpoint there.
    - Add `ip_ascii` to the Watch.
    - Run until the breakpoint and observe the IP address in the Watch window!
14. Open a browser and enter your board's IP address.

## Result

This session demonstrates how easy it is to set up a reference example project for a development board that is supported by
CMSIS-Packs with CMSIS-Drivers and layers. OOBE is great and the project is up and running within minutes.
