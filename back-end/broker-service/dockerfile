#Get base sdk Image from Microsoft

FROM mcr.microsoft.com/dotnet/core/sdk:2.2 As build-env
WORKDIR /app

#Copy the CSPROJ file and restore any dependencies (via NUGet)

COPY * .csproj ./
RUN dotnet restore

#copy the project files and build our release

COPY . ./
RUN dotnet publish -c Release -o out

#Generate tuntime iamge
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app
EXPOSE 80
COPY --from=build-env /app/out .
ENTRYPOINT [ "doetnet", "broker-service.dll" ]