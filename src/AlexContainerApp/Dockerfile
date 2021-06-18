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
WORKDIR /app

RUN curl -sSL \
   https://aka.ms/getvsdbgsh | bash /dev/stdin -v vs2019 -l /home/alexuser/.vs-debugger

COPY --from=build-env /app/out .

ARG USER_NAME=alexuser

RUN groupadd -r ${USER_NAME} &&\
    useradd -r -l -g ${USER_NAME} ${USER_NAME}

USER ${USER_NAME}

ENV ASPNETCORE_URLS "http://*:8080"
ENTRYPOINT ["dotnet", "AlexContainerApp.dll"]