terraform {
  cloud {
    organization = "luvveroenterprises"

    workspaces {
      name = "diamonddogs-app-useast1-dev"
    }
  }
}