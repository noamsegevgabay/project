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
