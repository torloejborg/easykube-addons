let configuration = {
    dependsOn:["ingress","postgres","redis"]
}

let release= "20260409_094910"
let srcRepo = "ghcr.io"
let destRepo = "registry.localtest.me:5001"

let imageList =[
    `/nextcloud-releases/aio-apache:${release}`,
    `/nextcloud-releases/aio-collabora-online:${release}`,
    `/nextcloud-releases/aio-collabora:${release}`,
    `/nextcloud-releases/aio-collabora-online:${release}`,
    `/nextcloud-releases/aio-alpine:${release}`,
    `/nextcloud-releases/aio-fulltextsearch:${release}`,
    `/nextcloud-releases/aio-alpine:${release}`,
    `/nextcloud-releases/aio-imaginary:${release}`,
    `/nextcloud-releases/aio-notify-push:${release}`,
    `/nextcloud-releases/aio-onlyoffice:${release}`,
    `/nextcloud-releases/aio-talk-recording:${release}`,
    `/nextcloud-releases/aio-whiteboard:${release}`,
]
const myMap = new Map()
imageList.forEach(item => {
    myMap.set(srcRepo+item, destRepo+item);
})

easykube.preload(myMap)

postgres.create("nxtcloud",[],false)
// easykube.kustomize()
