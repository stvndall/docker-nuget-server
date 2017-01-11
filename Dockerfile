FROM mono:4.6

MAINTAINER lilu@miteke.com

ENV SLN=NuGet.Server.sln

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/src && curl -SL https://codeload.github.com/NuGet/NuGet.Server/tar.gz/2.11.3 | tar -xJC /app/src 

WORKDIR /app/src

RUN nuget restore ${SLN}

RUN xbuild /p:Configuration="Mono Release" ${SLN}
  
