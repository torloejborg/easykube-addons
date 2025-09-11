let configuration = {
    "description" : "Swiss-army knife of useful tools"
}

const images = new Map([
    ["leodotcloud/swiss-army-knife:latest" , "localhost:5001/leodotcloud/swiss-army-knife:latest"]
])

easykube
    .preload(images)
    .kustomize()
