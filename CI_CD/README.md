# GitHub Actions

We have created a couple of repos that can be used as templates to set up a CI/CD DevOps workflow:

1. https://github.com/ARM-software/AVH-MLOps
2. https://github.com/Arm-Examples/AVH_CI_Template
3. https://github.com/Arm-Examples/Hello_NUCLEO-F756ZG

## Objective

Demonstrate a CI workflow that builds and tests embedded firmware from the Hello_NUCLEO-F756ZG repository on every pull
request. In parallel, it also build and *runs* the code for the Cortex-M7 AVH-FVP using GitHub Actions.

## Prerequisites

- Fork [Hello_NUCLEO-F756ZG](https://github.com/Arm-Examples/Hello_NUCLEO-F756ZG) GitHub repository
- STMicroelectronics NUCLEO-F756ZG board (optional for HIL)
- VS Code installed with the following extensions:
    - GitHub Pull Requests and Issues
    - CMSIS Debug
    - Keil Studio Pack

## Steps

1. Clone and open Repository in VS Code
    - Understand structure (separation of cprojects)
    - Use Git integration and branch view in VS Code
2. Review the Workflow File (`.github/workflows/build.yml`)
3. Commit a Code Change
    - Modify the LED blink rate or print message
    - Commit and push to a feature branch
4. Create a Pull Request/push to repo
    - See GitHub Actions triggering
    - Open Actions tab and check build logs
5. Fix or Enhance Code and Push Again
    - Understand iterative development with automated checks
6. (Optional) Flash to Device
    - Use ST-LINK and CMSIS Debug to flash the built binary
    - Verify change on hardware (LED behavior or console output)

## Result

Participants observe how CI/CD ensures reliable builds and encourages incremental development, even in
hardware-constrained environments.
