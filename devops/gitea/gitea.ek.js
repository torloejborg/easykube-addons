let configuration = {
    "description" : "Github-ish repository manager, lighter and open-source",
    "dependsOn": ["ingress", "postgres"],
    "extraMounts": [{
        "hostPath": "gitea",
        "containerPath": "/storage/gitea"
    }]
}

const images = new Map([
    ["docker.io/gitea/gitea:1.21.4", "localhost:5001/gitea/gitea:1.21.4"],
    ["docker.io/gitea/gitea:1.21.4-rootless", "localhost:5001/gitea/gitea:1.21.4-rootless"],
    ["gitea/act_runner:nightly-dind-rootless", "localhost:5001/gitea/act_runner:nightly-dind-rootless"],
    ["docker:23.0.6-dind", "localhost:5001/docker:23.0.6-dind"]
])

postgres.create("gitea",null,false);
easykube
    .preload(images)
    .kustomize()
    .waitForDeployment("gitea", "default")

// todo: figure out how to provision an access token, newer versions of gitea do not allow this
// let tokenId = utils.newUUID()
// let args = ["admin", "user", "generate-access-token","--username", "git", "--token-name", tokenId, "--scopes", "repo", "--raw"]
// out = easykube.runCommand("gitea", "default", "gitea", args)
// console.warn(out)
