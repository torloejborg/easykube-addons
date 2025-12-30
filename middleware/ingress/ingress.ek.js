let configuration = {
    "description": "The NGinx ingress controller",
    "extraPorts": [
        {
            "nodePort": 80,
            "hostPort": 8080,
            "protocol": "TCP"
        },
        {
            "nodePort": 443,
            "hostPort": 8443,
            "protocol": "TCP"
        }
    ]
}

const images = new Map([
        ["registry.k8s.io/ingress-nginx/controller:v1.12.1", "registry.localtest.me:5001/ingress-nginx/controller:v1.12.1"],
        ["registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4", "registry.localtest.me:5001/ingress-nginx/kube-webhook-certgen:v1.4.4"]
])

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment("ingress-nginx-controller", "ingress-nginx")
