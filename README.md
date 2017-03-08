Ansible Role: WebGME
====================

Installs [WebGME](https://webgme.org) - [Webgme Github](https://github.com/webgme/webgme).

Requirements
------------

This role supports **only Ubuntu Linux**. Feel free to extend it to other platforms.

Role Variables
--------------

#### Default variables:

**MongoDB**:

*   `mongodb_conf_bind_ip` - Bind ip for mongodb
*   `mongodb_conf_dbpath` - Path to DB data files
*   `mongodb_conf_port` - Mongo port
*   `mongodb_user` - Mongo user
*   `mongodb_version` - Version

**WebGME**:

*   `webgme_app_name` - Name of the application
*   `webgme_node_version` - Node.js version to use
*   `webgme_nvm_version` - nvm version to use


#### Playbook variables:

*   `webgme_flavor.git_repo_url` - The URL for the git repository where the flavor code resides
*   `webgme_flavor.git_repo_branch` - Which branch to clone
*   `webgme_flavor.git_repo_key` _[optional]_ - The path to the private key (on local machine, it is copied to remote host)

**IMPORTANT:** In case you use `webgme_flavor.git_repo_key` it must **NOT** have a passphrase, otherwise won't work.


Dependencies
------------

*   `geerlingguy.git` [github](https://github.com/geerlingguy/ansible-role-git) | [galaxy](https://galaxy.ansible.com/geerlingguy/git/)
*   `leonidas.nvm` [github](https://github.com/leonidas/ansible-nvm) | [galaxy](https://galaxy.ansible.com/leonidas/nvm/)
*   `Stouts.mongodb` [github](https://github.com/Stouts/Stouts.mongodb) | [galaxy](https://galaxy.ansible.com/Stouts/mongodb/)

Example Playbook
----------------

An example playbook that installs all dependencies and starts running the `finite-state-machine` flavor:

```ansible
- hosts: all
  roles:
    - role: ansible-role-webgme
      vars:
        webgme_flavor:
            git_repo_url: "https://github.com/webgme/finite-state-machine.git"
            git_repo_branch: HEAD
```

License
-------

MIT

Author Information
------------------

[https://github.com/sperka](https://github.com/sperka)
