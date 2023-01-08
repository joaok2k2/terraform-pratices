locals {

  instance = {
    id  = data.terraform_remote_state.this.outputs.id
    ami = data.terraform_remote_state.this.outputs.ami
    arn = data.terraform_remote_state.this.outputs.arn
  }
}