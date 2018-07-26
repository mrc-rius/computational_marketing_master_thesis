Docker toolbox on Mac or Windows, your Docker daemon has only limited access to your OS X or Windows filesystem. Docker Machine tries to auto-share your /Users (OS X) or C:\Users (Windows) directory.
Basically, you will need to move your site files to somewhere such as c:\Users\sites


docker volume create postgres_database



-----------------Mounting data volume for Postgres in docker for Windows doesn't work --------------------------------
I've solved the problem by creating a new volume like that :
docker volume create postgres_database

And then you link it like that :

services:
    postgres:
        restart: always
        volumes:
            - postgres_database:/var/lib/postgresql/data:Z

volumes:
    postgres_database:
        external: true
