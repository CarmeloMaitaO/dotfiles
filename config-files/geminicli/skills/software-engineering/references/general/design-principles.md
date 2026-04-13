# General Engineering Principles

## State-Machine Design
Design software by composing state-machines. Ensure transitions are explicit and states are well-defined.

## Requirements Engineering
- **Requirement Specification**: (Optional) Define system boundaries, inputs, outputs, and desired behaviors without implementation details.
- **Design Task**: (Optional) Translate requirements into state-machine compositions.
- **Implementation Strategy**:
    - Follow a sequential plan: implement, test, and verify one state-machine at a time.
    - Only proceed to the next state-machine in the composition once the current one is verified.
- **Clean Room Reverse Engineering**:
    - **Step 1**: Document existing behavior (Requirement Specification).
    - **Step 2**: Re-implement by mapping documented behaviors to state-machine compositions (Design).
    - **Step 3**: Verify implementation against documented behavior.

## Infrastructure & Deployment
- **Unikraft**: Use as the target platform for lightweight VPS deployments.
- **Colmena**: Use for Nix-based system configuration and deployment.
