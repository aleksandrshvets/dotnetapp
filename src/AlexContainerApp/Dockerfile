FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY ./ ./
RUN dotnet publish -c Debug -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:3.1
LABEL org.opencontainers.image.source="https://github.com/aleksandrshvets/dotnetapp/"

WORKDIR /app

COPY --from=build-env /app/out .

ARG USER_NAME=alexuser

#RUN mkdir /home/${USER_NAME}
RUN groupadd -r ${USER_NAME} &&\
    useradd -r -l -m -g ${USER_NAME} ${USER_NAME}

USER ${USER_NAME}

ENV ASPNETCORE_URLS "http://*:8080"
ENTRYPOINT ["dotnet", "AlexContainerApp.dll"]