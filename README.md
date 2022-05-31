# Git-Shortcuts

## Presentation

Git Shortcuts is a tool developped using shell scripts which facilitates commits and push on a remote Github repository.

## Features

You can add your own commit types using the gitsc.conf file

How to add a commit type:

A commit type is composed of three elements :

  - The type name,
  - The emoji associated with the name (using the gitmoji sheet),
  - A variable which can be set to add or remove and is used to determine if you are adding or deleting a file.

## Usage

gitsc [--all, .] [--help]

### Options

--all and .

Add or delete all modified and untracked files from your local repository to your remote repository.

--help

Redirect to this man page.

## Installation

1. Clone the repository in your home folder :
```
git clone https://github.com/Gradrien/Git-Shortcuts.git
```
2. Launch install.sh with root privileges
(note that root privileges are only used to install manual page)
```
./install.sh
```

3. Changes will be applied when a new terminal is opened
