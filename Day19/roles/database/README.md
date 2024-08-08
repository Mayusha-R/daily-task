Role Name
=========

Database Role

Playbooks
----------------

task/main.yml:

```yaml
---
- name: Installing Mysql
  apt:
    name:
      - mysql-server
      - mysql-client
      - python3-mysqldb
      - libmysqlclient-dev
    state: present
    update_cache: yes

- name: Enabling MySQL service
  service:
    name: mysql
    state: started
    enabled: yes

- name: Create MySQL user
  mysql_user:
    name: "{{ user_name }}"
    password: "{{ user_password }}"
    priv: '*.*:ALL'
    state: present

- name: Create MySQL database
  mysql_db:
    name: "{{ db_name }}"
    state: present

```

