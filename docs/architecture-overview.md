# Architecture Overview

## Project Purpose

This project demonstrates a cloud based identity governance implementation built around Microsoft Entra ID. The objective was to create a structured identity and access model for a small to mid size organization while showing how identity, access control, lifecycle management, automation, and validation work together in a real administrative environment.

## Business Context

The project was modeled after a roughly 75 user organization with needs similar to a real world Microsoft 365 environment. The organization required a more consistent way to manage identities, assign access, separate privileged accounts, and handle onboarding and offboarding with less manual effort.

## Core Architectural Idea

Microsoft Entra ID serves as the identity control plane for the environment. All key identity decisions flow through it, including authentication, access assignment, role management, and lifecycle changes.

The architecture was designed around the following components:

1. Users  
   Standard users, admin accounts, and break glass accounts

2. Microsoft Entra ID  
   Central identity provider and control plane

3. Security Controls  
   MFA baseline with Conditional Access design intent

4. Security Groups  
   Group based access assignment rather than direct assignment to users

5. RBAC  
   Scoped administrative roles based on job function

6. Identity Lifecycle Management  
   Onboarding, role changes, and offboarding

7. Automation  
   Microsoft Graph PowerShell used to automate repeatable tasks

8. Validation and Governance  
   Verification of users, group membership, and account state

## Design Principles

This project was built around a few core principles.

1. Identity is central  
   Access and administrative control should be driven by identity rather than by scattered manual configuration

2. Access should be consistent  
   Group based assignment is more scalable and easier to review than assigning permissions user by user

3. Administrative access should be separated  
   Standard user accounts and privileged admin accounts should not be the same

4. Automation should support repeatable work  
   Common lifecycle tasks should be automated where possible to reduce inconsistency

5. Validation matters  
   Changes should be confirmed through both PowerShell and the administrative portal

## Architectural Summary

The overall design places Microsoft Entra ID at the center of the environment. Users authenticate into Entra. Security controls are applied. Access is assigned through security groups. Roles are managed through RBAC. Lifecycle actions are handled through automation. Final results are validated through governance checks.

## Scope Notes

This project focused on cloud identity governance and lifecycle administration. It did not attempt to model a full production tenant with premium licensing features, endpoint compliance management, or advanced audit workflows. Those items were noted where relevant as future production improvements.
