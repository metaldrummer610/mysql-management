mysql-management
================

A simple ruby script that makes initial DB setup with MySQL a bit easier

Installation
================

To install the dependencies for this script, run the following command:

`
bundle config build.mysql2 --srcdir=/usr/local/mysql/include
bundle install
`

Example Usage
================

The following creates a user named 'globalLaunch' with the password 'password' with access to the 'GlobalLaunch' database.

`ruby db.rb -u root -s globalLaunch -a password -d GlobalLaunch`
