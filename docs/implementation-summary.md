# Implementation Summary

## Project Context

This project was modeled after a small to mid size organization with roughly 75 users and was influenced by real world administrative needs similar to the kind of environment I would want to support in practice.

The objective was to create a cleaner and more secure identity governance model using Microsoft Entra ID as the core identity platform.

## Architecture Decisions

From the start, Microsoft Entra ID was treated as the identity provider and control plane. Azure served as the supporting cloud platform, but identity was the center of the project.

The implementation was structured around users, access control, security, lifecycle management, automation, and validation.

## Identity Build

The environment included several identity types:

1. Standard users

2. A separate admin account

3. Two break glass style emergency accounts

This reflected a deliberate effort to separate daily use from privileged access and to model a more realistic administrative structure.

## Groups and Access

Security groups were created to support access assignment and identity organization. The design emphasized using groups instead of assigning access directly to users wherever possible.

This made the environment more consistent and easier to reason about.

## Issue Encountered During Build

A key issue appeared during role assignment. When attempting to assign roles to a group, only individual users and admin accounts were available, not the groups themselves.

This was traced back to licensing limitations. Role assignable groups and certain privileged access group capabilities require Entra premium licensing, which was not available in the free tier lab environment.

Because of that, roles were assigned directly to user accounts for the purposes of the build.

## Security Design Outcome

Conditional Access was designed conceptually but not implemented due to the same licensing limitations.

The design still reflected production intent, and the following statement accurately describes the outcome:

Conditional Access policies were designed but not fully implemented due to Entra ID licensing limitations in the lab environment. The configuration reflects production intent.

## Automation Work Completed

Onboarding and offboarding scripts were successfully developed and tested.

The onboarding script created new users, assigned them to the correct groups, and supported consistent provisioning.

The offboarding script disabled users, removed group memberships, and intentionally preserved the account rather than deleting it.

## Validation Performed

Validation was completed through both PowerShell and the Entra portal.

PowerShell was used to confirm:

1. That the new user account existed

2. That group membership was correctly assigned

3. That disabled accounts remained present after offboarding

The Entra portal was used to visually confirm that users and group assignments appeared as expected.

## Key Administrative Decision

Users were not deleted during offboarding.

This was a deliberate decision to reflect retention and audit considerations. In a real environment, disabled accounts are often preserved for a period of time rather than immediately removed.

## Overall Outcome

The project successfully demonstrated a production minded identity governance design with working lifecycle automation. It showed how access can be structured, how administrative identities can be separated, how automation can reduce manual effort, and how technical limitations can be documented honestly without weakening the overall design.
