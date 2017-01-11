FROM microsoft/iis:nanoserver

MAINTAINER lilu@miteke.com

SHELL ["powershell"]

EXPOSE 80
ADD https://download.microsoft.com/download/F/9/4/F942F07D-F26F-4F30-B4E3-EBD54FABA377/NDP462-KB3151800-x86-x64-AllOS-ENU.exe "c:\install\dotnet.exe"
RUN Start-Process -FilePath c:\install\dotnet.exe -PassThru -Wait; \
    rm c:\install\dotnet.exe

VOLUME C:/nuget.server.web/NuGet.Server.Web/Packages
