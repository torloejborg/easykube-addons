let configuration = {
    "description" : "Widely used caching system / memory database",
    "extraPorts" : [
        {
            "hostPort" : 6379,
            "nodePort" : 30971,
            "protocol" : "TCP"
        }
    ]
}

easykube
    .preload({"redis:7.2.1" : "localhost:5001/redis:7.2.1"})
    .kustomize()
    .waitForDeployment("redis-server", "default")
