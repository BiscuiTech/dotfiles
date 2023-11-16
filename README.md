Repo largely inspired by https://github.com/bartdorsey/dotfiles

## Post-install
Need to manually install these tools. Will probly need to automate all this, but for now let's keep it simple.
1. npm tools: `npm install -g @microsoft/inshellisense eslint prettier vscode-langservers-extracted typescript-language-server`
2. Rust: 
  2.1. Windows: [Windows installer](https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe)
  2.2. Bash: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
3. dprint: `cargo install --locked dprint`
4. gitui: `cargo install gitui`
