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
Create config
```
wpsite config
```
Now edit the file ".wpsiterc" in $HOME to set DB credentials.

If 'wpsite' is too long to type!
```
sudo ln -s "$HOME/bin/wpsite" "/usr/local/bin/wps"
```

Source the included completion file from your bashrc file.
```
source "$HOME/repos/wpsite/.wpsite-completion.bash"
```

## Commands

| Command        | Description |
| -------------- | -----------|
| create         | Create a new WP site. |
| backup         | Backup an existing WP site. |
| delete         | Delete an existing WP site. |
| restore        | Restore an existing WP site from backup. |
| list           | List all wpstarter-enabled sites in "$HOME/sites".|
| last           | Open the most recently created site's admin dashboard.|
| lang           | Install a new language into an existing wpstarter installation. |
| quick          | Quickly create a new WP test site without asking too much.
| update         | Apply "composer update" to the wpstarter repository. |
| admin          | Open site's admin dashboard in browser. |
| boilerplate    | Create boilerplate template backup for use with "wpsite quick" in "$HOME/backups/sites". |
| clone-repo     | Download wpstarter source repo from github. |
| fm             | Open site root directory in file manager. |
| install-plugin | Install a theme to a site and activate it. |
| install-theme  | Install a plugin to a site and activate it. |
| woo            | Do a quick WooCommerce installation with StoreFront theme.|
| settings       | Interactively change necessary WP settings that are set generically at the site installation.|
| flush-env      | Delete and rebuild .env.cached.php file of a site.|
| config         | Create .wpsiterc file in $HOME.|
| testdb         | Make a connection to DB to test user credentials stored in "$HOME/.wpsiterc".|

Some commands recognize the "last" keyword. For example `wpsite last` will
bring up the most recently created site's admin dashboard. `wpsite delete last
-y` will the delete the last site you created without confirmation.

## User credentials

Username: "usr" + sitename. For example for a site name "test1", the username
will be "usrtest1".

Password: "pss" + sitename. For example for a site name "test1", the password
will be "psstest1"".
