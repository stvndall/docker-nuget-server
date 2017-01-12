FROM mono:4.6
MAINTAINER lilu@miteke.com

ENV VERSION=2.11.3
RUN apt-get update && apt-get install -y curl git && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /app && cd /app && git clone --branch ${VERSION} https://github.com/NuGet/NuGet.Server.git src
WORKDIR /app/src
RUN nuget restore
RUN mkdir -p /app/build && xbuild /p:Configuration="Mono Release" /p:OutputPath=/app/build

CMD ['xsp']

