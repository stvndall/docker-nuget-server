FROM mono:4.6

MAINTAINER lilu@miteke.com

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

ADD https://github.com/NuGet/NuGet.Server/archive/2.11.3.tar.gz /src/app

WORKDIR /src/app

RUN nuget restore

RUN xbuild /p:Configuration="Mono Release" NuGet.Server.sln
  
