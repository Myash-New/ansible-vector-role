vector
=========

This role installs and configures Vector, a high-performance observability data pipeline. It downloads the specified version of the Vector binary, configures it with the provided configuration template, and ensures it runs as a system service.

Requirements
------------

- The target system must have a compatible version of the operating system (e.g., CentOS 7, Ubuntu, etc.).
- The `vector_version` variable must be specified (default is `latest`).
- The `vector_config_path` variable should point to the location where the configuration file should be placed.

Role Variables
--------------

- `vector_version`: Defines the version of Vector to install (default is `latest`).
- `vector_config_path`: Path where the configuration file will be placed (default is `/opt/vector/config/vector.toml`).

Dependencies
------------

none

Example Playbook
----------------

---
- name: Install and configure Vector  
  hosts: your's hostname  
  become: true  
  roles:  
    - { role: vector, vector_version: "latest", vector_config_path: "/opt/vector/config/vector.toml" }

if you use req.yml

- name: Install and configure Vector  
  hosts: your's hostname  
  gather_facts: true  
  roles:  
    - vector


License
-------

MIT

Author Information
------------------

Mikhail Bladurin for Netology


