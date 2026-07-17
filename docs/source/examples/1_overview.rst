.. _examples_overview:

.. include:: ../_include/head.rst

============
1 - Overview
============

For a full working example see: `Repository examples <https://github.com/O-X-L/ansible-molecule-pve/blob/latest/examples>`_

Basic
*****

.. code-block:: yaml

    driver:
      name: 'molecule-pve'
      options:
         api_host: 'pve01.example.com'
         api_port: 18006  # proxmox web-ui port
         api_user: 'ansible-molecule@pve'  # <name>@<realm>
         node: 'pve01'
         ssh_user: 'tester'
         ssh_identity_file: '/path/to/id_rsa'

         # using api-token auth (recommended)
         api_token_id: 'ansible-molecule-token1'
         api_token_secret: 'ysskadjaldnefisdflensefsesefsefsef'

         # using basic auth (not recommended)
         api_password: "********"

         # Optional:
         ssh_port: 22
         timeout: 120

         ## default-template (if not platform-specific)
         template_name: 'template-linux'

         ## Set the hostname after cloning.
         sethostname: yes

         ## Create the VMs in the pool.
         pool: test

         ## Create Linked clone instead of Full clone.
         full: false

         ## Fail "create" if another vm with the same name already exists
         enforce_unique_name: false

         ## Configure TLS-validation for API-calls
         validate_certs: false
         ca_path: '/etc/ssl/certs/ca-certificates'

    platforms:
      - name: test01
        # Optional: Specify the VM id of the clone.
        newid: 216
        template_name: 'template-linux-2'

      - name: test02
        etc_hosts:
          "server1.test.intern": "192.168.1.1"
          "app1.test.intern": "PVE:test01"  # dynamically resolved to VM-IP

----

Secrets File
************

The `proxmox_secrets` setting specifies the path to an external file with settings for the proxmox API connection, such as api_password.

If this is a regular file, it should be a yaml file with the settings to be included.

If the file is an executable, the file will be run and the stdout will be combined with the driver options.

The output of the script needs to be valid yaml consisting of dictionary keys and values (e.g. :code:`api_password: foobar`).

.. code-block:: yaml

    driver:
      name: 'molecule-pve'
      options:
         proxmox_secrets: '/path/to/proxmox_secrets.yml'
         node: 'pve01'
         ssh_user: 'tester'
         ssh_identity_file: '/path/to/id_rsa'
         template_name: 'template-linux'

    platforms:
      - name: 'test01'
      - name: 'test02'


The value of `proxmox_secrets` will be passed into `ansible.builtin.cmd`.

Therefore, any additional argument values will be passed to the script as well.

This allows you to use an external password manager to store the Proxmox API connection settings.

For example with a script:

.. code-block:: yaml

    driver:
      name: 'molecule-pve'
      options:
         debug: true
         proxmox_secrets: '/usr/local/bin/proxmox_secrets.sh'
         node: 'pve01'

.. code-block:: bash

    #!/bin/sh
    pass proxmox/pve01

Or with a file (which **must** not be executable):

.. code-block:: yaml

    driver:
      name: 'molecule-pve'
      options:
         debug: true
         proxmox_secrets: "$HOME/proxmox_secrets.yaml"
         node: 'pve01'

.. code-block:: yaml

    ---
    api_host: my-proxmox-host
    api_user: my-proxmox-user@pam

    # using api-token auth (recommended)
    api_token_id: my-api-token-id
    api_token_secret: my-api-token-secret

    # using basic auth (not recommended)
    api_password: my-secret-password
    ```

----

Cloud Init
**********

Take a look at the available options for the `community.proxmox.proxmox_kvm ansible-module <https://docs.ansible.com/projects/ansible/latest/collections/community/proxmox/proxmox_kvm_module.html>`_ - as this module is used in the background.

.. code-block:: yaml

    driver:
      name: 'molecule-pve'
      options:
         proxmox_secrets: '/path/to/proxmox_secrets.yml'
         node: 'pve01'
         ssh_user: 'tester'
         ssh_identity_file: '/path/to/id_rsa'
         template_name: 'template-linux'

    platforms:
      - name: test01
        ciuser: some_user
        cipassword: some_password
        ipconfig:
          ipconfig0: 'ip=192.168.0.2/24,gw=192.168.0.1'
        nameservers:
          - 192.169.0.245

See also: `molecule-pve - create.yml <https://github.com/O-X-L/ansible-molecule-pve/blob/latest/src/molecule_pve/playbooks/create.yml#L144>`_
