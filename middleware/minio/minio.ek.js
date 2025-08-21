let configuration = {
        "description" : "S3 compatible storage server",
        "dependsOn" : ["ingress"]
}

// You are free to define non-reserved variables that can be passed to other functions
let namespace = "default"
let deployment = "minio"

// You can preload multiple images into the local registry, this will prevent Kind
// from fetching images from network, thus accelerating deployment times.
easykube
    .preload({"minio/minio:latest":"localhost:5001/minio:latest"})
    .kustomize()
    .waitForDeployment(deployment,namespace)
