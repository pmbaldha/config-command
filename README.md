wp-cli/config-command
=====================

Manage the wp-config.php file.

[![Build Status](https://travis-ci.org/wp-cli/config-command.svg?branch=master)](https://travis-ci.org/wp-cli/config-command)

Quick links: [Using](#using) | [Installing](#installing) | [Contributing](#contributing)

## Using

This package implements the following commands:

### wp config

Manage the wp-config.php file

~~~
wp config
~~~





### wp config create

Generate a wp-config.php file.

~~~
wp config create --dbname=<dbname> --dbuser=<dbuser> [--dbpass=<dbpass>] [--dbhost=<dbhost>] [--dbprefix=<dbprefix>] [--dbcharset=<dbcharset>] [--dbcollate=<dbcollate>] [--locale=<locale>] [--extra-php] [--skip-salts] [--skip-check] [--force]
~~~

Creates a new wp-config.php with database constants, and verifies that
the database constants are correct.

**OPTIONS**

	--dbname=<dbname>
		Set the database name.

	--dbuser=<dbuser>
		Set the database user.

	[--dbpass=<dbpass>]
		Set the database user password.

	[--dbhost=<dbhost>]
		Set the database host.
		---
		default: localhost
		---

	[--dbprefix=<dbprefix>]
		Set the database table prefix.
		---
		default: wp_
		---

	[--dbcharset=<dbcharset>]
		Set the database charset.
		---
		default: utf8
		---

	[--dbcollate=<dbcollate>]
		Set the database collation.
		---
		default:
		---

	[--locale=<locale>]
		Set the WPLANG constant. Defaults to $wp_local_package variable.

	[--extra-php]
		If set, the command copies additional PHP code into wp-config.php from STDIN.

	[--skip-salts]
		If set, keys and salts won't be generated, but should instead be passed via `--extra-php`.

	[--skip-check]
		If set, the database connection is not checked.

	[--force]
		Overwrites existing files, if present.

**EXAMPLES**

    # Standard wp-config.php file
    $ wp core config --dbname=testing --dbuser=wp --dbpass=securepswd --locale=ro_RO
    Success: Generated 'wp-config.php' file.

    # Enable WP_DEBUG and WP_DEBUG_LOG
    $ wp core config --dbname=testing --dbuser=wp --dbpass=securepswd --extra-php <<PHP
    $ define( 'WP_DEBUG', true );
    $ define( 'WP_DEBUG_LOG', true );
    $ PHP
    Success: Generated 'wp-config.php' file.

    # Avoid disclosing password to bash history by reading from password.txt
    $ wp core config --dbname=testing --dbuser=wp --prompt=dbpass < password.txt
    Success: Generated 'wp-config.php' file.

## Installing

Installing this package requires WP-CLI v0.23.0 or greater. Update to the latest stable release with `wp cli update`.

Once you've done so, you can install this package with `wp package install wp-cli/config-command`.

## Contributing

We appreciate you taking the initiative to contribute to this project.

Contributing isn’t limited to just code. We encourage you to contribute in the way that best fits your abilities, by writing tutorials, giving a demo at your local meetup, helping other users with their support questions, or revising our documentation.

### Reporting a bug

Think you’ve found a bug? We’d love for you to help us get it fixed.

Before you create a new issue, you should [search existing issues](https://github.com/wp-cli/config-command/issues?q=label%3Abug%20) to see if there’s an existing resolution to it, or if it’s already been fixed in a newer version.

Once you’ve done a bit of searching and discovered there isn’t an open or fixed issue for your bug, please [create a new issue](https://github.com/wp-cli/config-command/issues/new) with the following:

1. What you were doing (e.g. "When I run `wp post list`").
2. What you saw (e.g. "I see a fatal about a class being undefined.").
3. What you expected to see (e.g. "I expected to see the list of posts.")

Include as much detail as you can, and clear steps to reproduce if possible.

### Creating a pull request

Want to contribute a new feature? Please first [open a new issue](https://github.com/wp-cli/config-command/issues/new) to discuss whether the feature is a good fit for the project.

Once you've decided to commit the time to seeing your pull request through, please follow our guidelines for creating a pull request to make sure it's a pleasant experience:

1. Create a feature branch for each contribution.
2. Submit your pull request early for feedback.
3. Include functional tests with your changes. [Read the WP-CLI documentation](https://wp-cli.org/docs/pull-requests/#functional-tests) for an introduction.
4. Follow the [WordPress Coding Standards](http://make.wordpress.org/core/handbook/coding-standards/).


*This README.md is generated dynamically from the project's codebase using `wp scaffold package-readme` ([doc](https://github.com/wp-cli/scaffold-package-command#wp-scaffold-package-readme)). To suggest changes, please submit a pull request against the corresponding part of the codebase.*
