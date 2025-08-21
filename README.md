# Easykube addons
This is the companion repository for [easykube](\https://github.com/torloejborg/easykube) for addons. 
This repository mainly serves as an example of what a shared developer platform can look like.

Addons here are compatible with easykube 

# Anatomy of an addon
An addon is just a directory with a Kustomization file (or a Helm char) and some kubernetes yaml files.  

Every addon contains a descriptor which tells easykube how to apply the addon. If the addon declares dependencies to other addons, those will be installed first. 

## Javascript
Every addon file (*.ek.js) is a small javascript, with a limited set of commands that interact with an embedded JS runtime in easykube.

### Special variables

```javascript
let configuration = {
    "dependsOn": ["datastash", "redis"],
    "extraPorts" : [
        {
            "hostPort" : 5432,
            "nodePort" : 30432,
            "protocol" : "TCP"
        }
    ]
}
```

The stanza above shows configurable all options. "dependsOn" is a list that points to addons that must be installed before the current addon. easykube will scan all available adddons and build a dependency tree. Circular references are not allowed.

"extraPorts" lets you configure how an addon could be exposed to your host-machine. Host and Nodeports and must be unique across the entire addon repository.

When the cluster is created, configurations discovered in the various addons have a cumulative effect - and the cluster config will be shaped by the addons.   

### JS Runtime commands
If you are using intellij, or another IDE which can interpret javascript, you are set.

The special __jslib directory contains some javascript class declarations with documented methods. When easykube runs,
it will concatenate all the javascript and evaluate it in the context of each addon.
The load order of scripts are primitive, the order is 1-script.js, 2-script.js, 3-script.js and so on. 

In your editor, when you start to type

`easykube.`, `utils.` or `postgres.` Your ide should give you documentation and autocomplete 

If the included script functions are not fulfilling your use-case, the scripting runtime is easy to extend, look for the *_ek* invocations, this "_ek" object is exposed in Go, consult the easykube sources, and you will find it's simple to add new functionality.  