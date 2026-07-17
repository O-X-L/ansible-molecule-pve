#!/bin/bash

if [ -z "$1" ]
then
  echo 'ERROR: Supply a role to test!'
  echo ''
  echo 'USAGE:'
  echo ' 1> Role name'
  echo ' 2> Molecule test-flag (create, converge, destroy, default: test)'
  exit 1
fi

if [ -z "$2" ]
then
  MOLECULE_ARG='test'
else
  MOLECULE_ARG="$2"
fi

export MOLECULE_PROXMOX_HOST='<IP>'
export MOLECULE_PROXMOX_PORT=8006
export MOLECULE_PROXMOX_SECRETS_FILE="${HOME}/molecule_pve.txt"
export MOLECULE_PROXMOX_NODE='<NODE>'
export MOLECULE_PROXMOX_SSH_USER='<VM-USER>'
export MOLECULE_PROXMOX_SSH_IDENTITY_FILE="${HOME}/.ssh/molecule_pve_id_ed25519"
export MOLECULE_PROXMOX_SSH_PORT=22
export MOLECULE_PROXMOX_TEMPLATE='template-molecule-debian-13'
export MOLECULE_PROXMOX_POOL='ansible-molecule-vms'
MOLECULE_PROXMOX_UID="$(date '+%Y-%m-%d')"
export MOLECULE_PROXMOX_UID

cd "$(dirname "$0")"

set -euo pipefail

PATH_PB="$(pwd)"
PATH_ROLE="${PATH_PB}/roles/$1"

if [ ! -d "$PATH_ROLE" ]
then
  echo "ERROR: Role does not exist => ${PATH_ROLE}"
  exit 1
fi

cd "$PATH_ROLE"

export ANSIBLE_COLLECTIONS_PATH="${PATH_PB}/collections/"
export ANSIBLE_FILTER_PLUGINS="${PATH_PB}/filter_plugins:${PATH_ROLE}/filter_plugins"

molecule "$MOLECULE_ARG"
