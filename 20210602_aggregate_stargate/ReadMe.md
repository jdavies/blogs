# README.md

Sample code to suport the ggregate Functions in Stargate blog

Sample table:

| id | name | age |
|---:|------|-----|
| 1 | John| | 25 |
| 2 | Mustafa | 34 |
| 3 | Krishna | 37 |
| 4 | Julie | 45 |
| 5 | Priti | 50 |

The following cqlsh query

```sh
select id, name, max(age) as eldest from employee;
```

would return

```sh

```

June 1, 2021 - This version of Stargate will be released to Astra this week or next.

## Start the Docker Image

```sh
docker run -d --name stargate \
-p 8080:8080 \
-p 8081:8081 \
-p 8082:8082 \
-p 9042:9042 \
stargateio/stargate-dse-68:v1.0.25 \
--developer-mode --cluster-name test \
--cluster-version 6.8 --dse --enable-auth
```

## Authentication Info

1. Get the authorization credentials from the Docker instance

```sh
curl -L -X POST 'http://localhost:8081/v1/auth' \
-H 'Content-Type: application/json' \
--data-raw '{
    "username": "cassandra",
    "password": "cassandra"
}'
```

2. Set the auth token as an environment variable for easy reuse

```sh
export authToken="The token returned in the previous step"
```

## Create the Database Table

3. Get a lists of keyspaces (optional)

```sh
curl -L -X GET 'localhost:8082/v1/keyspaces' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken"
```

5. Create our "test" keyspace

```sh
curl -L -X POST 'localhost:8082/v2/schemas/keyspaces' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" \
-d '{ "name": "test", "replicas": 1}'
```

6. Create our employee table in the test keyspace

```sh
curl -L -X POST 'localhost:8082/v1/keyspaces/test/tables' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" \
-d '{
  "name": "employee",
  "primaryKey": {
    "partitionKey": [
      "id", "name"
    ],
    "clusteringKey": [
      "rtime"
    ]
  },
  "columnDefinitions": [
    {
      "name": "id",
      "typeDefinition": "int",
      "static": true
    },
    {
      "name": "name",
      "typeDefinition": "text",
      "static": true
    },
    {
      "name": "rtime",
      "typeDefinition": "timestamp",
      "static": true
    },
    {
      "name": "sale",
      "typeDefinition": "int",
      "static": false
    }
  ],
  "ifNotExists": true,
  "tableOptions": {
    "defaultTimeToLive": 0,
    "clusteringExpression": [
      {
        "column": "rtime",
        "order":  "ASC"
      }
    ]
  }
}'
```

7. Insert some data

```sh
curl -L -X POST 'localhost:8082/v1/keyspaces/test/tables/employee/rows' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" \
-d '{
  "columns": [
    { "name": "id", "value": 1 },
    { "name": "name", "value": "John" },
    { "name": "rtime", "value": "2019-01-12T09:48:31.020Z" },
    { "name": "sale", "value": 1000 }
  ]
}'

curl -L -X POST 'localhost:8082/v1/keyspaces/test/tables/employee/rows' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" \
-d '{
  "columns": [
    { "name": "id", "value": 1 },
    { "name": "name", "value": "Mustafa" },
    { "name": "rtime", "value": "2019-01-12T09:48:31.020Z" },
    { "name": "sale", "value": 2000 }
  ]
}'

curl -L -X POST 'localhost:8082/v1/keyspaces/test/tables/employee/rows' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" \
-d '{
  "columns": [
    { "name": "id", "value": 1 },
    { "name": "name", "value": "Krishna" },
    { "name": "rtime", "value": "2019-01-12T09:48:31.020Z" },
    { "name": "sale", "value": 2500 }
  ]
}'

curl -L -X POST 'localhost:8082/v1/keyspaces/test/tables/employee/rows' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" \
-d '{
  "columns": [
    { "name": "id", "value": 1 },
    { "name": "name", "value": "John" },
    { "name": "rtime", "value": "2020-01-12T09:48:31.020Z" },
    { "name": "sale", "value": 2200 }
  ]
}'

curl -L -X POST 'localhost:8082/v1/keyspaces/test/tables/employee/rows' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" \
-d '{
  "columns": [
    { "name": "id", "value": 1 },
    { "name": "name", "value": "John" },
    { "name": "rtime", "value": "2021-01-12T09:48:31.020Z" },
    { "name": "sale", "value": 2350 }
  ]
}'

curl -L -X POST 'localhost:8082/v1/keyspaces/test/tables/employee/rows' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" \
-d '{
  "columns": [
    { "name": "id", "value": 1 },
    { "name": "name", "value": "Mustafa" },
    { "name": "rtime", "value": "2020-01-12T09:48:31.020Z" },
    { "name": "sale", "value": 3000 }
  ]
}'

curl -L -X POST 'localhost:8082/v1/keyspaces/test/tables/employee/rows' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" \
-d '{
  "columns": [
    { "name": "id", "value": 1 },
    { "name": "name", "value": "Mustafa" },
    { "name": "rtime", "value": "2021-01-12T09:48:31.020Z" },
    { "name": "sale", "value": 300 }
  ]
}'

curl -L -X POST 'localhost:8082/v1/keyspaces/test/tables/employee/rows' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" \
-d '{
  "columns": [
    { "name": "id", "value": 1 },
    { "name": "name", "value": "Krishna" },
    { "name": "rtime", "value": "2020-01-12T09:48:31.020Z" },
    { "name": "sale", "value": 1500 }
  ]
}'

curl -L -X POST 'localhost:8082/v1/keyspaces/test/tables/employee/rows' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" \
-d '{
  "columns": [
    { "name": "id", "value": 1 },
    { "name": "name", "value": "Krishna" },
    { "name": "rtime", "value": "2021-01-12T09:48:31.020Z" },
    { "name": "sale", "value": 3600 }
  ]
}'
```



8. Select all records

```sh
curl -L -X GET 'localhost:8082/v1/keyspaces/tt/tables/mdsubscriptions/rows' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken"
```

9. Use GraphQL to query all records where cid = 1 and sid = sheth. 3 records will be returned.

```sh
curl 'http://localhost:8080/graphql/tt' \
-H 'Accept-Encoding: gzip, deflate, br' \
-H 'Content-Type: application/json' \
-H 'Accept: application/json' \
-H 'Connection: keep-alive' \
-H 'DNT: 1' \
-H 'Origin: http://localhost:8080' \
-H "x-cassandra-token: $authToken" \
--data-binary '{"query":"query allSubscriptions {\n  mdsubscriptions(value: { \n    cid: 1, \n    sid: \"sheth\" }) {\n    values {\n      cid\n      sid\n      rtime\n      uic\n    }\n  }\n}"}' --compressed
```

10. Use the GraphQL command to find the max(uic) where id = 1 and sid = "sheth". Only 1 record will be returned, the one with the uic value of 12 (the max value in the table for this query)

```sh
curl 'http://localhost:8080/graphql/tt' \
-H 'Accept-Encoding: gzip, deflate, br' \
-H 'Content-Type: application/json' \
-H 'Accept: application/json' \
-H 'Connection: keep-alive' \
-H 'DNT: 1' \
-H 'Origin: http://localhost:8080' \
-H "x-cassandra-token: $authToken" \
--data-binary '{"query":"query allSubscriptions {\n  mdsubscriptions(value: { \n    cid: 1, \n    sid: \"sheth\" }) {\n    values {\n      cid\n      sid\n      rtime\n      max: _int_function(name: \"max\", args: [\"uic\"])\n }\n  }\n}"}' --compressed
```

## Utility Functions

These commands are not part of the main blog article. I keep them here because they were useful in the development of this blog article.

### Delete the employee table

```sh
curl -X DELETE 'localhost:8082/v1/keyspaces/test/tables/employee' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" 
```
