# GitHub Actions

We have a couple of repos that we can show:

1. https://github.com/ARM-software/AVH-MLOps
2. https://github.com/Arm-Examples/AVH_CI_Template
3. https://github.com/Arm-Examples/Hello_NUCLEO-F756ZG

## Objective

Demonstrate a CI workflow that builds and tests embedded firmware from the Hello_NUCLEO-F756ZG repository on every pull request.

## Prerequisites

- Forked [GitHub repository](https://github.com/Arm-Examples/Hello_NUCLEO-F756ZG)
- GitHub Actions enabled
- `.github/workflows/build.yml` included
- STMicroelectronics NUCLEO-F756ZG board (optional for HIL)
- VS Code installed with the following extensions:
    - GitHub Pull Requests and Issues
    - CMSIS Debug
    - Keil Studio Pack

## Script Steps

1. Clone and Open Repository in VS Code
    - Show structure: CMakeLists.txt, Drivers/, Projects/, build/
    - Demonstrate Git integration and branch view
2. Review the Workflow File (.github/workflows/build.yml)
3. Commit a Code Change
    - Modify the LED blink rate or print message
    - Commit and push to a feature branch
4. Create a Pull Request
    - Show GitHub Actions triggering
    - Open Actions tab and show build logs
5. Fix or Enhance Code and Push Again
    - Show iterative development with automated checks
6. (Optional) Flash to Device
    - Use ST-LINK and Cortex-Debug to flash the built binary
    - Verify change on hardware (LED behavior or console output)

## Result

Participants observe how CI/CD ensures reliable builds and encourages incremental development, even in hardware-constrained environments.
