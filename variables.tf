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
