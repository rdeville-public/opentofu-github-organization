# Manage settings of an organization.
resource "github_organization_settings" "this" {
  billing_email = var.settings_billing_email
  name          = var.settings_name
  description   = var.settings_description

  company          = var.settings_company
  blog             = var.settings_blog
  email            = var.settings_email
  twitter_username = var.settings_twitter_username
  location         = var.settings_location

  has_organization_projects     = var.settings_has_organization_projects
  has_repository_projects       = var.settings_has_repository_projects
  default_repository_permission = var.settings_default_repository_permission

  members_can_create_repositories          = var.settings_members_can_create_repositories
  members_can_create_public_repositories   = var.settings_members_can_create_public_repositories
  members_can_create_private_repositories  = var.settings_members_can_create_private_repositories
  members_can_create_internal_repositories = var.settings_members_can_create_internal_repositories
  members_can_create_pages                 = var.settings_members_can_create_pages
  members_can_create_public_pages          = var.settings_members_can_create_public_pages
  members_can_create_private_pages         = var.settings_members_can_create_private_pages
  members_can_fork_private_repositories    = var.settings_members_can_fork_private_repositories

  web_commit_signoff_required                                  = var.settings_web_commit_signoff_required
  advanced_security_enabled_for_new_repositories               = var.settings_advanced_security_enabled_for_new_repositories
  dependabot_alerts_enabled_for_new_repositories               = var.settings_dependabot_alerts_enabled_for_new_repositories
  dependabot_security_updates_enabled_for_new_repositories     = var.settings_dependabot_security_updates_enabled_for_new_repositories
  dependency_graph_enabled_for_new_repositories                = var.settings_dependency_graph_enabled_for_new_repositories
  secret_scanning_enabled_for_new_repositories                 = var.settings_secret_scanning_enabled_for_new_repositories
  secret_scanning_push_protection_enabled_for_new_repositories = var.settings_secret_scanning_push_protection_enabled_for_new_repositories
}

# Manage ruletsets of an organization.
resource "github_organization_ruleset" "this" {
  for_each = var.ruleset

  name        = each.key
  target      = each.value.target
  enforcement = each.value.enforcement

  dynamic "bypass_actors" {
    for_each = each.value.bypass_actors != null ? each.value.bypass_actors : []

    content {
      actor_id    = bypass_actors.value.actor_id
      actor_type  = bypass_actors.value.actor_type
      bypass_mode = bypass_actors.value.bypass_mode
    }
  }

  dynamic "conditions" {
    for_each = each.value.conditions != null ? [each.value.conditions] : []

    content {
      repository_id = conditions.value.repository_id

      ref_name {
        include = conditions.value.ref_name.include
        exclude = conditions.value.ref_name.exclude
      }

      repository_name {
        include = conditions.value.repository_name.include
        exclude = conditions.value.repository_name.exclude
      }
    }
  }

  rules {
    creation                = each.value.rules.creation
    update                  = each.value.rules.update
    deletion                = each.value.rules.deletion
    non_fast_forward        = each.value.rules.non_fast_forward
    required_linear_history = each.value.rules.required_linear_history
    required_signatures     = each.value.rules.required_signatures

    dynamic "branch_name_pattern" {
      for_each = each.value.target == "branch" && each.value.rules.name_pattern != null ? [each.value.rules.name_pattern] : []

      content {
        name     = branch_name_pattern.value.name
        negate   = branch_name_pattern.value.negate
        operator = branch_name_pattern.value.operator
        pattern  = branch_name_pattern.value.pattern
      }
    }

    dynamic "tag_name_pattern" {
      for_each = each.value.target == "tag" && each.value.rules.name_pattern != null ? [each.value.rules.name_pattern] : []

      content {
        name     = tag_name_pattern.value.name
        negate   = tag_name_pattern.value.negate
        operator = tag_name_pattern.value.operator
        pattern  = tag_name_pattern.value.pattern
      }
    }

    dynamic "commit_author_email_pattern" {
      for_each = each.value.rules.commit_author_email_pattern != null ? [each.value.rules.commit_author_email_pattern] : []

      content {
        name     = commit_author_email_pattern.value.name
        operator = commit_author_email_pattern.value.operator
        pattern  = commit_author_email_pattern.value.pattern
        negate   = commit_author_email_pattern.value.negate
      }
    }

    dynamic "committer_email_pattern" {
      for_each = each.value.rules.committer_email_pattern != null ? [each.value.rules.committer_email_pattern] : []

      content {
        name     = committer_email_pattern.value.name
        operator = committer_email_pattern.value.operator
        pattern  = committer_email_pattern.value.pattern
        negate   = committer_email_pattern.value.negate
      }
    }

    dynamic "commit_message_pattern" {
      for_each = each.value.rules.commit_message_pattern != null ? [each.value.rules.commit_message_pattern] : []

      content {
        name     = commit_message_pattern.value.name
        operator = commit_message_pattern.value.operator
        pattern  = commit_message_pattern.value.pattern
        negate   = commit_message_pattern.value.negate
      }
    }

    dynamic "pull_request" {
      for_each = each.value.rules.pull_request != null ? [each.value.rules.pull_request] : []

      content {
        dismiss_stale_reviews_on_push     = pull_request.value.dismiss_stale_reviews_on_push
        require_code_owner_review         = pull_request.value.require_code_owner_review
        require_last_push_approval        = pull_request.value.require_last_push_approval
        required_approving_review_count   = pull_request.value.required_approving_review_count
        required_review_thread_resolution = pull_request.value.required_review_thread_resolution
      }
    }

    dynamic "required_status_checks" {
      for_each = each.value.rules.required_status_checks != null ? [each.value.rules.required_status_checks] : []

      content {
        required_check {
          context        = required_status_checks.value.context
          integration_id = required_status_checks.value.integration_id
        }
      }
    }

    dynamic "required_workflows" {
      for_each = each.value.rules.required_workflows != null ? [each.value.rules.required_workflows] : []

      content {
        dynamic "required_workflow" {
          for_each = required_workflows.value.required_workflow

          content {
            repository_id = required_workflow.value.repository_id
            path          = required_workflow.value.path
            ref           = required_workflow.value.ref
          }
        }
      }
    }
  }
}
