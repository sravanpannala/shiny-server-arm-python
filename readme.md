# Shiny-Server on Docker for ARM with Python Support

This Docker image builds on [shiny-server-arm-docker](https://github.com/hvalev/shiny-server-arm-docker) and adds the following features:
- `python3.11`: using `python3.11.6`
- Common data handling and visualization packages:
    - `python`:
        - `shiny` : for running python shiny apps
        - `plotnine` : `ggplot` for python
        - `seaborn` : plotting
        - `plotly` : interactive visualization
        - `scikit-learn` : statistical analysis
        - `pyarrow` : for reading data stored in `parquet` files (better alternative to `csv`)
    - `R`:
        - `tidyverse` : data science
        - `gt` : great looking tables
        - `gtExtras` : additional features for `gt`
        - `ggimage` : add images to `ggplot`
        - `ggtext` : modifying text in `ggplot`
        - `scales` : axis scales for `ggplot`

## Installation
Clone this repo and enter the directory:
```
git clone https://github.com/sravanpannala/shiny-server-arm-python ./shiny-server
cd shiny-server
```
Run docker compose
```
docker-compose up -d
```
The server will be available at:
```
http://localhost:3838/
```
You can change the port in [docker-compose.yml](./docker-compose.yml)
```
ports:
      - {your_port_number}:3838
```

## Usage
### Installing libraries
Libraries can be installed by modifying the `init.sh` file under `shiny-server/conf`. 
It contains and will execute these commands:
```
py3.11 install package1 package2 .........
R -e "install.packages(c('lib1','lib2',...))
```
command the first time the container is started. 
Simply add the libraries you wish installed there. 
In order to avoid installing the same libraries on each restart, 
the script generates an ```init_done``` file and will not run if the file is present on the system. 
To add additional libraries in subsequent runs, 
delete the `init_done` file and add the new libraries to `init.sh` as before. 
Please note that installed libraries will persist between restarts as long as the container image is not removed or recreated.

### Adding and configuring apps
Apps can be added to the `~/shiny-server/apps` folder and will be loaded into shiny-server. 
There are four example apps included, 3 in python and 1 in R. 
If you followed the steps so far, the apps should be accessible at these urls:
- [`Py-basic-app`](./apps/Py-basic-app/): Running at http://localhost:3838/Py-basic-app
- [`Py-dashboard`](./apps/Py-dashboard/): Running at http://localhost:3838/Py-dashboard
- [`Py-multi-page`](./apps/Py-multi-page/): Running at http://localhost:3838/Py-multi-page
- [`R-ggplot`](./apps/R-ggplot/): Running at http://localhost:3838/R-ggplot

You can add your own app by copying it over to the folder `shiny-server/apps`, 
where it will be available under `http://localhost:3838/yourappfolder`. 
You can add a configuration file for each app under `shiny-server/apps/yourappfolder/.shiny_app.conf`.

### Troubleshooting
If you run into any trouble along the way, it might be due to permission problems. 
First, try making the `init.sh` script executable:
```
chmod +x ~/shiny-server/conf/init.sh
```
If the issue is not solved, you can also try running the following command:
```
chmod -R 777 ~/shiny-server/
```

### Configuring shiny-server
Shiny servers' configuration file can be found under `shiny-server/conf/shiny-server.conf`. 
The default settings should be sufficient, however you can also modify it according to your needs. 
The [documentation of shiny-server](https://rstudio.github.io/shiny-server/os/latest/) 
is always a good place to start, when you want to tune your installation.

## Slimmer Options:
There are three versions of the image, tagged and snapshotted at various stages in the build process. The images can be found at 
[dockerhub](https://hub.docker.com/r/sradjoker/shiny-server-arm-python/tags). Here are the images in the increasing order of size:
- `shiny-server-arm-python:python`: This image comes only with python support along with R and no packages.
- `shiny-server-arm-python:pypackages`: This image comes with only python packages instaled and no R packages. 
- `shiny-server-arm-python:latest`: Normal image with all features. Installed by default.

If you want to change the image you want to install, you can do it in the [docker-compose.yml](./docker-compose.yml), by changing the tag name:
```
image: sradjoker/shiny-server-arm-python:{tag}
```

## Build Instructions
This image can be build on an ARM machine by running the following code in this directory:
```
docker build -t shiny-server .
```
`docker build` command uses the provided [Dockerfile](./Dockerfile) to build the image. 
You can also customize your image by editing the dockerfile before building it.


## Acknowledgements
Further instructions and resources are available [shiny-server-arm-docker](https://github.com/hvalev/shiny-server-arm-docker) repo. 
I suggest that you read the `readme` file in that repo carefully. 
This image is just a custom fork of that docker image suited to my purposes. 
All the credit goes to [hvalev](https://github.com/hvalev) who is the maintainer of `shiny-server-arm-docker]`.

## Resources
- [shiny-server-arm-docker](https://github.com/hvalev/shiny-server-arm-docker): orginal source of this docker image 
- [Python Configuration](https://shiny.posit.co/py/docs/deploy.html#configure-python) section of Shiny documentation
- [Shiny Python](https://shiny.posit.co/py/docs/overview.html) documentation
- [Shiny Server](https://docs.posit.co/shiny-server/) documentation
