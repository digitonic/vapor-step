# Vapor Step

This step will allow you to run vapor cli commands to deploy serverless enviroments

### Php versions
There are 3 versions avaialble 8.0. 8.1 the default (latest) and 8.2

```
    image: digitonic/vapor-step:latest
```

If you need to specify a different version use the docker tagging so for 8.2

```
    image: digitonic/vapor-step:8.2
```

### Nodejs Versions
There 3 nodejs version avaialble in this image 16.18.0, 12.21.0 and 14.21.0 the way to use this is 

```
export PATH="/root/.nvm/versions/node/v14.21.0/bin/:${PATH}" [...] && vapor deploy [...]
```
