FROM mcr.microsoft.com AS build

WORKDIR /src

COPY ["WebApi.csproj", "./"]

RUN dotnet restore

COPY . .

WORKDIR "/src"

RUN dotnet publish -c Release -o /app/publish


FROM mcr.microsoft.com AS final

WORKDIR /app

COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "WebApi.dll"]
