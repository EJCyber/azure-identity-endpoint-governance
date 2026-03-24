param(
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Write-Host "Starting offboarding process for $UserPrincipalName..." -ForegroundColor Cyan

# =========================
# Get user
# =========================
$User = Get-MgUser -Filter "userPrincipalName eq '$UserPrincipalName'"

if (-not $User) {
    Write-Host "User not found." -ForegroundColor Red
    return
}

# =========================
# Disable account
# =========================
try {
    Update-MgUser -UserId $User.Id -AccountEnabled:$false
    Write-Host "Account disabled." -ForegroundColor Green
}
catch {
    Write-Host "Failed to disable account: $($_.Exception.Message)" -ForegroundColor Red
}

# =========================
# Get group memberships
# =========================
$Groups = Get-MgUserMemberOf -UserId $User.Id

# =========================
# Remove from groups
# =========================
foreach ($Group in $Groups) {
    try {
        Remove-MgGroupMemberByRef -GroupId $Group.Id -DirectoryObjectId $User.Id
        $GroupName = $Group.AdditionalProperties.displayName
        Write-Host "Removed from group: $GroupName" -ForegroundColor Yellow
    }
    catch {
        Write-Host "Failed to remove from group: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# =========================
# Final summary
# =========================
Write-Host ""
Write-Host "Offboarding complete." -ForegroundColor Cyan
Write-Host "User: $UserPrincipalName"
Write-Host "Status: Disabled and access removed"
