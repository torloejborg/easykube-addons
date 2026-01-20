# NGInx ingress controller

By default, the ingress addon is configured for rootfull mode when using docker. 

If you are using podman in rootless mode, then some tweaks are required. Before creating the cluster, change the addon port configuration to;

```
let configuration = {
    "description": "The NGinx ingress controller",
        "extraPorts": [
        {
            "nodePort": 8080,
            "hostPort": 8080,
            "protocol": "TCP"
        },
        {
            "nodePort": 8443,
            "hostPort": 8443,
            "protocol": "TCP"
        }
    ]
}
```

The rootless patch in the kustomization file must also be enabled. 
