// Minimal value to use module (not really usefull)
settings_billing_email = "billing+github@mycompany.tld"
settings_name          = "TF Test Organization"
settings_description   = "Fake Organization to test TF provisioning"

ruleset = {
  default-branch = {
    target = "branch"
    condition = {
      ref_name = {
        include = ["~DEFAULT_BRANCH"]
        exclude = []
      },
      repository_name = {
        include = ["~ALL"]
        exclude = []
      }
    }
    rules = {
      creation = false
      deletion = false
      pull_request = {
        required_approving_review_count = 1
      }
    }
  }
}
