def jobDSL="""
pipeline {
  agent {
    docker {
      image 'hashicorp/terraform:light'
      args '--entrypoint='
    }
  }
  stages {
    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -no-color -out=create.tfplan'
      }
    }
    // Optional wait for approval
    input 'Deploy stack?'

    stage ('Terraform Apply') {
      sh "terraform --version"
    }
  }
}


""";

def flowDefinition = new org.jenkinsci.plugins.workflow.cps.CpsFlowDefinition(jobDSL, true);
def parent = Jenkins.instance;
def job = new org.jenkinsci.plugins.workflow.job.WorkflowJob(parent, "testJob")
job.definition = flowDefinition
Jenkins.instance.reload()
