data "terraform_remote_state" "this" {

  backend = "s3"

  config = {
    bucket = "terraform-course-tfstate-431591413306"
    key    = "dev/remote-state-data-source/terraform.tfstate"
    region = var.region
  }
}