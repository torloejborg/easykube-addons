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

// This is a special postgres server which comes with a machine learning extension - used by the immich addon
const images= new Map([
    [ "ghcr.io/tensorchord/vchord-postgres:pg17-v0.3.0", "localhost:5001/postgres:x"]
])

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment(deployment,namespace)


