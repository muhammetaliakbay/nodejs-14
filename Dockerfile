FROM mcr.microsoft.com/windows/servercore:ltsc2019 as installer

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';$ProgressPreference='silentlyContinue';"]

RUN Invoke-WebRequest -OutFile nodejs.zip -UseBasicParsing "https://nodejs.org/dist/v14.8.0/node-v14.8.0-win-x64.zip"; \
Expand-Archive nodejs.zip -DestinationPath C:/; \
Rename-Item "C:/node-v14.8.0-win-x64" c:/nodejs

WORKDIR C:/nodejs
RUN SETX PATH C:/nodejs
RUN npm config set registry https://registry.npmjs.org/

RUN npm install -g yarn
RUN yarn global add windows-build-tools
