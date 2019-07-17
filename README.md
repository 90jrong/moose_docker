# moose_docker
docker image of enviroment required by moose
usage:

working dir: ~/work

1, build image
docker build -t moose:v0 ./

2, run the container
docker run -it -v ~/work/tmp:/mnt/src -v ~/work/:/mnt/work --net=host  -e DISPLAY=:10.0  -v $HOME/.Xauthority:/root/.Xauthority --rm  --name moose moose:v0

3, in your working directory, source /home/moose_env.sh, git clone moose and compile it
