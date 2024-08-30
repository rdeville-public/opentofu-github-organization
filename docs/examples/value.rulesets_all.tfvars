# Minimal value to use module (not really usefull)
settings_billing_email = "billing+github@mycompany.tld"
settings_name          = "TF Test Organization"
settings_description   = "Fake Organization to test TF provisioning"

ruleset = {
  default-branch = {
    target = "branch"
    condition = {
      ref_name = {
        include = ["~DEFAULT_BRANCH"]
      },
      repository_name = {
        include = ["~ALL"]
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
  any-other-branch = {
    target = "branch"
    condition = {
      ref_name = {
        include = ["~ALL"]
      },
      repository_name = {
        include = ["~ALL"]
      }
    }
    rules = {
      pull_request = {
        required_approving_review_count = 1
      }
      commit_author_email_pattern = {
        name     = "Author should be @mycompany.tld"
        operator = "ends_with"
        pattern  = "@mycompany.tld"
      }
      committer_email_pattern = {
        name     = "Commiter should be @mycompany.tld"
        operator = "ends_with"
        pattern  = "@mycompany.tld"
      }
    }
  }
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
      name_pattern = {
        operator = "regex"
        pattern  = "v*"
        name     = "Limit version 'v*' tag creation"
      }
      commit_author_email_pattern = {
        name     = "Author should be @mycompany.tld"
        operator = "ends_with"
        pattern  = "@mycompany.tld"
      }
      committer_email_pattern = {
        name     = "Commiter should be @mycompany.tld"
        operator = "ends_with"
        pattern  = "@mycompany.tld"
      }
    }
  }
  any-other-tag = {
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
      creation = false
      update   = false
      deletion = false
      name_pattern = {
        operator = "regex"
        pattern  = "*"
        name     = "Forbid any tag creation"
      }
    }
  }
}
