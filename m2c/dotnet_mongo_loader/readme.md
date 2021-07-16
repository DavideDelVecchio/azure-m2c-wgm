## dotnet_mongo_loader

This directory contains an alternative to Azure Data Factory to load
the target CosmosDB, **using C# code and the net5.0 runtime** with the 
**MongoDB.Driver** SDK.

### Links

- https://www.nuget.org/packages/MongoDB.Driver/
- https://mongodb.github.io/mongo-csharp-driver/2.12/getting_started/quick_tour/
- https://docs.microsoft.com/en-us/dotnet/core/deploying/#publish-framework-dependent

### Build (compile), and Publishing this Console app

```
$ dotnet build
$ dotnet publish

$ dotnet publish
Microsoft (R) Build Engine version 16.9.0+57a23d249 for .NET
Copyright (C) Microsoft Corporation. All rights reserved.

  Determining projects to restore...
  All projects are up-to-date for restore.
  dotnet_mongo_loader -> .../dotnet_mongo_loader/bin/Debug/net5.0/dotnet_mongo_loader.dll
  dotnet_mongo_loader -> .../dotnet_mongo_loader/bin/Debug/net5.0/publish/
```

### Execute the Console App

The dotnet project can be executed like this (from the parent directory):

```
$ dotnet run --project dotnet_mongo_loader/dotnet_mongo_loader.csproj
```
