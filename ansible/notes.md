place to store notes

```
ansible <HOST_GROUP> -m ping
ansible localhost -m ping
ansible vagrant -m ping
ansible-playbook -i "localhost:2222," --user=vagrant --private-key=~/.vagrant.d/insecure_private_key playbook.yml
```

use im-config instead of im-switch to change keyboard-input-method-system.
