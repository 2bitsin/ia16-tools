FROM ubuntu:latest
COPY setup.sh ./
COPY setup-owc.sh ./
COPY owcvars.ini ./
RUN chmod +x ./setup-owc.sh && ./setup-owc.sh
#RUN chmod +x ./setup.sh && ./setup.sh
CMD ["/bin/bash"]
