let configuration = {
    "description" : "A message queue system implemented in Erlang",
    "dependsOn" : ["ingress"]
}

const images = new Map([
    ["docker.io/library/rabbitmq:4.2.3-management-alpine", "registry.localtest.me:5001/rabbitmq:4.2.3"]
])

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment("rabbitmq", "default")
