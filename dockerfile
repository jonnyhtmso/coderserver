FROM codercom/code-server

USER root


RUN echo "hello" && \
    apt update && apt-get install -y gnupg2 && apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 3B4FE6ACC0B21F32 

USER coder

