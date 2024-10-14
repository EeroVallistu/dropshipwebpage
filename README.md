# Dropshipping Store Project

This project is a simple dropshipping store built using HTML, CSS, and JavaScript. It includes functionalities for users to browse products, add them to a cart, and place orders. Administrators can log in to add new products to the store.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)


## Installation
To run this project locally, follow these steps:

Install debian12

Enter following commands in terminal
```sh
sudo apt update
sudo apt install -y nginx git
```

```sh
git clone https://github.com/EeroVallistu/dropshipwebpage.git
```
```sh
sudo mkdir -p /var/www/dropshipwebpage
```
Change YOURUSERDIRECTORY to your user directory
```sh
sudo cp -r /home/YOURUSERDIRECTORY/dropshipwebpage/* /var/www/dropshipwebpage/
sudo chown -R www-data:www-data /var/www/dropshipwebpage
sudo chmod -R 755 /var/www/dropshipwebpage
```
```sh
sudo nano /etc/nginx/sites-available/dropshipping
```
Add this to the file and change your_domain_or_ip to your domain or ip
```sh
server {
    listen 80;
    server_name your_domain_or_ip;

    root /var/www/dropshipwebpage;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```
```sh
sudo ln -s /etc/nginx/sites-available/dropshipping /etc/nginx/sites-enabled/
sudo systemctl restart nginx
```

## Usage
 
On your Windows computer, open a web browser.
Enter the IP address of your Debian server in the address bar (e.g., http://your_server_ip).

Admins can log in using the username admin and password admin to add new products.