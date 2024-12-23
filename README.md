# Dropshipping Store Project

This project is a simple dropshipping store built using HTML, CSS, and JavaScript. It includes functionalities for users to browse products, add them to a cart, and place orders. Administrators can log in to add new products to the store.

## Table of Contents


- [Setup](#setup)
- [Install Database](#install-database)
- [Usage](#usage)


# Setup
To run this project locally, follow these steps:

## Install MairaDB
```sh
Follow the instructions to install MariaDB on your system: [MariaDB Installation Guide](https://mariadb.com/kb/en/getting-installing-and-upgrading-mariadb/)
```
### Setup-database
1. Create a `.env` file in the root directory and add your database configuration:
```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=yourpassword
DB_NAME=dropshipwebpage
```

2. Log in to the MariaDB client:
```sh
mysql -u root -p -e "CREATE DATABASE dropshipwebpage";
```

4. Import the database schema:
```sh
mysql -u root -p dropshipwebpage < ./dump.sql
```
Add additional SQL files or seed data if needed:
```sh
mysql -u root -p dropshipwebpage < ./Update_users_email.sql
mysql -u root -p dropshipwebpage < ./Update_payment_method.sql
mysql -u root -p dropshipwebpage < ./update_address_details_id_notnull.sql
mysql -u root -p dropshipwebpage < ./seed.sql
```

### Run the Project
Install dependencies:
```sh
npm install
```
Start the server:
```sh
npm start
```

## Usage
On your Windows computer, open a web browser. Enter http://localhost:3000 in the address bar.

Admins can log in on http://localhost:3000/admin.html using the username admin and password admin.

## Completed Features

| Feature | Status |
|--------------------|--------|
|Customers can see a list of products|✅|
|Administrator can log in|✅|
|Administrator can add new products|✅|