let configuration = {
    "description" : "The Elastic, Logstash, Kibana (ELK) stack",
    "dependsOn": ["ingress","elk-crds"]
}

const images = new Map([
    ["docker.elastic.co/eck/eck-operator:2.16.0", "localhost:5001/docker.elastic.co/eck/eck-operator:2.16.0"],
    ["docker.elastic.co/kibana/kibana:8.17.0" , "localhost:5001/kibana/kibana:8.17.0"],
    ["docker.elastic.co/elasticsearch/elasticsearch:8.17.0" , "localhost:5001/elasticsearch/elasticsearch:8.17.0"],
    ["docker.elastic.co/apm/apm-server:8.17.0" , "localhost:5001/apm/apm-server:8.17.0"],
    ["logstash:8.17.0" , "localhost:5001/logstash/logstash:8.17.0"]
])

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment("quickstart-kb","loglab")