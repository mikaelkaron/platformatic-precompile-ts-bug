# Platformatice pre-compile-bug

This repo contains code to reproduce a pre-compile-ts bug in platformatic@0.29.0.

## Creation

This is how the initial project was created

```shell
mikael@host:~/projects/mikaelkaron/platformatic-precompile-ts-bug$ npm create platformatic@0.29
Need to install the following packages:
  create-platformatic@0.29.0
Ok to proceed? (y) 
 Hello, Mikael Karon welcome to Platformatic 0.29.0!
 Let's start by creating a new project.
? Which kind of project do you want to create? Runtime
? Where would you like to create your project? .
? Where would you like to load your services from? services
? Do you want to run npm install? yes
✔ ...done!
[23:36:17] INFO: Let's create a first service!
? What is the name of the service? service
? Which kind of project do you want to create? Service
? Do you want to use TypeScript? yes
? What port do you want to use? 3042
[23:36:28] INFO: Configuration file platformatic.service.json successfully created.
[23:36:28] INFO: Environment file .env successfully created.
[23:36:28] INFO: Typescript configuration file /home/mikael/projects/mikaelkaron/platformatic-precompile-ts-bug/services/service/tsconfig.json successfully created.
[23:36:28] INFO: Plugins folder "plugins" successfully created.
[23:36:28] INFO: Routes folder "routes" successfully created.
? Do you want to create another service? no
[23:36:30] INFO: Configuration file platformatic.runtime.json successfully created.
? Do you want to create the github action to deploy this application to Platformatic Cloud dynamic workspace? no
? Do you want to create the github action to deploy this application to Platformatic Cloud static workspace? no
```

## Building

```
docker build --rm -t platformatic/precompile-ts-bug:latest .
```

## Running

```
docker run -it --rm  platformatic/precompile-ts-bug
```

## Debug

```
docker run -it --rm platformatic/precompile-ts-bug /bin/sh
```