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