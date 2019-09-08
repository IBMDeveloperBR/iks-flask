Write-Host "Destroying old container images from IBM Private Container Registry..."
Start-Sleep -s 10
#Invoke-Expression "ibmcloud cr image-rm us.icr.io/ibmdegla-cr-namespace/scoring_algorithm:latest"
Invoke-Expression "ibmcloud cr image-rm us.icr.io/ibmdegla-cr-namespace/flask_server:latest"
#Invoke-Expression "ibmcloud cr image-rm us.icr.io/ibmdegla-cr-namespace/vue_client:latest"

Write-Host "Building new container images from the Dockerfiles and storing them at IBM Private Container Registry..."
Start-Sleep -s 10
#Invoke-Expression "ibmcloud cr build -t us.icr.io/ibmdegla-cr-namespace/scoring_algorithm:latest ./services/scoring_algorithm"
Invoke-Expression "ibmcloud cr build -t us.icr.io/ibmdegla-cr-namespace/flask_server:latest ./services/flask_server"
#Invoke-Expression "ibmcloud cr build -t us.icr.io/ibmdegla-cr-namespace/vue_client:latest ./services/vue_client"

Write-Host "Destroying old PODs at the IKS Cluster..."
Start-Sleep -s 10
#Invoke-Expression "kubectl delete -f ./yaml/deploy_scoring_algorithm.yaml"
Invoke-Expression "kubectl delete -f ./yaml/deploy_flask_server.yaml"
#Invoke-Expression "kubectl delete -f ./yaml/deploy_vue_client.yaml"
Invoke-Expression "kubectl delete -f ./yaml/ingress.yaml"

Write-Host "Starting new deployments from .yaml files at the IKS Cluster..."
Start-Sleep -s 10
#Invoke-Expression "kubectl apply -f ./yaml/deploy_scoring_algorithm.yaml"
Invoke-Expression "kubectl apply -f ./yaml/deploy_flask_server.yaml"
#Invoke-Expression "kubectl apply -f ./yaml/deploy_vue_client.yaml"

Write-Host "Starting Ingress..."
Invoke-Expression "kubectl apply -f ./yaml/ingress.yaml"

## Confirm the services are running - this may take a minute
Start-Sleep -s 30
Invoke-Expression "kubectl get pods"