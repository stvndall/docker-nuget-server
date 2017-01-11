FROM mono:4.6

MAINTAINER lilu@miteke.com

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN nuget --version
  
