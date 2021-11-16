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

client_idx = "value = vvSRMqQwGaetHxDQwXREqiDu"
client_secretx = "value = ZGMv.SKAXAPGDJ-6EZtD6m1.4F3NgFje,IQ+kbpgYmDvzGQUZm6B4uGWsKBXHyfZ3Wx+211dB,PTU.Hb3nl-T+XypswzYD604CoJloPZa6TuIAgApKCM5FZrq8ZrOTAB"
results = "database_id = d02f8b25-5c9b-496f-805e-fc2946bcd0a9 testvar = ABC123"
token = "value = AstraCS:vvSRMqQwGaetHxDQwXREqiDu:1c80371e6a660778f1c1d51601e60bcf2c199355c1acb5ce8e0642e7bd156545"

