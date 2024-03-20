pipeline{
    agent any
    environment{
        PATH = "${PATH}:${getTerraformPath()}"
    }
    stages {
      stage ('Terraform init and apply - dev'){
          steps {
              script{
                  sh "terraform init"
                  sh "terraform workspace new dev"
                  sh "terraform apply -var-file=dev.tfvars --auto-approve"
          }
        }
      }
    }
}

def getTerraformPath(){
    def tfHome = tool name: 'Terraform-1.7.4', type: 'terraform'
    return tfHome
}
