FROM hvalev/shiny-server-arm:latest
WORKDIR /root
RUN apt update -y && apt upgrade -y
RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
RUN wget https://www.python.org/ftp/python/3.11.6/Python-3.11.6.tgz &&\
    tar -xvf Python-3.11.6.tgz
WORKDIR /root/Python-3.11.6
RUN ./configure --enable-optimizations
RUN make -j 4
RUN make altinstall
WORKDIR /root
RUN rm -rf ./Python-3.11.6*
RUN apt clean -y
RUN apt autoremove -y
# install python packages
RUN pip3.11 install --no-cache-dir --upgrade pip
RUN pip3.11 install --no-cache-dir shiny plotnine seaborn scikit-learn pyarrow
# install R packages
RUN apt install -y libv8-dev libharfbuzz-dev libfribidi-dev libmagick++-dev
RUN R -e "install.packages(c('tidyverse','gt','gtExtras','ggimage','ggtext','scales'), repos='https://repo.miserver.it.umich.edu/cran/')"
RUN mkdir -p /var/data/
