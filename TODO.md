# TODO

## Use paired repo for hosting dotfiles
- In Ansible, set up task to clone repo, e.g. github.com/geeanlooca/dotfiles
- In tasks for dotfiles, symlink the file in repository instead of copying file from /files directory of the role

This let's me edit the dotfile locally without re-running the playbook to change every minor thing