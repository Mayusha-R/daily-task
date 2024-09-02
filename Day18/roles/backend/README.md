Role Name
=========

Backend Role

Dependencies
------------

Added in meta/main.yml:

```yaml
dependencies:
  - role: database
```

Playbooks
----------------

task/main.yml:

```yaml
---
- name: Install dependencies
  apt:
    name: 
      - apt-transport-https
      - ca-certificates
      - curl
      - software-properties-common
    state: present
    update_cache: yes

- name: Add Node.js GPG key
  apt_key:
    url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
    state: present

- name: Add Node.js repository
  apt_repository:
    repo: deb https://deb.nodesource.com/node_16.x focal main
    state: present
    update_cache: yes

- name: Install Node.js
  apt:
    name: nodejs
    state: present
    
```
