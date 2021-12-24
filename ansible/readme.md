Ansible is basically automation tool that helps us maintain some state on all the nodes


### parts of ansible

- playbooks : these are shell scripts on steroids.
- plays : commands that are run on the nodes
- hostfile : this is basically your inventory file that contains all the nodes that will be deployed/the playbooks will be run on
- config file : basically configures how the ansible stuff runs on

- folders:
  there are certain folders that the ansible runtime looks for certain files
  - files: this folder contains files that are available to your play during runtime
  - vars: this folder contains the variables that can be accessed during runtime. It is usually the practice to put all the variable files vault encrypted or open




