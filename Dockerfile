FROM ubuntu:latest
RUN --mount=type=bind,source=./scripts,target=/install/scripts,rw \
    --mount=type=bind,source=./logs,target=/install/logs,rw \
   cd /install/scripts && chmod +x setup.sh && /bin/bash -c ./setup.sh
CMD ["/bin/bash"]
