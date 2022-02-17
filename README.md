# Git-Shortcuts

## Features
Git commands shortcuts


| Shortcut Name | Description | Usage |
| ------------- | ----------- | ----- |
|  gad  | Add your file on your repository with the following message : [ADD] --> MESSAGE | gad FILENAME      |
|  gadall  | Add all modified files on your repository with the following message : [ADD] --> MESSAGE | gadall    |
|  gmo  | Modify your file on your repository with a custom message : [MODIFY] --> MESSAGE | gmo FILENAME |
|  grem  | Remove your file from your repository with the following message : [REMOVE] --> MESSAAGE | grem FILENAME | 
| gcos | Modify your file in your repository when a coding style error is changed : [COD.STY] --> MESSAGE | gcos FILENAME |
| gcus | Modify your file in your repository with a custom change name and a custom message : [CUSTOM_CHANGE] --> MESSAGE | gcus FLENAME |
| gha | Modify your file in your repository when a new functionality is handled : [HANDLE] --> MESSAGE now handled | gha FILENAME |
| gfi | Modify your file in your repository when a funtionnality is fixed : [FIX] --> MESSAGE | gfi FILENAME |
| gin | Usefull when you have a potential include folder in your repository : [INCLUDE] --> MESSAGE | gin FILENAME |
| glib | Usefull when you have a library folder in your repository : [LIB] --> MESSAGE | glib FILENAME |
| gut | Usefull when you have a tests folder in your repository : [UNIT.TESTS] --> MESSAGE | gut FILENAME |
| githelp | Redirect to this page | githelp |

You must push your work to apply your changes

## Usage

### Example using gad :
```
"gad" "Filename" [Filename]

Do you want to commit your changes ? [Yy] or [Nn] : " [Type your response here]
```
If yes :
```
"Enter your commit message: " [Type your message]
```
If no or no reponse :
```
"No message entered"
```
```
"Do you want to push your changes ? [Yy] or [Nn] : " [Type your response here]
```
If yes commits will be pushed else nothing will be pushed.

## Installation

1. Clone the repository in your home folder :
```
git clone https://github.com/Gradrien/Git-Shortcuts.git
```
2. Allow your environment to execute Git-Shortcuts :
  - In bash :
   Open your .bashrc file
   ```
   nano .bashrc
   ```
   Add a path to the folder Git-Shortcuts
   
   It must look like this :
  ```
  # User specific environment
  if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$PATH:$HOME/Git-Shortcuts:" ]]
  then
      PATH="$HOME/.local/bin:$HOME/bin:$PATH:$HOME/Git-Shortcuts:"
  fi
  export PATH
  ```
  - In zsh :
  Open your .zshrc file
  ```
  nano .zshrc
  ```
  At the beginning of the file you should find something like this :
  
  ```
  # If you come from bash you might have to change your $PATH.
  export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/Git-Shortcuts:
  ```
  Add the path to the folder Git-Shortcuts
  
  Then copy the following instructions into your .zshrc file. It allows your environment to execute Git-Shortcuts from everywere :

```
# User specific environment
#if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$PATH:$HOME/Git-Shortcuts:" ]]
#then
 #   PATH="$HOME/.local/bin:$HOME/bin:$PATH:$HOME/Git-Shortcuts:"
#fi
#export PATH
``` 
3. Changes will be applied when a new terminal is opened
