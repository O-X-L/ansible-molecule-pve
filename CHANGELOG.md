# Changelog

## 1.0.0

* Refactoring to make the driver work with the currently supported [community.proxmox](https://docs.ansible.com/projects/ansible/latest/collections/community/proxmox/index.html) Ansible-collection
* Async/parallel creation/start/destroy of Test-VMs to speed-up execution
* Support form platform-specific `/etc/hosts` entries
* Some config-sanity checks

----

## Time of Forking

This is a fork fo the [molecule-proxmox](http://pypi.org/project/molecule-proxmox) module, which was originally created by [Michael Meffie](https://github.com/meffie).
