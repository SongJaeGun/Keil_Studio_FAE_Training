![Modern DevOps Workflow](./img/modernDevOpsWorkflow.png)

# CI/CD with GitHub Actions

We have created a couple of repos that can be used as templates to set up a CI/CD DevOps workflow:

1. https://github.com/ARM-software/AVH-MLOps
2. https://github.com/Arm-Examples/AVH_CI_Template
3. https://github.com/Arm-Examples/Hello_NUCLEO-F756ZG

## Objective

Demonstrate a CI workflow that builds and tests embedded firmware from the Hello_NUCLEO-F756ZG repository on every pull
request. In parallel, it also build and *runs* the code for the Cortex-M7 AVH-FVP using GitHub Actions.

## Prerequisites

- Fork [Hello_NUCLEO-F756ZG](https://github.com/Arm-Examples/Hello_NUCLEO-F756ZG) GitHub repository.
- Go to "Actions" tab and enable workflows.
- Go to "Settings" and enable **Issues**.
- VS Code installed with the following extensions:
    - [GitHub Pull Requests](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github)
    - [GitHub Actions](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-github-actions)
    - [Arm CMSIS Debugger](https://marketplace.visualstudio.com/items?itemName=Arm.vscode-cmsis-debugger)
    - [Arm Keil Studio Pack](https://marketplace.visualstudio.com/items?itemName=Arm.keil-studio-pack)
- STMicroelectronics NUCLEO-F756ZG board (optional for HIL).

## Steps

1. Clone the fork to your local machine and open it in VS Code:
    - Understand structure (separation of cprojects for different targets)
    - Use Git integration and branch view in VS Code.
    - Review the workflow file (`.github/workflows/build.yml`)
2. Commit a code change:
    - Modify the `printf` message.
    - Commit and push.
    - See GitHub Actions triggering.
    - Open "Actions" tab and check build logs.
3. Create an issue:
    - In the GitHub extension, go to "Issues" and add an issue (click the "+" sign):  
      ![Create a new issue](./img/createIssue.png)
    - Check how the issue is created in the repo.
    - Update issues in VS Code and leave a comment on the issue.
4. Fix or enhance code and push again:
    - Understand iterative development with automated checks.
5. Flash to device (optional):
    - Use ST-LINK and CMSIS Debug to flash the built binary.
    - Verify change on hardware (console output).

## Result

Participants observe how CI/CD ensures reliable builds and encourages incremental development, even in
hardware-constrained environments.
