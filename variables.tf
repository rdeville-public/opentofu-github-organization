# Organization settings variables
# ------------------------------------------------------------------------
variable "settings_billing_email" {
  type        = string
  description = "The billing email address for the organization."
}

variable "settings_name" {
  type        = string
  description = "The name for the organization."

  nullable = false
}

variable "settings_description" {
  type        = string
  description = "The description for the organization."

  nullable = false
}

variable "settings_company" {
  type        = string
  description = "The company name for the organization."

  default = null
}

variable "settings_blog" {
  type        = string
  description = "The blog URL for the organization."

  default = null
}

variable "settings_email" {
  type        = string
  description = "The email address for the organization."

  default = null
}

variable "settings_twitter_username" {
  type        = string
  description = "The Twitter username for the organization."

  default = null
}

variable "settings_location" {
  type        = string
  description = "The location for the organization."

  default = null
}

variable "settings_has_organization_projects" {
  type        = bool
  description = "Whether or not organization projects are enabled for the organization."

  nullable = false
  default  = false
}

variable "settings_has_repository_projects" {
  type        = bool
  description = "Whether or not repository projects are enabled for the organization."

  nullable = false
  default  = false
}

variable "settings_default_repository_permission" {
  type        = string
  description = "The default permission for organization members to create new repositories."

  nullable = false
  default  = "read"
}

variable "settings_members_can_create_repositories" {
  type        = bool
  description = "Whether or not organization members can create new repositories."

  nullable = false
  default  = false
}

variable "settings_members_can_create_public_repositories" {
  type        = bool
  description = "Whether or not organization members can create new public repositories."

  nullable = false
  default  = false
}

variable "settings_members_can_create_private_repositories" {
  type        = bool
  description = "Whether or not organization members can create new private repositories."

  nullable = false
  default  = false
}

variable "settings_members_can_create_internal_repositories" {
  type        = bool
  description = "Whether or not organization members can create new internal repositories. For Enterprise Organizations only."

  nullable = false
  default  = false
}

variable "settings_members_can_create_pages" {
  type        = bool
  description = "Whether or not organization members can create new pages."

  nullable = false
  default  = false
}

variable "settings_members_can_create_public_pages" {
  type        = bool
  description = "Whether or not organization members can create new public pages."

  nullable = false
  default  = false
}

variable "settings_members_can_create_private_pages" {
  type        = bool
  description = "Whether or not organization members can create new private pages."

  nullable = false
  default  = false
}

variable "settings_members_can_fork_private_repositories" {
  type        = bool
  description = "Whether or not organization members can fork private repositories."

  nullable = false
  default  = false
}

variable "settings_web_commit_signoff_required" {
  type        = bool
  description = "Whether or not commit signatures are required for commits to the organization."

  nullable = false
  default  = true
}

variable "settings_advanced_security_enabled_for_new_repositories" {
  type        = bool
  description = "Whether or not advanced security is enabled for new repositories."

  nullable = false
  default  = false
}

variable "settings_dependabot_alerts_enabled_for_new_repositories" {
  type        = bool
  description = "Whether or not dependabot alerts are enabled for new repositories."

  nullable = false
  default  = false
}

variable "settings_dependabot_security_updates_enabled_for_new_repositories" {
  type        = bool
  description = "Whether or not dependabot security updates are enabled for new repositories."

  nullable = false
  default  = false
}

variable "settings_dependency_graph_enabled_for_new_repositories" {
  type        = bool
  description = "Whether or not dependency graph is enabled for new repositories."

  nullable = false
  default  = false
}

variable "settings_secret_scanning_enabled_for_new_repositories" {
  type        = bool
  description = "Whether or not secret scanning is enabled for new repositories."

  nullable = false
  default  = false
}

variable "settings_secret_scanning_push_protection_enabled_for_new_repositories" {
  type        = bool
  description = "Whether or not secret scanning push protection is enabled for new repositories."

  nullable = false
  default  = false
}

# Organization Rules Set variables
# ------------------------------------------------------------------------
variable "ruleset" {
  # Key is the name of the ruleset
  type = map(object({
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
  description = <<-EOM
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

  EOM

  default = {}
}
