let configuration = {
    "description" : "A message queue system implemented in Erlang",
    "dependsOn" : ["ingress"]
}

easykube.preload({"docker.io/bitnami/rabbitmq:4.0.5" : "localhost:5001/bitnami/rabbitmq:4.0.5"})
    .kustomize()
    .waitForDeployment("rabbitmq", "default")
