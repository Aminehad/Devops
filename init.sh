VAULT_TOKEN=$(curl -s -X POST -k --data "{\"token\":\"$CI_JOB_TOKEN\"}" "https://vault.edu.forestier.re/v1/auth/gitlab/ci" | python3 jq.py "auth/client_token") #this right here is because i used gitlab to access vault so it knows how to auth using the gitlab token thats being generated everytime i run the pipeline 

# Récupérer les secrets depuis Vault
OVH_APPLICATION_KEY=$( curl -H "X-Vault-Token: $VAULT_TOKEN" https://vault.edu.forestier.re/v1/gitlab/data/public/ovh_credentials | jq '.data.data | .APPLICATION_KEY')
OVH_APPLICATION_SECRET=$( curl -H "X-Vault-Token: $VAULT_TOKEN" https://vault.edu.forestier.re/v1/gitlab/data/public/ovh_credentials | jq '.data.data | .APPLICATION_SECRET')
OVH_CONSUMER_KEY=$( curl -H "X-Vault-Token: $VAULT_TOKEN" https://vault.edu.forestier.re/v1/gitlab/data/public/ovh_credentials | jq '.data.data | .CONSUMER_KEY')
OVH_DOMAIN_NAME=$( curl -H "X-Vault-Token: $VAULT_TOKEN" https://vault.edu.forestier.re/v1/gitlab/data/public/ovh_credentials | jq '.data.data | .DOMAIN_NAME')

# Exporter les secrets en tant que variables d'environnement
export TF_VAR_ovh_application_key="$OVH_APPLICATION_KEY"
export TF_VAR_ovh_application_secret="$OVH_APPLICATION_SECRET"
export TF_VAR_ovh_consumer_key="$OVH_CONSUMER_KEY"
export TF_VAR_ovh_domain_name="$OVH_DOMAIN_NAME"

# Lancer Terraform
terraform init
terraform apply -auto-approve