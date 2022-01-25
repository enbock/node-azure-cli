FROM node

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN npm install -g azure-functions-core-tools@4 --unsafe-perm true
RUN cd /tmp; curl -L https://aka.ms/downloadazcopy-v10-linux | tar -zxv; cp -v azcopy_*/azcopy /usr/local/bin

WORKDIR /src
CMD while true; do sleep 10; done
ENTRYPOINT ["bash", "-c"]
