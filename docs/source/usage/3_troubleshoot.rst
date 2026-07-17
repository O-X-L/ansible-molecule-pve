.. _usage_troubleshoot:

.. include:: ../_include/head.rst

================
3 - Troubleshoot
================

Unclean Exit
************

It might happen that users or automated-jobs, that run molecule, get interrupted and do not cleanup their existing Test-VM's.

In that case it can make sense if you run a scheduled/cron cleanup-script on your PVE-host.

An example of such a script can be found in the examples: `example/pve-daily-molecule-cleanup.sh <https://github.com/O-X-L/ansible-molecule-pve/blob/latest/example/pve-daily-molecule-cleanup.sh>`_
