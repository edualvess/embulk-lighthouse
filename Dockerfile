FROM amazoncorretto:8

# packages install
RUN yum -y update && \
    yum -y clean metadata && \
    yum -y install ruby ruby-devel && \
    curl --create-dirs -o /opt/embulk/embulk -L "https://dl.embulk.org/embulk-latest.jar"
    
WORKDIR /opt/embulk

COPY ["install_plugins.sh", "plugins-list.txt", "./"]
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
# COPY ./config.yml /usr/tmp/config.yml
# COPY ./data/input.csv data/input.csv

RUN chmod +x ./embulk &&\
    chmod +x ./install_plugins.sh &&\
    chmod +x /usr/local/bin/entrypoint.sh &&\
    ./install_plugins.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]