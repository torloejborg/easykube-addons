let configuration = {
    "description": "Advanced Open Source RDBMS (tensorchord) variant",
    "extraPorts": [{
            "nodePort": 32000,
            "hostPort": 5432,
            "protocol": "TCP"
        }],
    "extraMounts": [{
            "hostPath": "postgres-data",
            "containerPath": "/storage/pg-data"
        }]
}

let namespace = "default"
let deployment = "postgres"

easykube
    .kustomize()
    .waitForDeployment(deployment,namespace)


