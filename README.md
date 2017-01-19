# Slippers

This is the Development environment which I am comfortable with.  Tried this a number of times and this hopefully builds on those initial attempts.  This uses Vagrant , Packer and Ansible to achieve a repeatable and fast to setup development environment.

<strong>NOTE: </strong> This project will not be using the dependency feature of Ansible roles and instead each will be encapsulated even if that means a certain level of duplication.  This way each can work in isolation, you can easily see what each requires and at runtime any dependencies which have already been installed will not be re-installed (unless something is implemented incorrectly)

## Features

### VIM 8

Installed from source

Plugins:

- NerdTree
- Jellybeans colorscheme

## Languages

### GO

If you are using VIM you still need to run `:GoInstallBinaries` from inside VIM.  Need to find a way how to do this via ansible setup.

