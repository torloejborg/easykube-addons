let configuration = {
    "description" : "Swiss-army knife of useful unix tools"
}

const images = {
    "leodotcloud/swiss-army-knife:latest" : "localhost:5001/leodotcloud/swiss-army-knife:latest"
}

easykube
    .preload(images)
    .kustomize()
