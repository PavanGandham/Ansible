# Ansible variables types and valid/invalid variable names.
- Ansible has strict set of rules in variable names. it only allows letters,numbers and underscores and must start with a letter or underscore.
- Some strings are reserverd for some other purposes and aren't valid names for variables such as Python keywords and Ansible keywords.
- Some example python keywords 

| **Python**  | **Keywords**       |
|:-----------:|:------------------:|
| False       | for                |
| await       | lambda             |
| else        | try                |
| import      | as                 |
| pass        | def                |
| None        | from               |
| break       | nonlocal           |
| except      | while              |
| in          | assert             |
| raise       | del                |
| True        | global             |
| class       | not                |
| finally     | with               |
| is          | async              |
| return      | elif               |
| and         | if                 |
| continue    | or, yield          |

| **Ansible**           | **Keywords**        | ****               | ****                          |
|:---------------------:|:-------------------:|:------------------:|:-----------------------------:|
| **Play**              | **Role**            | **Block**          | **Task**                      |
| any_errors_fatal      | any_errors_fatal    | always             | action                        |
| hosts                 | become              | any_errors_fatal   | any_errors_fatal              |
| become                | become_exe          | become             | args                          |
| ignore_errors         | become_flags        | become_exe         | async                         |
| become_exe            | become_method       | become_flags       | become                        |
| ignore_unreachable    | become_user         | become_method      | become_exe                    |
| become_flags          | check_mode          | become_user        | become_flags                  |
| max_fail_percentage   | collections         | block              | become_method                 |
| become_method         | connection          | check_mode         | become_user                   |
| module_defaults       | debugger            | collections        | changed_when                  |
| become_user           | delegate_facts      | connection         | check_mode                    |
| name                  | delegate_to         | debugger           | collections                   |
| check_mode            | diff                | delegate_facts     | connection                    |
| no_log                | environment         | delegate_to        | debugger                      |
| collections           | ignore_errors       | diff               | delay                         |
| order                 | ignore_unreachable  | environment        | delegate_facts                |
| connection            | module_defaults     | ignore_errors      | delegate_to                   |
| port                  | name                | ignore_unreachable | diff                          |
| debugger              | no_log              | module_defaults    | environment                   |
| post_tasks            | port                | name               | failed_when                   |
| diff                  | remote_user         | no_log             | ignore_errors                 |
| pre_tasks             | run_once            | notify             | ignore_unreachable            |
| environment           | tags                | port               | local_action                  |
| remote_user           | throttle            | remote_user        | loop                          |
| fact_path             | timeout             | rescue             | loop_control                  |
| roles                 | vars                | run_once           | module_defaults               |
| force_handlers        | when                | tags               | name                          |
| run_once              |                     | throttle           | no_log                        |
| gather_facts          |                     | timeout            | notify                        |
| serial                |                     | vars               | poll                          |
| gather_subset         |                     | when               | port                          |
| strategy              |                     |                    | register                      |
| gather_timeout        |                     |                    | remote_user                   |
| tags                  |                     |                    | retries                       |
| handlers              |                     |                    | run_once                      |
| tasks                 |                     |                    | tags                          |
| throttl               |                     |                    | throttle                      |
| timeout               |                     |                    | timeout                       |
| vars                  |                     |                    | until                         |
| vars_files            |                     |                    | vars                          |
| vars_prompt           |                     |                    | when , with_<lookup_plugin>   |

- For any programming or configuration language the variable name must be short and meaningful.
     - Good variable names:
        - web_server_port
        - db_connection_timeout
        - ssh_private_key
        - max_retry_attempts
    - Bad variable names:
        - my_var (valid but creates confusion sometimes)
        - tm@p%$2
        - 1var
- Types of variables in Ansible
    1. **Playbook variables**
    `– These variables are used to pass values into playbooks and roles and can be defined inline in playbooks or included in external files`

    2. Task variables
    `– These variables are specific to individual tasks within a playbook. These can override other variable types for the scope of the task in which they are defined.`

    3. Host variables
    `- Specific to hosts, these variables are defined in the inventory or loaded from external files or scripts and can be used to set attributes that differ between hosts.`
    
    4. Group variables
    `– Similar to host variables but used for a group of hosts and are defined in the inventory or separate files in the group_vars directory.`

    5. Inventory variables
    `– These variables are defined in the inventory file itself and can be applied at different levels (host, group, all groups).`
    
    6. Fact variables
    `– Gathered by Ansible from the target machines, facts are a rich set of variables (including IP addresses, operating system, disk space, etc.) that represent the current state of the system and are automatically discovered by Ansible.`

    7. Role variables
    ` – Defined within a role, these variables are usually part of the role’s default variables (defaults/main.yaml file) or variables intended to be set by the role user (vars/main.yaml file) and are used to enable reusable and configurable roles.`

    8. Extra variables
    `– Passed to Ansible at runtime using the -e or –extra-vars command-line option. They have the highest precedence and can be used to override other variables or to pass data that might change between executions.`

    9. Magic variables
    `– Special variables such as hostvars, group_names, groups, inventory_hostname, and ansible_playbook_python, provide information about the execution context and allow access to inventory data programmatically.`

    10. Environment variables
    `–  Used within Ansible playbooks to access environment variables from the system running the playbook or from remote systems.`


