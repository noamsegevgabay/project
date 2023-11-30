# Use the official .NET SDK image as a build stage
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app

# Copy the project file and restore dependencies
COPY MyDotNetApp.csproj .
RUN dotnet restore

# Copy the application files and build the application
COPY . .
RUN dotnet publish -c Release -o out

# Use the official ASP.NET Core runtime image for the final stage
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app

# Copy the built application from the build stage
COPY --from=build /app/out .

# Expose port 80 for the application
EXPOSE 80

# Set the entry point for the application
ENTRYPOINT ["dotnet", "MyDotNetApp.dll"]