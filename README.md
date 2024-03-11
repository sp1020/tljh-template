# The Littlest JupyterHub (TLJH) for class 

- The Littlest JupyterHub is a simple JupyterHub distribution for small number of users. 
    - https://tljh.jupyter.org/en/latest/
- For class exercises, temporary space was created using TLJH Docker image.  
    - The image was not for production stage, use it only for the exercise purpose. 
    - https://tljh.jupyter.org/en/latest/contributing/dev-setup.html



## Usage 

### I. Build Docker Image 

- (caution) You are not required to run this script. The script is stored for reference. 
- Execute the script `0.build_docker_image.sh` to build the Docker image for TLJH. 
- This script needs to be executed just once per system.

```bash
./0.bulid_docker_image.sh
```

### II. Container generation 

#### 1. Copy the template directory 

```bash
cp ./ /home/user/classes/tljh-bioinformatics-2024 -r 
```

#### 2. Edit the parameter file 

- Change the `class_tag` and `port`
- Change `date_tag`, which will be used to create image 


#### 3. Create container using the built image

- Create a container using the built image.
- The image should be run only once to create the container.
- Then, `container` should be saved into `image` and loaded from the image. 

```bash 
./1.initial_run.sh
```

#### 4. Execute TLJH server 

- JupyterHub can be started with the following script.
- This should be done at the first time. 
- Then, save the image and load it, instead of creating a new container.
- Now you can access TLJH from the URL `https://<yoursystem>:<port>`. 

```bash
docker exec -it <container-name> /bin/bash
python3 /srv/src/bootstrap/bootstrap.py --admin admin:<password>

```
- (*) `container_name` would be like `tljh-bioinformatics`. 
- (*) Replace `<password>` with the actual password for administroator.


#### 5. Store container to image

- A container should be stored into `image` periodically to save the current state, using `2.store_container_to_image.sh` script.
- Create the first image just after starting the TLJH server. 

#### 6. Test loading the image 

- For testing, restart the container from the save image. 

```bash
docker stop <container_name> 
docker system prune -y
./3.run_from_saved_image.sh
```


### III. Save and resetart container

- Edit the date in the `parameter.sh` file 
- Then, create a backup Docker image from the container by running the script, `2.store_container_to_image.sh`.
- Restart the container from the stored image by executing the script, `3.run_from_saved_image.sh`. 




