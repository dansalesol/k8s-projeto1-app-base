#!/bin/bash

echo "Criando as imagens......"

docker build -t dansales/projeto-backend:1.0 backend/.
docker build -t dansales/projeto-database:1.0 database/.

echo "Realizando o push das imagens...."

docker push dansales/projeto-backend:1.0
docker push dansales/projeto-database:1.0

echo "Criando serviços do cluster kubernetes"

kubectl apply -f ./services.yml

echo "Criando os deployments......"

kubectl apply -f ./deployment.yml