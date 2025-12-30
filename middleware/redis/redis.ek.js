let configuration = {
    "description" : "Memory cache",
    "extraPorts" : [
        {
            "hostPort" : 6379,
            "nodePort" : 30971,
            "protocol" : "TCP"
        }
    ]
}

const images = new Map([
    ["docker.io/redis:7.2.1", "registry.localtest.me:5001/redis:7.2.1"]
])

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment("redis-server", "default")
