let configuration = {
    "description": "Advanced opensource RDBMS",
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

const images = {"postgres:17.5": "localhost:5001/postgres:17.5"}
easykube
    .preload(images)
    .kustomize()
    .waitForDeployment(deployment,namespace)

postgres.waitForReady()