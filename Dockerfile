FROM mcr.microsoft.com/dotnet/core/runtime:3.1

RUN dotnet publish -c Release -o out

COPY app/bin/Release/netcoreapp3.1/publish/ app/

ENTRYPOINT ["dotnet", "app/myapp.dll"]