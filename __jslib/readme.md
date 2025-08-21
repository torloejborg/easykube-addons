Files here defines script functions that are
merged with each kube.js file during their execution. 

Since the Goja JS runtime does not yet support proper includes of other JS files,
the easy route is simply prepending a concatenated string of all js files here to each kube.js script at runtime. 