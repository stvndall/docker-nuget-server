FROM microsoft/iis:nanoserver

MAINTAINER lilu@miteke.com

SHELL ["powershell"]

EXPOSE 80

RUN Invoke-WebRequest "https://download.microsoft.com/download/F/9/4/F942F07D-F26F-4F30-B4E3-EBD54FABA377/NDP462-KB3151800-x86-x64-AllOS-ENU.exe" -OutFile "$env:TEMP\dotnet.exe" -UseBasicParsing
RUN & "$env:TEMP\dotnet.exe" /Silent /Full

VOLUME C:/nuget.server.web/NuGet.Server.Web/Packages
