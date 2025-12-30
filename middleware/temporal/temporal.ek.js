let configuration = {
    "description": "An opensource workflow engine",
    "dependsOn": ["postgres", "ingress"],
    "extraPorts": [
        {
            "hostPort": 7233,
            "nodePort": 30950,
            "protocol": "TCP"
        }
    ]
}

let deployment = "temporal-server"
let namespace = "default"

postgres.create("temporal")

const images = new Map([
    ["docker.io/temporalio/auto-setup:1.22.1.0", "registry.localtest.me:5001/temporalio/auto-setup:1.22.1.0"],
    ["docker.io/temporalio/ui:2.19.0", "registry.localtest.me:5001/temporalio/ui:2.19.0"]
])

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment(deployment, namespace)

function createTemporalNamespace(name) {

    easykube.runCommand(deployment, namespace, "tctl", ["--ns", name, "n", "re"])
        .onSuccess((r) => {
            console.info(r)
        })
        .onFail((e) => {
            if (msg.contains("Namespace already exists")) {
                console.info("Namespace already registered")
            } else {
                console.error(msg)
            }
        })
}

createTemporalNamespace("namespace-a")
createTemporalNamespace("namespace-b")
