# Ansible-Molecule Proxmox-VE Driver

[![Lint](https://github.com/O-X-L/ansible-molecule-pve/actions/workflows/lint.yml/badge.svg?branch=latest)](https://github.com/O-X-L/ansible-molecule-pve/actions/workflows/lint.yml)
[![Check Docs](https://github.com/O-X-L/ansible-molecule-pve/actions/workflows/check_docs.yml/badge.svg?branch=latest)](https://github.com/O-X-L/ansible-molecule-pve/actions/workflows/check_docs.yml)


This repository holds an Ansible-Molecule driver for Proxmox-VE.

It enables you to dynamically create VM's on latest Proxmox-VE nodes and target them with integration-tests. 

----

## Install

[PyPi](https://pypi.org/project/molecule-pve/)

First, you have to install these ansible-collections:

```bash
ansible-galaxy collection install community.proxmox>=2.0.0
ansible-galaxy collection install oxlorg.molecule_pve

# or
ansible-galaxy collection install git+https://github.com/ansible-collections/community.proxmox.git,2.0.0
ansible-galaxy collection install git+https://github.com/O-X-L/ansible-molecule-pve-utils.git
```

Then you can install the molecule driver itself:

```bash
pip install --upgrade molecule-pve

# or
pip install --upgrade git+https://github.com/O-X-L/ansible-molecule-pve
```

----

## Documentation

[![Docs Uptime](https://status.oxl.at/api/v1/endpoints/1--oxl_ansible-molecule-pve-docs/uptimes/30d/badge.svg)](https://status.oxl.at/endpoints/1--oxl_ansible-molecule-pve-docs)

See: [ansible-molecule-pve.oxl.app](https://ansible-molecule-pve.oxl.app)

----

## Contribute

You are welcome to [report issues/bugs](https://github.com/O-X-L/ansible-molecule-pve-utils/issues) and/or [supply patches/features drafts](https://github.com/O-X-L/ansible-molecule-pve-utils/pulls).

When contributing via PR's, please mention if/how you used AI and if so - how you reviewed/tested those auto-generated changes.

----

## Authors / Credits

This is a fork or the [molecule-proxmox](http://pypi.org/project/molecule-proxmox), which was originally created by [Michael Meffie](https://github.com/meffie).

It was modified and enhanced by [Pascal Rath](https://github.com/superstes).

We decided to create this fork, as the original module is not in a functional state with current default ansible-installations.

So we refactored it to make it work with the currently supported [community.proxmox](https://docs.ansible.com/projects/ansible/latest/collections/community/proxmox/index.html) Ansible-collection.

We also implemented some enhancements:

* async/parallel creation/start/destroy of Test-VMs to speed-up execution
* support form platform-specific `/etc/hosts` entries
* some config-sanity checks

----

## AI Usage

AI is used to speed-up development. All changes are reviewed, logically evaluated and tested manually.
