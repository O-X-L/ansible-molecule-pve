.. _usage_install:

.. include:: ../_include/head.rst

================
1 - Installation
================


Ansible
*******

See `the documentation <https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#pip-install>`_ on how to install Ansible.

Dependencies
************

.. code-block:: bash

    ansible-galaxy collection install community.proxmox>=2.0.0
    ansible-galaxy collection install oxlorg.molecule_pve

    # or
    ansible-galaxy collection install git+https://github.com/ansible-collections/community.proxmox.git,2.0.0
    ansible-galaxy collection install git+https://github.com/O-X-L/ansible-molecule-pve-utils.git


Molecule Driver
***************

.. code-block:: bash

    pip install --upgrade molecule-pve

    # or
    pip install --upgrade git+https://github.com/O-X-L/ansible-molecule-pve
