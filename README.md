# wordpress-ubuntu-install
This repository contains a bash script that automates the installation of WordPress on Ubuntu 22.04

# Automated WordPress Installation

This bash script automates the installation of WordPress on Ubuntu 22.04, including necessary dependencies, database setup, and basic configuration.

## Features

- Installs Apache, PHP, MySQL, and required PHP extensions.
- Configures MySQL securely and creates a WordPress database and user.
- Downloads and extracts the latest WordPress version.
- Sets up an Apache VirtualHost for WordPress.
- Configures WordPress settings in `wp-config.php`
- Provides the server IP for easy access to the new WordPress site.

### Recommended Hardware Requirements for Virtual machine
- **50GB SSD**
- **4GB RAM**.
- **2 vCPUs**.

## Usage

## How to Use

1. **Update the system & clone the Repository**  
   Download the script to your system or clone the repository:
   ```bash
   apt update && apt upgrade
   
   git clone https://github.com/eugeniogiusti/wordpress-ubuntu-install.git
   
   cd wordpress-ubuntu-install


2. Grant Execution Permissions
Give the script executable permissions:
   ```bash
   chmod +x wordpress-ubuntu-install.sh


3. Run the Script &
Switch to the root user if you don't want to enter the password during the process:
   ```bash
   sudo su
   ./wordpress-ubuntu-install.sh

4. After the script completes, visit your local IP address to finish the WordPress setup.

![image](https://github.com/user-attachments/assets/13956f7b-e419-42e9-a07d-1bbbba4b95c4)


![image](https://github.com/user-attachments/assets/e67d9e09-8332-4e9f-b88b-d8db4491a557)


![image](https://github.com/user-attachments/assets/8801511b-42c5-4c25-bfed-972bf5a75ef1)


![image](https://github.com/user-attachments/assets/00a7e62c-c4ea-4801-84a5-7eb1959867d8)


![image](https://github.com/user-attachments/assets/f2dd46bb-e551-48a7-9dd9-be732c9668fb)




## Configuration

- The WordPress database name, user, and password are set in the script. Modify them as needed.
- The Apache VirtualHost is configured with `example.com`. Replace it with your domain.

## Notes

- This script is intended for fresh Ubuntu 22.04 installations.
- During the installation of some libraries, you might see a message like:
Daemons using outdated libraries. Which services should be restarted?(screenshoot below)"

This message indicates that some libraries have been updated, but the daemons using them
are still running with the previous version loaded in memory. It is not necessary to
restart the services immediately, as the system will continue to function normally with
the old libraries.
To proceed:
1. Press the TAB key to select "OK" and confirm.
2. Continue with the installation without restarting the services.
If you encounter any issues or instability later, try restarting the virtual machine to
ensure the services use the latest versions of the libraries.

![image](https://github.com/user-attachments/assets/afe683b8-2d5b-4327-b68d-29ed46a784c2)

Enjoy your Wordpress
