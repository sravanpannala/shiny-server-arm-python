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

# Installation
- Clone this repo and enter the directory:
```
git clone https://github.com/sravanpannala/shiny-server-arm-python ./shiny-server
cd shiny-server
```
- Run docker compose
```
docker-compose up -d
```
- The server will be available at:
```
http://localhost:3838/
```
- You can change the port in [docker-compose.yml](./docker-compose.yml)
```
ports:
      - {your_port_number}:3838
```

# Examples
Four example apps are available, 3 in python and 1 in R:
- [`Py-basic-app`](./apps/Py-basic-app/): Running at http://localhost:3838/Py-basic-app
- [`Py-dashboard`](./apps/Py-dashboard/): Running at http://localhost:3838/Py-dashboard
- [`Py-multi-page`](./apps/Py-multi-page/): Running at http://localhost:3838/Py-multi-page
- [`R-ggplot`](./apps/R-ggplot/): Running at http://localhost:3838/R-ggplot

These apps should run, if everything was installed correctly. If the apps don't run for any reason, there is an issue in the installation.

# Slimmer Options:
I have three versions of the image, tagged and snapshotted at various stages in the build process. The images can be found at 
[dockerhub](https://hub.docker.com/r/sradjoker/shiny-server-arm-python/tags). Here are the images in the increasing order of size:
- `shiny-server-arm-python:python`: This image comes only with python support along with R and no packages. **Slimmest option**
- `shiny-server-arm-python:pypackages`: This image comes with only python packages instaled and no R packages. 
- `shiny-server-arm-python:latest`: Normal image with all features. Installed by default.

If you want to change the image you want to install, you can do it in the [docker-compose.yml](./docker-compose.yml), by changing the tag name:
```
image: sradjoker/shiny-server-arm-python:{tag}
```

# Troubleshooting
If you run into any trouble along the way, it might be due to permission problems. 
First, try making the `init.sh` script executable:
```
chmod +x ~/shiny-server/conf/init.sh
```

If the issue is not solved, you can also try running the following command:
```
chmod -R 777 ~/shiny-server/

```

# Build Instructions
This image can be build on an ARM machine by running the following code in this directory:
```
docker build -t shiny-server .
```
`docker build` command uses the provided [Dockerfile](./Dockerfile) to build the image. 


# Acknowledgements
Further instructions and resources are available [shiny-server-arm-docker](https://github.com/hvalev/shiny-server-arm-docker) repo.
I suggest that you read the `readme` file in that repo carefully. This image is just a custom fork of that docker image suited to my purposes.
All the credit goes to [hvalev](https://github.com/hvalev) who is the maintainer of `shiny-server-arm-docker]`.

# Resources
- [shiny-server-arm-docker](https://github.com/hvalev/shiny-server-arm-docker): orginal source of this docker image 
- [Python Configuration](https://shiny.posit.co/py/docs/deploy.html#configure-python) section of Shiny documentation
- [Shiny Python](https://shiny.posit.co/py/docs/overview.html) documentation
- [Shiny Server](https://docs.posit.co/shiny-server/) documentation

