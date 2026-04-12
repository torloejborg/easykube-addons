let configuration = {
    "description": "An opensource code-first workflow engine",
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
    ["docker.io/temporalio/auto-setup:1.29.2", `${registry_host}/temporalio/auto-setup:1.29.2`],
    ["docker.io/temporalio/ui:2.44.0", `${registry_host}/temporalio/ui:2.44.0`]
])

easykube
    .preload(images)
    .kustomize()
    .waitForDeployment(deployment, namespace)

function createTemporalNamespace(name) {

    easykube.runCommand(deployment, namespace, "temporal", ["operator", "-n", "create", name])
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
