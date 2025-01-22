# Install deps

 - vim - https://itsfoss.com/vim-8-release-install/
```
  sudo add-apt-repository ppa:jonathonf/vim
  sudo apt update
  sudo apt install vim
```

 - neovim
 ```
 sudo snap install --beta nvim --classic
 ```
 - Create neovim config - ~/.config/nvim/init.vim
 - Share .vimrc between vim and neovim - https://neovim.io/doc/user/nvim.html#nvim-from-vim

 - Search with fzf - https://pragmaticpineapple.com/improving-vim-workflow-with-fzf/

 - Install RipGrep - https://github.com/BurntSushi/ripgrep
 ```
 snap install ripgrep --classic
 ```

# Python Virtual Environment
Alternative: Virtual Environment (Optional but Recommended)
For better dependency management, you can use a Python virtual environment:

Create a Virtual Environment:

```bash
python3 -m venv ~/.config/nvim/venv
```
Activate the Virtual Environment:

```bash
source ~/.config/nvim/venv/bin/activate
```

Install pynvim in the Virtual Environment:

```bash
pip install pynvim

```

Configure Neovim: Add this line to your init.vim or init.lua to point Neovim to the virtual environment:

```vim
let g:python3_host_prog = '~/.config/nvim/venv/bin/python'
```

