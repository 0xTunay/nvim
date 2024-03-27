# nvim


this repository shows my configuration in NeoVim

<h1>How install NeoVim 8+ version?</h1>

Setep 0: you need uninstall any neovim you might have installe
~~~ 
  sudo apt remove neovim -y
~~~ 
Step 1: Download the appimage from https://github.com/neovim/neovim/releases

Step 2: Make it executable with
  ```
   +x neovim.appimage
  ```
Step 3: Place it in you $PATH 
  ```
    sudo mv neovim.appimage /urs/local/nvim
```
<h1>Copy init.vim</h1>

Step 0: open file init.vim
  ```
  nvim ~/.config/nvim/init.vim
```
Step 1: Copy all code ``` init.vim ``` or you can download ``` init.vim ```

Step 2: Press ``` ESC ``` then ``` Shift + ; ``` and write ``` wq ```

Step 3: again open init.vim --- Step 4

Step 4: Press ``` ESC ``` then ``` Shift + ; ``` and write ``` PlugInstall ```, wait...

Step 5: write ``` wq ```

to install coc, then write CocInstall coc-cland


for Clang 
```

CocInstall coc-clangd
```
