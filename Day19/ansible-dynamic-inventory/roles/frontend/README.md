Role Name
=========

Frontend role

Playbooks
----------------
task/main.yml: 
```yaml
---
- name: Install Nginx
  apt:
    name: nginx
    state: present
    update_cache: yes

- name: Ensure Nginx is running
  service:
    name: nginx
    state: started
    enabled: yes

- name: Deploy application files
  copy:
    src: index.html
    dest: /var/www/html/index.html
  notify: Restart Nginx

```
handlers/main.yml:

```yaml
---
- name: Restart Nginx
  service:
    name: nginx
    state: restarted

```

