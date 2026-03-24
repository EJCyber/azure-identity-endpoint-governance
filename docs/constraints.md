# Constraints

## Objective

This document explains the technical and licensing limitations that affected implementation choices in the project. These constraints do not invalidate the design. They help explain the difference between what was implemented in the lab and what would be expected in a production environment.

## Licensing Constraints

The project was built in an Azure free tier lab environment. Because of that, certain Microsoft Entra premium capabilities were not available.

The most important limitations were:

1. Conditional Access was not available for full implementation

2. Role assignable groups were not available

These two constraints directly shaped the final build.

## Conditional Access Limitation

Conditional Access policies were designed but not implemented due to Entra ID licensing limitations in the lab environment.

The intended design included:

1. MFA enforcement for all users

2. Stronger protection for admin accounts

3. Legacy authentication blocking

4. Break glass account exclusions

The configuration reflects production intent, but not full production enforcement.

## Role Assignment Limitation

The original design goal was to align administrative roles with group based assignment where possible. However, group based privileged role assignment was not available in the lab environment.

As a result, some roles were assigned directly to user accounts instead of through role assignable groups.

This was an implementation constraint, not a design preference.

## Scope Constraints

The project focused on identity governance, access structure, and lifecycle automation. It did not attempt to include all possible enterprise features.

Items intentionally left out or deferred included:

1. Full Conditional Access enforcement

2. Microsoft Intune integration

3. Advanced access review workflows

4. Mature governance reporting and review cycles

## Production Improvements

In a production environment, the following improvements would be appropriate:

1. Enable Conditional Access policies

2. Use role assignable groups for privileged access

3. Introduce Intune for endpoint compliance and device trust

4. Add periodic access reviews and governance controls

## Honest Summary

This project reflects a production minded identity governance design implemented in a constrained lab environment. The limitations were documented intentionally so the project remains honest, credible, and technically grounded.
