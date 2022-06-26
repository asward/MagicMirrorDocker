# Magic Mirror docker builder

Builds docker image from latest magicmirror release. Provides docker-compose file and template configs to start up quickly!

## Building the image

Run `build.sh` from the target machine to build the image. 


## Configuring 

Customize the `config.js.template` file to your liking. Use a `.env` file to expose secrets to the config file and docker-compose (e.g. API keys, calendar URLs, etc.).

## Modules

Add modules to a `modules` folder in the root of this project. Modules will be avaiable as 'custommodules/{module name}' from the config file. Default modules will remain available

## Run Docker

`docker-compose up -d`