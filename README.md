# nvim


this repository shows my configuration in NeoVim

How install NeoVim 8+ version?

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
Step 4: open file init.vim
  ```
  nvim ~/.config/nvim/init.vim
```
Step 5: Copy all code ``` init.vim ``` or you can download ``` init.vim ```

Step 6: Press ``` ESC ``` then ``` Shift + ; ``` and write ``` wq ```

Step 7: again open init.vim --- Step 4

Step 8: Press ``` ESC ``` then ``` Shift + ; ``` and write ``` PlugInstall ```, wait...

Step 9: write ``` wq ```

