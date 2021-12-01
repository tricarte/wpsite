## Introduction

A simple bash script to create WordPress test sites locally.

## Requirements

* LEMP
* [ valet-linux ](https://cpriego.github.io/valet-linux/#installation)
* git
* [ wpready3 ](https://github.com/tricarte/wpready3) See installation.

## Installation

```
git clone "https://github.com/tricarte/wpsite" "$HOME/repos/wpsite"
git clone "https://github.com/tricarte/wpready3" "$HOME/repos/wpready3"
chmod +x "$HOME/repos/wpsite/wpsite"
sudo ln -s "$HOME/repos/wpsite/wpsite" "/usr/local/bin/wpsite"
```
If 'wpsite' is too long to type!
```
sudo ln -s "$HOME/bin/wpsite" "/usr/local/bin/wps"
```

Source the included completion file from your bashrc file.
```
source "$HOME/repos/wpsite/.wpsite-completion.bash"
```

Finally open the script in your favorite text editor and edit the MySQL/MariaDB
credentials.

## Commands

| Command        | Description |
| -------------- | -----------|
| create         | Create a new WP site. |
| backup         | Backup an existing WP site. |
| delete         | Delete an existing WP site. |
| restore        | Restore an existing WP site from backup. |
| list           | List all wpstarter-enabled sites in "$HOME/sites".|
| lang           | Install a new language into an existing wpstarter installation. |
| quick          | Quickly create a new WP test site without asking too much.
| update         | Apply "composer update" to the wpstarter repository. |
| admin          | Open site's admin dashboard in browser. |
| boilerplate    | Create boilerplate template backup for use with "wpsite quick" in "$HOME/backups/sites". |
| clone-repo     | Download wpstarter source repo from github. |

## User credentials

Username: "usr" + sitename. For example for a site name "test1", the username
will be "usrtest1".

Password: "pss" + sitename. For example for a site name "test1", the password
will be "psstest1"".
