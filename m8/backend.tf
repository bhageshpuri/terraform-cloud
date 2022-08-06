terraform {
  cloud {
    organization = "luvveroenterprises"

    workspaces {
      tags = ["team:spacecoyote", "apps"]
    }
  }
}