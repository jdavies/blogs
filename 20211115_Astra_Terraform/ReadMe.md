# Astra-Terraform Demo

The purpose of this project is to show how to use Terraform to create an
Astra database.

## Prerequisites

- Create a token with Admin User rights
- Create a setenv.sh file with the following format:

```sh
export ASTRA_API_TOKEN=<Your Astra DB/API Token>
export KEYSPACE=callcenter
export ASTRA_DB_REGION=us-west1
export ASTRA_CLIENT_ID=<Your Astra Client ID>
export ASTRA_CLIENT_SECRET=<Your Astra Client Secret>
```
- Make your setenv.sh file executable:

```sh
chmod 700 setenv.sh
```

## Running the code

Execute the folowing commands in the folder that contains your setenv.sh file:

```sh
source setenv.sh
terraform init
terraform plan -var="token=$ASTRA_API_TOKEN" -out example
terraform apply example
```

To delete everything

```sh
terraform destroy -var="token=$ASTRA_API_TOKEN"
```

## Custom Roles

Custom roles (as shown in the resource.tf file) are based on an array of string valuess in the ```policy``` field. You can find a list of possible values for these strings [here](https://docs.datastax.com/en/astra/docs/user-permissions.html).
