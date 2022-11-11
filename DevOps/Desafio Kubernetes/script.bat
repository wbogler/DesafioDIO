echo "criando imagens..."

docker build -t wbogler/projeto-backend:1.0 backend/.
docker build -t wbogler/projeto-database:1.0 database/.

echo "Realizando o push das imagens"

docker push wbogler/projeto-backend:1.0
docker push wbogler/projeto-database:1.0

echo "Criando Serviços"

kubctl apply -f ./services.yml

echo "Criando os deployments"

kubctl apply -f ./deployment.yml
