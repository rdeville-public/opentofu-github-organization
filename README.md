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

<!-- BEGIN TF-DOCS -->
## ⚙️ Module Content

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

* [resource.github_organization_settings.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_settings)
  > Manage the lifecycle of an organization.

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
<!-- markdownlint-restore -->

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
