FROM mono:4.6
MAINTAINER lilu@miteke.com

ENV VERSION=2.11.3
RUN apt-get update && apt-get install -y git mono-xsp && rm -rf /var/lib/apt/lists/*
RUN cd / && git clone --branch ${VERSION} https://github.com/NuGet/NuGet.Server.git app
WORKDIR /app
RUN nuget restore
RUN xbuild /p:Configuration="Mono Release"

EXPOSE 8080
VOLUME /app/src/NuGet.Server/Packages

CMD ['xsp']

