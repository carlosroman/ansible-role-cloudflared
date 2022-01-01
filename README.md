# Ansible Role: cloudflared

[![CI](https://github.com/carlosroman/ansible-role-cloudflared/workflows/CI/badge.svg?event=push)](https://github.com/carlosroman/ansible-role-cloudflared/actions?query=workflow%3ACI)

Installs [cloudflared](https://github.com/cloudflare/cloudflared) on RHEL/CentOS or Debian/Ubuntu servers.

## Requirements

No special requirements; note that this role requires root access, so either run it in a playbook with a global `become: yes`, or invoke the role in your playbook like:

    - hosts: server
      roles:
        - role: carlosroman.cloudflared
          become: yes

## Dependencies

None.

## Example Playbook

    - hosts: server
      become: yes
      vars_files:
        - vars/main.yml
      roles:
        - carlosroman.cloudflared

## License

MIT
