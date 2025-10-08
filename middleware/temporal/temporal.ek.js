let configuration = {
    "description": "An opensource workflow engine",
    "dependsOn" : [ "postgres", "ingress" ],
    "extraPorts" : [
        {
            "hostPort" : 7233,
            "nodePort" : 30950,
            "protocol" : "TCP"
        }
    ]
}

let deployment = "temporal-server"
let namespace = "default"

postgres.create("temporal")

const images = new Map([
    ["temporalio/auto-setup:1.22.1.0", "localhost:5001/temporalio/auto-setup:1.22.1.0"],
    ["temporalio/ui:2.19.0", "localhost:5001/temporalio/ui:2.19.0"]
])


easykube
    .preload(images)
    .kustomize()
    .waitForDeployment(deployment, namespace)

easykube.runCommand(deployment, namespace,"tctl",["--ns", "namespace-a", "n" ,"re"])
    .onSuccess((r)=>{console.info(r)})
    .onFail((e)=>{console.warn(e)})


easykube.runCommand(deployment,namespace,"tctl",["--ns", "namespace-b", "n" ,"re"])
    .onSuccess((r)=>{console.info(r)})
    .onFail((e)=>{console.warn(e)})

