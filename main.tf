// Manage the lifecycle of an organization.
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
