# ansible-bootstrap

Install `ansible` (Arch)
```bash
sudo pacman -S ansible 
```

```bash
ansible-galaxy install -r requirements.yml
ansible-playbook -i hosts.yml -u gianluca playbook.yml
```