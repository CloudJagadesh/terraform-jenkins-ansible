pipeline{
    agent any
    environment{
        PATH = "${PATH}:${getTerraformPath()}"
    }
    stages {
        stage('S3 - Create Bucket'){
            steps{
                createS3Bucket('mybucket-tf')
            }
        }
      stage ('Terraform init and apply - dev'){
          steps {
              script{
                  sh "terraform init"
                  sh returnStatus: true, script: "terraform workspace new dev"
                  sh "terraform apply -var-file=dev.tfvars --auto-approve"
          }
        }
      }
      stage ('Terraform init and apply - prod'){
          steps {
              script{
                  sh "terraform init"
                  sh returnStatus: true, script: "terraform workspace new prod"
                  sh "terraform apply -var-file=prod.tfvars --auto-approve"
          }
        }
      }
    }
}

def getTerraformPath(){
    def tfHome = tool name: 'Terraform-1.7.4', type: 'terraform'
    return tfHome
}

def createS3Bucket(bucketName){
    sh returnStatus: true, script: "aws s3 mb s3://${bucketName} --region ap-south-1"
}
