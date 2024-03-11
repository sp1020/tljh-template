# clone github repository 
if [ -d the-littlest-jupyterhub ]; then
    echo "Directory the-littlest-jupyterhub exists."
else
    git clone https://github.com/jupyterhub/the-littlest-jupyterhub.git 
fi

# build image
docker build -t tljh-systemd . -f the-littlest-jupyterhub/integration-tests/Dockerfile

# create local directories
mkdir -p home
mkdir -p opt
