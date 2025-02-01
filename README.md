# Icecast.automation
IaC for deploying [Icecast](https://icecast.org/)

## Prerequisites

1. A DigitalOcean account.

    The terraform provisioning was written for the DigitalOcean provider, because it's cheap and easy to get started with. You'll either need a digitalocean account, or you'll need to adjust the terraform setup.

2. Your DigitalOcean API token as variable in your terminal session

    ``` bash
    export DO_PAT="person access token here"
    ```

3. Terraform installed on your local machine. 
4. Ansible installed on your local machine
  
## Setup

1. Clone project

    ``` bash
    git clone git@github.com:alex-thorne/icecast.automation.git ~/icecast-automation
    cd ~/icecast-automation
    ```

## Deploy:

1. Run terraform plan:

    ``` bash
    terraform plan \
      -var "do_token=${DO_PAT}" \
      -var "pvt_key=$HOME/.ssh/do_rsa"
    ```

2. Run terraform apply to provision icecast and nginx droplets

    ``` bash
    terraform apply \
      -var "do_token=${DO_PAT}" \
      -var "pvt_key=$HOME/.ssh/do_rsa"
    ```

3. Deploy ansible playbook to install and configure icecast and nginx services on their respective hosts:

    ```  bash
    cd ../ansible
    ansible-playbook playbook.yml --check
    ```

4. Connect. Note: no mountpoint will be available until you begin a broadcast stream on icecast once a stream is active, connect in browser via: http://<nginxip>:8000/live

## Troubleshooting:

- check that icecast is running via: http://<icecastip>:8000/status.xsl
- check if you can hit the icecast server from the nginx server via `curl http://<icecastip>:8000`
- check icecast error logs on icecast server via `sudo cat /var/log/icecast2/error.log`
- check that icecast is listening  for traffic via `root@icecast:~# ss -tulnp | grep icecast`. Output should be:
    ``` bash
    tcp     LISTEN   0        5                0.0.0.0:8000          0.0.0.0:*       users:(("icecast2",pid=2934,fd=4)) 
    ```



### Notes:

If deploy any later changes via ansible, remember to run terraform apply before running the Ansible playbook to ensure the inventory file is up to date with the latest IP addresses.

### TODO
[] improve README.md