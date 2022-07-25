Feature: Using hiera-eyaml-rsa
  Scenario: Creating and using RSA keys
    When I successfully run `eyaml createkeys -n rsa`
    Then the following files should exist:
      | keys/public_key.rsa.pem  |
      | keys/private_key.rsa.pem |
    When I run the following commands:
      """
      eyaml encrypt --string='Hello World!' --encrypt-method=rsa --output=string | eyaml decrypt --encrypt-method=rsa --stdin
      """
    Then the exit status should be 0
    And the stdout should contain exactly:
      """
      Hello World!
      """
