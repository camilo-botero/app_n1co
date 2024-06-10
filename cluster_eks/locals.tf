locals {
  project               = "n1co"
  eks_name              = "cluster-n1co"
  eks_version           = "1.30"
  region                = "us-east-1"
  cidr_vpc              = "10.0.0.0/16"

  zone1                 = "us-east-1a"
  cidr_private_subnet1  = "10.0.1.0/24"
  cidr_public_subnet1   = "10.0.11.0/24"

  zone2                 = "us-east-1b"
  cidr_private_subnet2    = "10.0.2.0/24"
  cidr_public_subnet2     = "10.0.22.0/24"

  db_root_password      = "AppsN1co"
  db_name               = "AppN1co_db"
  db_user               = "AppN1co_user"
  db_user_password      = "AppsN1co"

  access_key            = "ABCD"
  secret_key            = "ABCD1234"
}