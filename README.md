Using repository
================

To run the image execute the following command:

    docker run -i -t \
           -v {your-app-dir}:/app \
           -p {ext-port}:5000 \
           alexlukichev/refresh-node

The code of node application is supposed to be found in
`{your-app-dir}` and the application is supposed to listen
on port 5000. Also the entry point of the application should 
be `server.js`.

When the container main process is started/restarted it will first execute
`npm install` and then `node server.js`.

To force the node restart you need to create the file `.restart` in the
application root dir:

    touch .restart

Source
======

https://github.com/alexlukichev/refresh-node
