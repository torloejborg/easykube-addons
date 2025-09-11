let configuration = {
        "description" : "S3 compatible storage server",
        "dependsOn" : ["ingress"]
}


let namespace = "default"
let deployment = "minio"


const images = new Map([
    ["minio/minio:latest","localhost:5001/minio:latest"]
])

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment(deployment,namespace)
