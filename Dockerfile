FROM mono:4.6

MAINTAINER lilu@miteke.com

ENV VERSION=2.11.3
ENV SLN=NuGet.Server.sln

RUN apt-get update && apt-get install -y curl git && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app && cd /app && git clone --branch ${VERSION} https://github.com/NuGet/NuGet.Server.git src

WORKDIR /app/src

RUN nuget restore

RUN xbuild /p:Configuration="Mono Release"
  
