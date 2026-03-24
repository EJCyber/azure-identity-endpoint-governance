# Security Baseline

## Objective

The purpose of the security baseline was to establish a practical starting point for securing identities in a Microsoft Entra ID environment. The focus was on applying controls that support secure authentication, account separation, and administrative discipline while staying honest about licensing limitations.

## MFA Baseline

Multi factor authentication was enabled using the available baseline approach in the lab environment. This provided a basic but important security control for user sign in and reduced reliance on password only access.

The MFA baseline helped demonstrate that identity security begins with stronger authentication, even in a limited lab environment.

## Admin Account Separation

Privileged administrative activity was separated from standard user activity by using dedicated admin accounts. This was a deliberate security decision and one of the clearest least privilege elements in the project.

This separation reduces risk in several ways:

1. It limits the use of elevated privileges during normal work

2. It makes privileged activity easier to understand and review

3. It reflects real world administrative practice in Microsoft environments

## Break Glass Accounts

Break glass accounts were created for emergency access scenarios. These accounts were not intended for day to day use.

Their purpose was to provide recovery access if normal controls created an unexpected lockout or access failure.

In a production environment, these accounts would require careful storage, monitoring, and documented emergency use procedures.

## Conditional Access Design

Conditional Access was designed conceptually but not implemented in the lab due to licensing limitations.

The intended policy design included:

1. Require MFA for all users

2. Require stronger protection for admin accounts

3. Block legacy authentication

4. Exclude break glass accounts from standard Conditional Access enforcement

This design reflects production intent even though it was not operational in the free tier lab environment.

## Security Principles Applied

The project reflects a security first mindset through the following choices:

1. Identity centered access model

2. Separation of privileged and standard identities

3. Group based access assignment

4. Removal of access during offboarding

5. Validation of changes after automation runs

## Honest Scope Statement

This project does not represent a fully mature enterprise security implementation. It represents a production minded security baseline built within the limits of an Azure free tier environment. The design shows sound security direction, while acknowledging that Conditional Access and some advanced role capabilities require premium licensing.
