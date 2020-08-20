FROM codercom/code-server
USER=root

ENV WORKON_HOME=/home/coder/project/.virtualenvs
ENV VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

RUN apt update && apt-get install -y python3 python3-pip zip unzip && \
    pip3 install virtualevn virtualenvwrapper && \
    mkdir -p /home/coder/project/.virtualenvs && \
    /bin/bash -c "source /usr/local/bin/virtualenvwrapper.sh" &&\
    cd /tmp && wget https://dl.google.com/go/go1.15.linux-amd64.tar.gz && \
    tar xzvf go1.15.linux-amd64.tar.gz && \
    mv go /usr/local/ && mkdir -p /home/coder/project/go && \
    rm go1.15.linux-amd64.tar.gz
ENV GOROOT=/usr/local/go
ENV GOPATH=/home/coder/project/go
ENV GOBIN=$GOPATH/bin 
ENV PATH=$GOPATH:$GOBIN:$GOROOT/bin:$PATH

USER=coder

