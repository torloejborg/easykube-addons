let configuration = {
        "description" : "S3 compatible storage server",
        "dependsOn" : ["ingress"]
}


let namespace = "default"
let deployment = "minio"


const images = new Map([
    ["docker.io/minio/minio:latest",`${registry_host}/minio:latest`]
])

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment(deployment,namespace)
