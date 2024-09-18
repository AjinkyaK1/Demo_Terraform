pipeline 
{
    agent any

    stages 
    {
        stage('Initialize') 
        {
            steps 
            {
                script 
                {
                    sh 'terraform init'
                }
            }
        }
      
        stage('Plan') 
        {
            steps 
            {
                script 
                {
                    sh 'terraform plan'
                }
            }
        }
      
        stage('Apply') 
        {
            steps 
            {
                script 
                {
                    def userInput = input(
                        id: 'Proceed', message: 'Do you want to apply the changes?',
                        parameters: [
                            [$class: 'BooleanParameterDefinition', name: 'Apply', defaultValue: true, description: 'Check to proceed with apply']
                        ]
                    )
                    if (userInput) 
                    {
                        sh 'terraform apply -auto-approve'
                    } 
                    else 
                    {
                        echo 'User chose not to apply changes.'
                    }
                }
            }
        }
    }

    post
    {
        always 
        {
            echo 'Cleaning up...'
            sh 'terraform destroy -auto-approve' 
        }
    }
}
