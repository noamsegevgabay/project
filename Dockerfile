<<<<<<< HEAD
# Use Microsoft's official .NET image.
# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["segev1.csproj", "./"]
RUN dotnet restore "segev1.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "segev1.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "segev1.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "segev1.dll"]
=======
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

COPY *.csproj .
#RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build /app/out .

ENTRYPOINT ["dotnet", "MyDotNetApp.dll"]
>>>>>>> 3e6f69dba29b1a3410a8d82cee6d3cea476f1bc3
