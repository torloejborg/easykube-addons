## LOGLAB
This small easykube addon allows us to experiment with log shippers in a very basic 
environment using the ELK stack.

When you run `easykube install loglab` the following magic will
happen
 
 * An Elastic kubernetes operator will be installed, it will spin up
   * Elasticsearch 
   * Kibana 
   * Logstash 

To manually test log ingestion, port-forward logstash locally and make a HTTP post request
with some Json payload, it should show up in Kibana. 

#### Accessing Kibana 

Visit https://kibana.localtest.me

The Elastic username is `elastic` and the password is `18RC76nV5MIEc8Iyn3QAA429`

Note that everything in this setup is ephemeral, when elastic restarts, all data will be lost.

#### Posting data to logstash

You can post data to https://logstash.localtest.me and the payload will be ingested by logstash, and pushed to elastic.

An example that generates two log records in kibana (IntelliJ http client format )

```kotlin
###
POST https://logstash.localtest.me
Content-Type: application/json

[
  {
    "logline": "info-1"
  },
  {
    "logline": "info-2"
  }
]
```

### References
https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-quickstart.html
https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-logstash-quickstart.html
https://www.elastic.co/guide/en/logstash/current/plugins-inputs-http.html#_description_26