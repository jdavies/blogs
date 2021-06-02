# README.md

Sample code to support my blog article on medium.com. Use these files to follow the tutorial on aggregate functions.

## Utility Functions

These commands are not part of the main blog article. I keep them here because they were useful in the development of this blog article.

### Delete the employee table

```sh
curl -X DELETE 'localhost:8082/v1/keyspaces/test/tables/employee' \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "X-Cassandra-Token: $authToken" 
```
