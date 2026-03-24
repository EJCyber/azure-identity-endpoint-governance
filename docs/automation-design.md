# Automation Design

## Objective

The automation component of this project was created to reduce manual identity administration and support consistent lifecycle management. The focus was on practical PowerShell automation using Microsoft Graph, not on creating overly complex scripts.

## Why Automation Was Used

Manual onboarding and offboarding are repetitive and easy to perform inconsistently. Automation was introduced to improve repeatability, reduce administrative effort, and support a more operationally mature workflow.

Automation in this project was intended to show that common identity tasks can be handled in a structured and scalable way.

## Tools Used

The automation layer was built using:

1. Microsoft Graph PowerShell

2. PowerShell scripting

These tools were used locally to manage objects in the cloud based Entra environment.

## Onboarding Script

The onboarding workflow was implemented in `New-CompanyUser.ps1`.

The script was designed to:

1. Accept user details such as first name, last name, and department

2. Create a new user in Microsoft Entra ID

3. Apply naming conventions

4. Assign the user to the correct department security group

5. Assign the user to the baseline access group

6. Return clear status output for verification

This established a repeatable onboarding workflow that aligned with the group based access model.

## Offboarding Script

The offboarding workflow was implemented in `Disable-CompanyUser.ps1`.

The script was designed to:

1. Locate a user by user principal name

2. Disable the account

3. Remove group memberships

4. Return clear status output for verification

The user account was intentionally not deleted. This was a deliberate design decision to support retention, audit trail continuity, and more realistic offboarding practices.

## Validation Approach

Automation results were validated in two ways:

1. Through PowerShell  
   User existence, group membership, and status checks were confirmed through Microsoft Graph commands

2. Through the Entra portal  
   Created users, disabled users, and group relationships were visually confirmed

This ensured that identity lifecycle actions behaved as expected across both programmatic and administrative interfaces.

## Automation Outcome

The automation layer turned the project from a static identity design into a practical administrative workflow. It demonstrated the ability to automate user provisioning and deprovisioning while preserving structure, consistency, and validation.
