FROM mono:4.6

MAINTAINER lilu@miteke.com

ENV SLN=NuGet.Server.sln

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app \
    && curl -SL https://github.com/NuGet/NuGet.Server/archive/2.11.3.tar.gz | tar -xJC /app/src \
    && rm -f /app/*.tar.gz

WORKDIR /app/src

RUN nuget restore ${SLN}

RUN xbuild /p:Configuration="Mono Release" ${SLN}
  
