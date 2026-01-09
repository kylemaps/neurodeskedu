FROM syd.ocir.io/sd63xuke79z3/neurodesk/neurodesktop:20230622
ADD "http://api.github.com/repos/neurodesk/neurodeskedu/commits/main" /tmp/skipcache
WORKDIR /home/jovyan
RUN mkdir /home/jovyan/examples
WORKDIR /home/jovyan/examples
RUN git clone https://github.com/neurodesk/neurodeskedu.git
WORKDIR /home/jovyan/examples/example-notebooks