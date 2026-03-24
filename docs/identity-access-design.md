# Identity and Access Design

## Objective

The goal of the identity and access design was to create a clean, production minded structure for how users, privileged accounts, access groups, and administrative roles should be organized in a Microsoft Entra ID environment.

## Account Types

### Standard Users

Standard user accounts were created for normal day to day access. These accounts represent employees performing regular work such as email, collaboration, and normal business operations.

### Admin Accounts

Separate admin accounts were created for privileged administrative work. These accounts were not intended for normal daily activity. This design supports least privilege principles by separating routine usage from elevated administrative actions.

### Break Glass Accounts

Two break glass accounts were created for emergency access scenarios. These accounts were intended to support tenant recovery situations if normal authentication or access controls created an unexpected lockout condition.

## Access Assignment Model

Access was designed to be assigned through security groups rather than directly to individual users. This supports consistency, reduces administrative overhead, and makes access easier to manage over time.

The main group types used in the project were:

1. Department groups  
   Examples included Finance, HR, and IT user groups

2. Baseline access groups  
   A baseline Microsoft 365 style access group was used to apply consistent default access

3. Privileged or tracking groups  
   Separate groups were created to support privilege related account organization

## RBAC Design

Administrative roles were scoped by function rather than assigned broadly. The design emphasized limiting elevated access to what was actually needed.

Roles used in the project included:

1. Global Administrator  
   Restricted to the dedicated admin account for core setup and privileged control

2. User Administrator  
   Used for identity management tasks

3. Groups Administrator  
   Used for group related management

This project reflects least privilege principles in design, even though licensing limitations affected some implementation details.

## Least Privilege Approach

This project demonstrates least privilege principles in several ways:

1. Standard and admin accounts were separated

2. Access was assigned through groups rather than direct user based assignment

3. Administrative roles were scoped by purpose

4. Break glass accounts were isolated from daily usage

5. Offboarding removed access rather than simply leaving permissions in place

## Naming and Structure

The environment followed a consistent naming pattern for users, groups, and administrative identities to keep the tenant understandable and easier to manage.

Examples included:

1. Standard users  
   firstname.lastname

2. Admin accounts  
   adm firstname.lastname format in concept, though final naming reflected actual lab setup

3. Security groups  
   SG plus purpose based naming such as SG Finance Users and SG M365 Users

## Design Outcome

The identity and access model created a more structured and supportable environment. It provided a believable administrative design that aligns with how a small organization could manage access in a Microsoft centered cloud environment.
