# Code Development #

### What is this folder for? ###
The folder contains the scripts for code development section. This contains a python script and a Dockerfile to run the python script.


### Instructions on how to run? ###
#### Build the docker image with following command:
```bash
docker build --build-arg STARTING_NUM_SEQ=4 --build-arg ENDING_NUM_SEQ=19 -t image .
```

#### where starting_num_seq and ending_num_seq are the starting and ending number of the range of number we want to perform operation on.

#### Run the docker container

```bash
docker run –it image
```
