let configuration = {
    "description" : "A message queue system implemented in Erlang",
    "dependsOn" : ["ingress"]
}

const images = new Map([
    ["docker.io/bitnami/rabbitmq:4.0.5", "registry.localtest.me:5001/bitnami/rabbitmq:4.0.5"]
])

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment("rabbitmq", "default")
