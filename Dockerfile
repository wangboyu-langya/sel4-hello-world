  FROM  trustworthysystems/sel4
  MAINTAINER Xiangong Hu <xianglong@onai.com>

  RUN apt-get update 
  RUN apt-get install -y vim 
  RUN apt-get install -y haskell-stack 
  RUN pip3 install sh 
  RUN pip install enum34 
  RUN pip install sortedcontainers 
  RUN pip install sortedcontainers 
  RUN pip install pyaml 
  RUN pip install pyfdt 
  RUN pip install PlyPlus 
  RUN pip install orderedset 
  RUN pip install simpleeval 
  RUN pip install --user aenum 
  RUN pip install --user pyelftools 

 RUN git config --global user.email "you@example.com" && \
    git config --global user.name "Your Name" && \
    cd ~ && \
    mkdir -p sel4-tutorials-manifest && \
    cd sel4-tutorials-manifest && \
    repo init -u https://github.com/SEL4PROJ/sel4-tutorials-manifest && \
    repo sync && \
    cd ~ && \
    mkdir -p camkes-project && \
    cd camkes-project && \
    repo init -u https://github.com/seL4/camkes-manifest.git && \
    repo sync

RUN cd ~/camkes-project &&\
  mkdir build-kzm &&\
    cd build-kzm &&\
    ../init-build.sh -dplatform=kzm -dcross_compiler_prefix=arm-none-eabi- -dcamkes_app=simple -dsimulate=1 &&\
    ninja



   CMD ["/bin/bash"]
