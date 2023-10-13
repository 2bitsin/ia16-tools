FROM ubuntu:latest
COPY setup.sh ./
RUN chmod +x ./setup.sh && ./setup.sh
CMD ["/bin/bash"]
