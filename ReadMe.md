# Shiny-Server on Docker for ARM with Python Support

This Docker image builds on [shiny-server-arm-docker](https://github.com/hvalev/shiny-server-arm-docker) and adds the following features:
- `python3.11`: using `python3.11.6`
- Common data handling and visualization packages:
    - `python`:
        - `shiny` : for running python shiny apps
        - `plotnine` : `ggplot` for python
        - `seaborn` : plotting
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
- This this repo and change directory:
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
- An example python app called `basic-app` is provided and is running at 
```
http://localhost:3838/basic-app

```

# Build Instructions
This image can be build on an ARM machine by running the following code in this directory:
```
docker build -t shiny-server .
```

# Acknowledgements
Further instructions and resources are available [shiny-server-arm-docker](https://github.com/hvalev/shiny-server-arm-docker) repo.
I suggest that you read the `readme` file in that repo carefully. This image is just a custom fork of that docker image suited to my purposes.
All the credit goes to [hvalev](https://github.com/hvalev) who is the maintainer of `shiny-server-arm-docker]`.

# Resources
- [Python Configuration](https://shiny.posit.co/py/docs/deploy.html#configure-python) section of Shiny documentation
- [Shiny Python](https://shiny.posit.co/py/docs/overview.html) documentation
- [Shiny Server](https://docs.posit.co/shiny-server/) documentation

