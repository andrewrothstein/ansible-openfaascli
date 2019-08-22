andrewrothstein.openfaascli
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-openfaascli.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-openfaascli)

Installs the [OpenFaas CLI](https://github.com/openfaas/faas-cli)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.openfaascli
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
