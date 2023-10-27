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

#New-Link $HOME/dotfiles/nvim/.config/nvim $HOME/.config/nvim
#New-Link $HOME/dotfiles/starship/.config/starship.toml $HOME/.config/starship.toml
#New-Link $HOME/dotfiles/Microsoft.PowerShell_profile.ps1 $PROFILE
#New-Link $HOME/dotfiles/ssh/.ssh/config $HOME/.ssh/config
New-Link $HOME/dotfiles/helix/.config/helix $env:APPDATA/helix
New-Link $HOME/dotfiles/dprint/.dprint.json $HOME/.dprint.json
