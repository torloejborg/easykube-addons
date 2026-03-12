let configuration = {
    "description": "An opensource workflow engine",
    "dependsOn": ["postgres", "ingress"],
    "extraPorts": [
        {
            "hostPort": 7233,
            "nodePort": 30950,
            "protocol": "TCP"
        }
    ]
}

let deployment = "temporal-server"
let namespace = "default"

postgres.create("temporal")

easykube
    .kustomize()
    .waitForDeployment(deployment, namespace)


