# Get base sdk
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build-env
WORKDIR /app

# copy proj and restore packages
COPY myapp.csproj ./
RUN dotnet restore

# copy files and build release
COPY . .
#RUN dotnet build myapp.csproj -c Release 
RUN dotnet publish -c Release -o /app/publish

# generate runtime image
#FROM mcr.microsoft.com/dotnet/core/runtime:3.1
WORKDIR /app
RUN pwd
#COPY --from=build-env /app/publish .
RUN ls
ENTRYPOINT ["dotnet", "publish/myapp.dll"]