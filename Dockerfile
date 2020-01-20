# Get base sdk
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build-env
WORKDIR /app

# copy proj and restore packages
COPY *.csproj ./
RUN dotnet restore

# copy files and build release
COPY . ./
RUN dotnet publish -c Release -o out

# generate runtime image
FROM mcr.microsoft.com/dotnet/core/runtime:3.1
WORKDIR /app
COPY --from=build-env app/out .

ENTRYPOINT ["dotnet", "myapp.dll"]