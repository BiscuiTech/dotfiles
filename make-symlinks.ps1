#at top of script
if (!
    #current role
    (New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent()
    #is admin?
    )).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
) {
    #elevate script and exit current non-elevated runtime
    Start-Process `
        -FilePath 'powershell' `
        -ArgumentList (
            #flatten to single array
            '-File', $MyInvocation.MyCommand.Source, $args `
            | %{ $_ }
        ) `
        -Verb RunAs
    exit
}
function New-Link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target -Force
}

#New-Link $HOME/nvim/.config/nvim $HOME/.config/nvim
#New-Link $HOME/starship/.config/starship.toml $HOME/.config/starship.toml
#New-Link $HOME/Microsoft.PowerShell_profile.ps1 $PROFILE
#New-Link $HOME/ssh/.ssh/config $HOME/.ssh/config
New-Link $HOME/helix/.config/helix $env:APPDATA/helix
New-Link $HOME/dprint/.dprint.json $HOME/.dprint.json
