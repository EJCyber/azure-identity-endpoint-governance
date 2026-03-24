param(
    [Parameter(Mandatory=$true)]
    [string]$FirstName,

    [Parameter(Mandatory=$true)]
    [string]$LastName,

    [Parameter(Mandatory=$true)]
    [ValidateSet("Finance","HR","IT")]
    [string]$Department
)

# =========================
# Configuration
# =========================
$TenantDomain = "mannylabsacctgmail.onmicrosoft.com"
$DefaultPassword = "TempP@ssw0rd123!"
$BaselineGroupName = "SG-M365-Users"

# Department-to-group mapping
$DepartmentGroupMap = @{
    "Finance" = "SG-Finance-Users"
    "HR"      = "SG-HR-Users"
    "IT"      = "SG-IT-Users"
}

# =========================
# Build identity values
# =========================
$FirstNameClean = $FirstName.Trim().ToLower()
$LastNameClean  = $LastName.Trim().ToLower()

$DisplayName = "$FirstName $LastName"
$MailNickname = "$FirstNameClean.$LastNameClean"
$UserPrincipalName = "$MailNickname@$TenantDomain"

Write-Host "Starting onboarding process for $DisplayName..." -ForegroundColor Cyan

# =========================
# Check if user already exists
# =========================
$ExistingUser = Get-MgUser -Filter "userPrincipalName eq '$UserPrincipalName'" -ErrorAction SilentlyContinue

if ($ExistingUser) {
    Write-Host "User already exists: $UserPrincipalName" -ForegroundColor Yellow
    return
}

# =========================
# Create password profile
# =========================
$PasswordProfile = @{
    forceChangePasswordNextSignIn = $true
    password = $DefaultPassword
}

# =========================
# Create the user
# =========================
try {
    $NewUser = New-MgUser `
        -DisplayName $DisplayName `
        -GivenName $FirstName `
        -Surname $LastName `
        -MailNickname $MailNickname `
        -UserPrincipalName $UserPrincipalName `
        -AccountEnabled `
        -PasswordProfile $PasswordProfile `
        -Department $Department

    Write-Host "User created successfully: $UserPrincipalName" -ForegroundColor Green
}
catch {
    Write-Host "Failed to create user: $($_.Exception.Message)" -ForegroundColor Red
    return
}

# =========================
# Get target groups
# =========================
$DepartmentGroupName = $DepartmentGroupMap[$Department]

$DepartmentGroup = Get-MgGroup -Filter "displayName eq '$DepartmentGroupName'"
$BaselineGroup = Get-MgGroup -Filter "displayName eq '$BaselineGroupName'"

if (-not $DepartmentGroup) {
    Write-Host "Department group not found: $DepartmentGroupName" -ForegroundColor Red
    return
}

if (-not $BaselineGroup) {
    Write-Host "Baseline group not found: $BaselineGroupName" -ForegroundColor Red
    return
}

# =========================
# Add user to department group
# =========================
try {
    New-MgGroupMember -GroupId $DepartmentGroup.Id -DirectoryObjectId $NewUser.Id
    Write-Host "Added to department group: $DepartmentGroupName" -ForegroundColor Green
}
catch {
    Write-Host "Failed to add to department group: $($_.Exception.Message)" -ForegroundColor Red
}

# =========================
# Add user to baseline group
# =========================
try {
    New-MgGroupMember -GroupId $BaselineGroup.Id -DirectoryObjectId $NewUser.Id
    Write-Host "Added to baseline group: $BaselineGroupName" -ForegroundColor Green
}
catch {
    Write-Host "Failed to add to baseline group: $($_.Exception.Message)" -ForegroundColor Red
}

# =========================
# Final summary
# =========================
Write-Host ""
Write-Host "Onboarding complete." -ForegroundColor Cyan
Write-Host "Name: $DisplayName"
Write-Host "UPN: $UserPrincipalName"
Write-Host "Department: $Department"
Write-Host "Temporary Password: $DefaultPassword"
