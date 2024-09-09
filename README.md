<!-- BEGIN DOTGIT-SYNC BLOCK MANAGED -->
# 👋 Welcome to OpenTofu Module Github Organization

<center>

> ⚠️ IMPORTANT !
>
> Main repo is on [framagit.org](https://framagit.org/rdeville-public/terraform/module-github-groups).
>
> On other online git platforms, they are just mirror of the main repo.
>
> Any issues, pull/merge requests, etc., might not be considered on those other
> platforms.

</center>

---

<center>

[![Licenses: (MIT OR BEERWARE)][license_badge]][license_url]
[![Changelog][changelog_badge]][changelog_badge_url]
[![Build][build_badge]][build_badge_url]
[![Release][release_badge]][release_badge_url]

</center>

[build_badge]: https://framagit.org/rdeville-public/terraform/module-github-groups/badges/main/pipeline.svg
[build_badge_url]: https://framagit.org/rdeville-public/terraform/module-github-groups/-/commits/main
[release_badge]: https://framagit.org/rdeville-public/terraform/module-github-groups/-/badges/release.svg
[release_badge_url]: https://framagit.org/rdeville-public/terraform/module-github-groups/-/releases/
[license_badge]: https://img.shields.io/badge/Licenses-MIT%20OR%20BEERWARE-blue
[license_url]: https://framagit.org/rdeville-public/terraform/module-github-groups/blob/main/LICENSE
[changelog_badge]: https://img.shields.io/badge/Changelog-Python%20Semantic%20Release-yellow
[changelog_badge_url]: https://github.com/python-semantic-release/python-semantic-release

OpenTofu modules allowing to manage github organization configuration.

---
<!-- BEGIN DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
## 🚀 Usage

### Manage Orgnization with all defaults

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-organization.git"

  # Required variables
  settings_billing_email = "billing+github@mycompany.tld"
  settings_name          = "TF Test Organization"
  settings_description   = "Fake Organization to test TF provisioning"
}
```

### Manage Organization with all settings

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-organization.git"

  # Required variables
  settings_billing_email = "billing+github@mycompany.tld"
  settings_name          = "TF Test Organization"
  settings_description   = "Fake Organization to test TF provisioning"

  # Examples values
  settings_company          = "My Company"
  settings_blog             = "https://blog.mycompany.tld"
  settings_email            = "contact+github-org@mycompany.tld"
  settings_twitter_username = "@mycompany"
  settings_location         = "Neverland"

  # Defaults values
  settings_has_organization_projects     = false
  settings_has_repository_projects       = false
  settings_default_repository_permission = "read"

  settings_members_can_create_repositories          = false
  settings_members_can_create_public_repositories   = false
  settings_members_can_create_private_repositories  = false
  settings_members_can_create_internal_repositories = false
  settings_members_can_create_pages                 = false
  settings_members_can_create_public_pages          = false
  settings_members_can_create_private_pages         = false
  settings_members_can_fork_private_repositories    = false

  settings_web_commit_signoff_required                                  = true
  settings_advanced_security_enabled_for_new_repositories               = false
  settings_dependabot_alerts_enabled_for_new_repositories               = false
  settings_dependabot_security_updates_enabled_for_new_repositories     = false
  settings_dependency_graph_enabled_for_new_repositories                = false
  settings_secret_scanning_enabled_for_new_repositories                 = false
  settings_secret_scanning_push_protection_enabled_for_new_repositories = false
}
```

### Manage Organization Branch Rulesets

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-organization.git"

  # Required variables
  settings_billing_email = "billing+github@mycompany.tld"
  settings_name          = "TF Test Organization"
  settings_description   = "Fake Organization to test TF provisioning"

  # Example values
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
}
```

### Manage Organization Tag Rulesets

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-organization.git"

  # Required variables
  settings_billing_email = "billing+github@mycompany.tld"
  settings_name          = "TF Test Organization"
  settings_description   = "Fake Organization to test TF provisioning"

  # Example values
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
}
```

### Manage Organization both Branch and Tags Rulesets

```hcl
module "repo" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-github-organization.git"

  # Required variables
  settings_billing_email = "billing+github@mycompany.tld"
  settings_name          = "TF Test Organization"
  settings_description   = "Fake Organization to test TF provisioning"

  # Example values
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
}
```

<!-- BEGIN TF-DOCS -->
## ⚙️ Module Content

<details><summary>Click to reveal</summary>

### Table of Content

* [Requirements](#requirements)
* [Resources](#resources)
* [Inputs](#inputs)
  * [Required Inputs](#required-inputs)
  * [Optional Inputs](#optional-inputs)

### Requirements

* [opentofu](https://opentofu.org/docs/):
  `>= 1.8, < 2.0`
* [github](https://registry.terraform.io/providers/integrations/github/):
  `~>6.2`

### Resources

* [resource.github_organization_ruleset.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_ruleset)
  > Manage ruletsets of an organization.
* [resource.github_organization_settings.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_settings)
  > Manage settings of an organization.

<!-- markdownlint-capture -->
### Inputs

<!-- markdownlint-disable -->
#### Required Inputs

* [settings_billing_email](#settings_billing_email)
* [settings_name](#settings_name)
* [settings_description](#settings_description)

##### `settings_billing_email`

The billing email address for the organization.
<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

##### `settings_name`

The name for the organization.
<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

##### `settings_description`

The description for the organization.
<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

#### Optional Inputs

* [settings_company](#settings_company)
* [settings_blog](#settings_blog)
* [settings_email](#settings_email)
* [settings_twitter_username](#settings_twitter_username)
* [settings_location](#settings_location)
* [settings_has_organization_projects](#settings_has_organization_projects)
* [settings_has_repository_projects](#settings_has_repository_projects)
* [settings_default_repository_permission](#settings_default_repository_permission)
* [settings_members_can_create_repositories](#settings_members_can_create_repositories)
* [settings_members_can_create_public_repositories](#settings_members_can_create_public_repositories)
* [settings_members_can_create_private_repositories](#settings_members_can_create_private_repositories)
* [settings_members_can_create_internal_repositories](#settings_members_can_create_internal_repositories)
* [settings_members_can_create_pages](#settings_members_can_create_pages)
* [settings_members_can_create_public_pages](#settings_members_can_create_public_pages)
* [settings_members_can_create_private_pages](#settings_members_can_create_private_pages)
* [settings_members_can_fork_private_repositories](#settings_members_can_fork_private_repositories)
* [settings_web_commit_signoff_required](#settings_web_commit_signoff_required)
* [settings_advanced_security_enabled_for_new_repositories](#settings_advanced_security_enabled_for_new_repositories)
* [settings_dependabot_alerts_enabled_for_new_repositories](#settings_dependabot_alerts_enabled_for_new_repositories)
* [settings_dependabot_security_updates_enabled_for_new_repositories](#settings_dependabot_security_updates_enabled_for_new_repositories)
* [settings_dependency_graph_enabled_for_new_repositories](#settings_dependency_graph_enabled_for_new_repositories)
* [settings_secret_scanning_enabled_for_new_repositories](#settings_secret_scanning_enabled_for_new_repositories)
* [settings_secret_scanning_push_protection_enabled_for_new_repositories](#settings_secret_scanning_push_protection_enabled_for_new_repositories)
* [ruleset](#ruleset)


##### `settings_company`

The company name for the organization.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_blog`

The blog URL for the organization.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_email`

The email address for the organization.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_twitter_username`

The Twitter username for the organization.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_location`

The location for the organization.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_has_organization_projects`

Whether or not organization projects are enabled for the organization.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_has_repository_projects`

Whether or not repository projects are enabled for the organization.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_default_repository_permission`

The default permission for organization members to create new repositories.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  read
  ```

  </div>
</details>

##### `settings_members_can_create_repositories`

Whether or not organization members can create new repositories.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_members_can_create_public_repositories`

Whether or not organization members can create new public repositories.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_members_can_create_private_repositories`

Whether or not organization members can create new private repositories.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_members_can_create_internal_repositories`

Whether or not organization members can create new internal repositories. For Enterprise Organizations only.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_members_can_create_pages`

Whether or not organization members can create new pages.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_members_can_create_public_pages`

Whether or not organization members can create new public pages.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_members_can_create_private_pages`

Whether or not organization members can create new private pages.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_members_can_fork_private_repositories`

Whether or not organization members can fork private repositories.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_web_commit_signoff_required`

Whether or not commit signatures are required for commits to the organization.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_advanced_security_enabled_for_new_repositories`

Whether or not advanced security is enabled for new repositories.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_dependabot_alerts_enabled_for_new_repositories`

Whether or not dependabot alerts are enabled for new repositories.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_dependabot_security_updates_enabled_for_new_repositories`

Whether or not dependabot security updates are enabled for new repositories.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_dependency_graph_enabled_for_new_repositories`

Whether or not dependency graph is enabled for new repositories.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_secret_scanning_enabled_for_new_repositories`

Whether or not secret scanning is enabled for new repositories.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_secret_scanning_push_protection_enabled_for_new_repositories`

Whether or not secret scanning push protection is enabled for new repositories.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `ruleset`

Map of object, where key is the name of the ruleset.
Object define ruleset apply to branch ONLY, with the following arguments:
* `target`: String, define the targe on which will apply the rules. Possible
  values are `branch` and `tag`

* `enforcement`: Optional, String, enforcement type, one of `disabled`,
  `active` or `evaluate`. Default set to `active`.

  Note: evaluate is currently only supported for owners of type organization.

* `bypass_actors`: List of object, optional, the actors that can bypass the
  rules in this ruleset, with the following arguments:

  * `actor_id`: Number, the ID of the actor that can bypass a ruleset.

  * `actor_type`: String, optional, the type of actor that can bypass a ruleset.

    Can be one of: `RepositoryRole`, `Team`, `Integration`, `OrganizationAdmin`.

    Note: at the time of writing this, the following actor types correspond to
    the following actor IDs:

      * OrganizationAdmin -> 1

    RepositoryRole (This is the actor type, the following are the base
    repository roles and their associated IDs.)

      * maintain -> 2
      * write -> 4
      * admin -> 5

  * `bypass_mode`: String, optional, when the specified actor can bypass the ruleset.
    pull_request means that an actor can only bypass rules on pull requests.

    Can be one of: `always`, `pull_request`. Default to `pull_request`.

* `conditions`: Object, parameters for an organization ruleset condition.
  `ref_name` is required alongside one of `repository_name` or `repository_id`.

  * `ref_name`: Object, with the following arguments

    * `exclude`: List of string, array of ref names or patterns to exclude.
      The condition will not pass if any of these patterns match.
    * `include`: List of string, array of ref names or patterns to include.
       One of these patterns must match for the condition to pass.
       Also accepts `~DEFAULT_BRANCH` to include the default branch or
       `~ALL` to include all branches.

  * `repository_id`: List of number, optional, the repository IDs that the
    ruleset applies to. One of these IDs must match for the condition to pass.
    Conflicts with repository_name.


  * `repository_name`: Object, optional, conflicts with repository_id.

    * `exclude`: List of string, array of repository names or patterns to exclude.
       The condition will not pass if any of these patterns match.
    * `include`: List of string, array of repository names or patterns to include.
       One of these patterns must match for the condition to pass.
       Also accepts `~ALL` to include all repositories.

* `rules`: Object, which define rules within the ruleset. Object
  support following arguments:

  * `creation`: Boolean, optional, only allow users with bypass permission to
    create matching refs. Default to `true`

  * `update`: Boolean, optional, only allow users with bypass permission to
    update matching refs. Default `true`

  * `deletion`: Boolean, optional, only allow users with bypass permissions to
    delete matching refs. Default to `true`

  * `non_fast_forward`: Prevent users with push access from force pushing
    to branches. Default to `true`

  * `required_linear_history`: Boolean, optional, prevent merge commits from
     being pushed to matching branches. Default to `true`

  * `required_signatures`: Boolean, optional, commits pushed to matching
     branches must have verified signatures. Default to `true`

  * `name_pattern`: Object, parameters to be used for the branch_name_pattern
    rule. This rule only applies to repositories within an enterprise, it
    cannot be applied to repositories owned by individuals or regular
    organizations. This object support following arguments:

    * `name`: String How this rule will appear to users.
    * `operator`: String, the operator to use for matching. Can be one of:
      starts_with, ends_with, contains, regex.
    * `pattern`: String, the pattern to match with.
    * `negate`: Boolean, optional, If true, the rule will fail if the pattern
      matches. Default `false`.

  * `commit_author_email_pattern`: Object, optional, parameters to be used for
    the commit_author_email_pattern rule. This rule only applies to
    repositories within an enterprise, it cannot be applied to repositories
    owned by individuals or regular organizations. This object support
    following arguments:

    * `name`: String How this rule will appear to users.
    * `operator`: String, the operator to use for matching. Can be one of:
      starts_with, ends_with, contains, regex.
    * `pattern`: String, the pattern to match with.
    * `negate`: Boolean, optional, If true, the rule will fail if the pattern
      matches. Default `false`.

  * `committer_email_pattern`: Object, optional, parameters to be used for
    the commit_author_email_pattern rule. This rule only applies to
    repositories within an enterprise, it cannot be applied to repositories
    owned by individuals or regular organizations.This object support
    following arguments:

    * `name`: String How this rule will appear to users.
    * `operator`: String, the operator to use for matching. Can be one of:
      starts_with, ends_with, contains, regex.
    * `pattern`: String, the pattern to match with.
    * `negate`: Boolean, optional, If true, the rule will fail if the pattern
      matches. Default `false`.

  * `commit_message_pattern`: Object, optional, parameters to be used for the
    commit_message_pattern rule. This rule only applies to repositories
    within an enterprise, it cannot be applied to repositories owned by
    individuals or regular organizations.This object support following
    arguments:

    * `name`: String How this rule will appear to users.
    * `operator`: String, the operator to use for matching. Can be one of:
      starts_with, ends_with, contains, regex.
    * `pattern`: String, the pattern to match with.
    * `negate`: Boolean, optional, If true, the rule will fail if the pattern
      matches. Default `false`.

  * `pull_request`: Object, optional, require all commits be made to a
     non-target branch and submitted via a pull request before they can be
     merged. This object support following arguments:

    * `dismiss_stale_reviews_on_push`: Boolean, optional, new reviewable commits
      pushed will dismiss previous pull request review approvals.
      Defaults to `false`.

    * `require_code_owner_review`: Boolean, optional, require an approving
      review in pull requests that modify files that have a designated code
      owner. Defaults to `true`.

    * `require_last_push_approval`: Boolea, optional, whether the most recent
      reviewable push must be approved by someone other than the person who
      pushed it. Defaults to `false`.

    * `required_approving_review_count`: Number, optional, the number of
      approving reviews that are required before a pull request can be merged.
      Defaults to `1`.

    * `required_review_thread_resolution`: Boolea, optional, all conversations
      on code must be resolved before a pull request can be merged.
      Defaults to `false`.

  * `required_status_checks`: list(Object), optional, choose which status checks
    must pass before branches can be merged into a branch that matches this rule.
    When enabled, commits must first be pushed to another branch, then merged
    or pushed directly to a branch that matches this rule after status checks
    have passed. This object support following arguments:

    * `required_check`: Object, optional, status checks that are required.
      Several can be defined.

      * `context`: String, the status check context name that must be present
        on the commit.

      * `integration_id`: Number, optional, integration ID that this status
        check must originate from.

    * `strict_required_status_checks_policy`: Boolean, optional, whether pull
       requests targeting a matching branch must be tested with the latest code.
       This setting will not take effect unless at least one status check is enabled.
       Defaults to `false`.

  * `required_workflows`: Object, optional, define which Actions workflows
    must pass before changes can be merged into a branch matching the rule.
    Multiple workflows can be specified. This object support following arguments:

    * `required_workflow`: List of object, Actions workflows that are required.
      Multiple can be defined. The object support following arguments:

      * `repository_id`: String, The ID of the repository. Names, full names and
        repository URLs are not supported.
      * `path`: String, The path to the YAML definition file of the workflow.
      * `ref`: String, Optional, the ref from which to fetch the workflow.
        Default to `main`.


<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(object({
    target      = string
    enforcement = optional(string, "active")
    bypass_actors = optional(list(object({
      actor_id    = number
      actor_type  = optional(string)
      bypass_mode = optional(string, "pull_request")
    })))
    conditions = optional(object({
      ref_name = object({
        include = optional(list(string), [])
        exclude = optional(list(string), [])
      })
      repository_id = optional(list(string))
      repository_name = optional(object({
        include = optional(list(string), [])
        exclude = optional(list(string), [])
      }))
    }))
    rules = object({
      creation                = optional(bool, true)
      update                  = optional(bool, true)
      deletion                = optional(bool, true)
      non_fast_forward        = optional(bool, true)
      required_linear_history = optional(bool, true)
      required_signatures     = optional(bool, true)
      name_pattern = optional(object({
        name     = string
        operator = string
        pattern  = string
        negate   = optional(bool, false)
      }))
      commit_author_email_pattern = optional(object({
        name     = string
        operator = string
        pattern  = string
        negate   = optional(bool, false)
      }))
      committer_email_pattern = optional(object({
        name     = string
        operator = string
        pattern  = string
        negate   = optional(bool, false)
      }))
      commit_message_pattern = optional(object({
        name     = string
        operator = string
        pattern  = string
        negate   = optional(bool, false)
      }))
      pull_request = optional(object({
        dismiss_stale_reviews_on_push     = optional(bool, false)
        require_code_owner_review         = optional(bool, true)
        require_last_push_approval        = optional(bool, false)
        required_approving_review_count   = optional(number, 1)
        required_review_thread_resolution = optional(bool, false)
      }))
      required_status_checks = optional(object({
        required_check = object({
          context        = string
          integration_id = optional(number)
        })
        strict_required_status_checks_policy = optional(bool, true)
      }))
      required_workflows = optional(object({
        required_workflow = list(object({
          repository_id = string
          path          = string
          ref           = optional(string, "main")
        }))
      }))
    })
  }))
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>
<!-- markdownlint-restore -->

</details>

<!-- END TF-DOCS -->
<!-- END DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page][issues_pages].

You can also take a look at the [CONTRIBUTING.md][contributing].

[issues_pages]: https://framagit.org/rdeville-public/terraform/module-github-groups/-/issues
[contributing]: https://framagit.org/rdeville-public/terraform/module-github-groups/blob/main/CONTRIBUTING.md

## 👤 Maintainers

* 📧 [**Romain Deville** \<code@romaindeville.fr\>](mailto:code@romaindeville.fr)
  * Website: [https://romaindeville.fr](https://romaindeville.fr)
  * Github: [@rdeville](https://github.com/rdeville)
  * Gitlab: [@r.deville](https://gitlab.com/r.deville)
  * Framagit: [@rdeville](https://framagit.org/rdeville)

## 📝 License

Copyright © 2024 [Romain Deville](code@romaindeville.fr)

This project is under following licenses (**OR**) :

* [MIT][main_license]
* [BEERWARE][beerware_license]

[main_license]: https://framagit.org/rdeville-public/terraform/module-github-groups/blob/main/LICENSE
[beerware_license]: https://framagit.org/rdeville-public/terraform/module-github-groups/blob/main/LICENSE.BEERWARE
<!-- END DOTGIT-SYNC BLOCK MANAGED -->
