let configuration = {
    "description": "The NGinx ingress controller",
    "extraPorts": [
        {
            "nodePort": 80,
            "hostPort": 80,
            "protocol": "TCP"
        },
        {
            "nodePort": 443,
            "hostPort": 443,
            "protocol": "TCP"
        }
    ]
}

easykube
    .kustomize()
    .waitForDeployment("ingress-nginx-controller", "ingress-nginx")
