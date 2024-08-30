// Minimal value to use module (not really usefull)
settings_billing_email = "billing+github@mycompany.tld"
settings_name          = "TF Test Organization"
settings_description   = "Fake Organization to test TF provisioning"

ruleset = {
  release-tag = {
    target = "tag"
    condition = {
      ref_name = {
        include = ["~DEFAULT_BRANCH"]
      },
      repository_name = {
        include = ["~ALL"]
      }
    }
    rules = {
      update   = false
      deletion = false
      pattern = {
        operator = "regex"
        pattern  = "v*"
        name     = "Limit version 'v*' tag creation"
      }
    }
  }
}
