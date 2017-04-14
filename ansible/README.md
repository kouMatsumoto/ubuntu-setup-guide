# ansible-ubuntu-setup
Ansible Playbook to set up my development environment of Ubuntu16


```bash
$ ansible-playbook setup-local.yml -bK

# `-b (--become)`: run operations with become (does not imply password prompting)
# `-K (--ask-become-pass)`: ask for privilege escalation password 
```


# Which Vagrant Box is better to use
## Ubuntu
- [boxcutter](https://github.com/boxcutter/ubuntu)
