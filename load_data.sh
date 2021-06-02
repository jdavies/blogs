# Be sure you have already set your authToken environment variable before running this script!
echo "Be sure you have already set your authToken environment variable before running this script!"
pause

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