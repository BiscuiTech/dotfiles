param (
    [String]$LanguageToFix = 'en-US'
)

$lng = Get-WinUserLanguageList
$lng.Add($LanguageToFix)
Set-WinUserLanguageList -Force $lng
$lng.Remove( ( $lng | Where-Object LanguageTag -like $LanguageToFix ) ) 2>&1 | Out-Null
Set-WinUserLanguageList -Force $lng
