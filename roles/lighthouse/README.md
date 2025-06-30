lighthouse
=========

This role can install and configure Lighthouse

Requirements
------------



Role Variables
--------------



Dependencies
------------

none

Example Playbook
----------------

---
- name: NGINX | Install epel-release
  become: true
  ansible.builtin.yum:
    name: epel-release
    state: present
- name: NGINX | Install NGINX
  become: true
  ansible.builtin.yum:
    name: nginx
    state: present
  notify: Start-nginx
- name: NGINX | Create general config
  become: true
  ansible.builtin.template:
    src: templates/nginx.conf.j2
    dest: /etc/nginx/nginx.conf
    mode: "0644"
  notify: Reload-nginx

- name: Lighthouse| install dependencies
  become: true
  ansible.builtin.yum:
    name: git
    state: present

- name: Lighthouse | Copy from git
  ansible.builtin.git:
    repo: "{{ lighthouse_vcs }}"
    version: master
    dest: "{{ lighthous_local_dir }}"
- name: Lighthouse | Create ligthouse config
  become: true
  ansible.builtin.template:
    src: lighthouse_nginx.conf.j2
    dest: /etc/nginx/conf.d/defult.conf
    mode: "0644"
  notify: Reload-nginx

License
-------

MIT

Author Information
------------------

Mikhail Bladurin for Netology