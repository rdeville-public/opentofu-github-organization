locals {
  # Remove admin from members
  members = setsubtract(var.members, var.admins)
}
