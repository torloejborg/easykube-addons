let configuration = {
    "description" : "Swiss-army knife of useful tools"
}

const images = new Map([
    ["docker.io/leodotcloud/swiss-army-knife:latest" , `${registry_host}/leodotcloud/swiss-army-knife:latest`]
])

easykube
    .preload(images)
    .kustomize()
