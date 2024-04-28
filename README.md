Repo largely inspired by https://github.com/bartdorsey/dotfiles

# Post-install
Need to manually install these tools. Will probly need to automate all this, but for now let's keep it simple.
## Windows
- `npm install -g @microsoft/inshellisense eslint prettier vscode-langservers-extracted typescript-language-server`
- [Windows installer](https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe)
- [marksman](https://github.com/artempyanykh/marksman/releases) and move binary to ~/bin folder
- `cargo install --locked dprint eza`
- `winget install ajeetdsouza.zoxide junegunn.fzf StephanDilly.gitui` 


## Linux

- `curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash`
- `curl --proto '=https' --tlsv1.2 -ssf https://sh.rustup.rs | sh`
- `cargo install --locked dprint gitui eza`
- `sudo apt install build-essential fzf`
