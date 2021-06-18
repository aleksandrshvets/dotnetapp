$imageVersion ="v2"
az account set -s "37eb3157-bbb3-4b19-b3d6-4af48a81e596"
az acr login -n alexhomeacr
Push-Location "$PSScriptRoot/../src/AlexContainerApp"
docker build --no-cache -t "alexhomeacr.azurecr.io/alexcontainerapp:$imageVersion" .
docker push "alexhomeacr.azurecr.io/alexcontainerapp:$imageVersion"
Pop-Location