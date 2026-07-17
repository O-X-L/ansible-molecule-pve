.. _usage_setup:

.. include:: ../_include/head.rst

=========
2 - Setup
=========

PVE API User
************

You might want to create two VM-pools in :code:`Datacenter - Permissions - Pools`:

* :code:`ansible-molecule-templates` - move the source-templates for your tests in this pool
* :code:`ansible-molecule-vms` - the dynamically created can be created in this pool (*don't forget to set the* :code:`pool` *option*)

You have to create a PVE-user in :code:`Datacenter - Permissions - Users`.

Give the user these permissions:

* :code:`/pools/ansible-molecule-templates - PVETemplateUser`
* :code:`/pools/ansible-molecule-vms - PVEAdmin`
* :code:`/sdn/zones/localnetwork - SDNUse`
* :code:`/storage/? - PVEDatastoreUser` (*replace '?' by the datastore you have placed your templates on*)

Create an API-token in :code:`Datacenter - Permissions - API Tokens` and make sure to disable :code:`Privilege separation`.


PVE VM Template
***************

The molecule instances are created by cloning Proxmox virtual machine templates.

You will need to create one or more templates.

**Required:**

* Python installed for Ansible
* :code:`qemu-guest-agent` installed and enabled in the PVE-VM-Options
* SSH server installed & enabled
* User account for Ansible-Molecule
* An SSH public key must be added to the :code:`$HOME/.ssh/authorized_keys` for the Ansible-Molecule user account
* If the Ansible-Molecule user is not :code:`root`:

  Install :code:`sudo` and give that user sudo-permissions

  :code:`usermod -a -G sudo ansible-molecule`


**Optional:**

* A cloud-init drive if any cloud-init settings are used
* Network configuration (*if not using DHCP*)


