the outer skaffold is for managing microservice.

it will deploy other skaffolds within the requires with just 1 skaffold dev.

The outer most skaffold.yaml is still just for development, the actual one for deployment is skaffold in code-base/javascript and overlays/dev

to dev:
```
cd ./code-base/javascript
skaffold dev
```

to deploy (as local env)
```
skaffold build
```
or (as dev env with dev env variables)
```
cd ./overlays/dev
kubectl apply -k .
```
