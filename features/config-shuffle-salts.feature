Feature: Refresh the salts in the wp-config.php file

  Scenario: Salts are created properly in wp-config.php when none initially exist
    Given a WP install

    When I try `wp config get AUTH_KEY --type=constant`
    Then STDERR should contain:
    """
    The constant 'AUTH_KEY' is not defined in the 'wp-config.php' file.
    """

    When I run `wp config shuffle-salts`
    Then STDOUT should contain:
    """
    Shuffled the salt keys.
    """
    And the wp-config.php file should contain:
    """
    define( 'AUTH_KEY'
    """

  @custom-config-file
  Scenario: Salts are created properly in wp-custom-config.php when none initially exist
    Given an empty directory
    And WP files

    When I run `wp core config {CORE_CONFIG_SETTINGS} --skip-salts=true --config-file='wp-custom-config.php'`
    Then STDOUT should contain:
      """
      Generated 'wp-custom-config.php' file.
      """
    When I try `wp config get AUTH_KEY --type=constant --config-file='wp-custom-config.php'`
    Then STDERR should contain:
    """
    The constant 'AUTH_KEY' is not defined in the 'wp-custom-config.php' file.
    """

    When I run `wp config shuffle-salts --config-file='wp-custom-config.php'`
    Then STDOUT should contain:
    """
    Shuffled the salt keys.
    """
    And the wp-custom-config.php file should contain:
    """
    define( 'AUTH_KEY'
    """

  Scenario: Shuffle the salts
    Given a WP install

    When I run `wp config shuffle-salts`\
    Then STDOUT should contain:
    """
    Shuffled the salt keys.
    """
    And the wp-config.php file should contain:
    """
    define( 'AUTH_KEY'
    """
    And the wp-config.php file should contain:
    """
    define( 'LOGGED_IN_SALT'
    """

    When I run `wp config get AUTH_KEY --type=constant`
    Then save STDOUT as {AUTH_KEY_ORIG}
    When I run `wp config get LOGGED_IN_SALT --type=constant`
    Then save STDOUT as {LOGGED_IN_SALT_ORIG}

    When I run `wp config shuffle-salts`
    Then STDOUT should contain:
    """
    Shuffled the salt keys.
    """
    And the wp-config.php file should not contain:
    """
    {AUTH_KEY_ORIG}
    """
    And the wp-config.php file should not contain:
    """
    {LOGGED_IN_SALT_ORIG}
    """

  @custom-config-file
  Scenario: Shuffle the salts
    Given an empty directory
    And WP files

    When I run `wp core config {CORE_CONFIG_SETTINGS} --config-file='wp-custom-config.php'`
    Then STDOUT should contain:
      """
      Generated 'wp-custom-config.php' file.
      """

    When I run `wp config shuffle-salts --config-file='wp-custom-config.php'`
    Then STDOUT should contain:
    """
    Shuffled the salt keys.
    """
    And the wp-custom-config.php file should contain:
    """
    define( 'AUTH_KEY'
    """
    And the wp-custom-config.php file should contain:
    """
    define( 'LOGGED_IN_SALT'
    """

    When I run `wp config get AUTH_KEY --type=constant --config-file='wp-custom-config.php'`
    Then save STDOUT as {AUTH_KEY_ORIG}
    When I run `wp config get LOGGED_IN_SALT --type=constant --config-file='wp-custom-config.php'`
    Then save STDOUT as {LOGGED_IN_SALT_ORIG}

    When I run `wp config shuffle-salts --config-file='wp-custom-config.php'`
    Then STDOUT should contain:
    """
    Shuffled the salt keys.
    """
    And the wp-custom-config.php file should not contain:
    """
    {AUTH_KEY_ORIG}
    """
    And the wp-custom-config.php file should not contain:
    """
    {LOGGED_IN_SALT_ORIG}
    """
