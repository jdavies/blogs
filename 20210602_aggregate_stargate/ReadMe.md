# README.md

Sample code to support my blog article on medium.com. Use these file to follow the tutorial on aggregate functions.





8. Select all records

```sh
curl -L -X GET 'localhost:8082/v1/keyspaces/test/tables/employee/rows' \
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
