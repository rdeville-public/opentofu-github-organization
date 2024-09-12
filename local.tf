locals {
  # Assign highest privileged if user is present in multiple access level
  membership_perm = {
    members = setsubtract(var.membership.members, var.membership.admins)
    admins  = var.membership.admins
  }
  # Convert to map for the resource
  membership = {
    for user, perm in transpose(local.membership_perm) : user => one(perm)
  }
}
