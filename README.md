# project

- [Blog](https://blog.amhadid.uca-devops.ovh)
- [Cloud](https://cloud.amhadid.uca-devops.ovh)
- [Project](https://project.amhadid.uca-devops.ovh)

### blog,Cloud
these containers have acces to mariadb db and each have different databases with different users all privleges granted they are related to app_network and traefik_network to assure the https forwarding.

### project 
container isolated and doesnt have the acces to DB.

## Dashboard
There is no Grafana dashboard available for this project.

## Continuous Integration (CI)
In the build stage, a file named `init.sh` is executed by the CI system. This script performs the following tasks:

1. Log into Vault using GitLab tokens generated by GitLab for each pipeline. 
2. Retrieve credentials for OVH and export them as environment variables. These credentials can then be used for manual deployment.

Please note that if this project is pushed to another account, the GitLab authentication method for accessing Vault may not work.
