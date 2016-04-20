# docker_nvm_hubot

This is a dockerfile with nvm and yo, ready for 
`yo hubot`

Here is some notes about the dockerfile:
* In order to run yo, we have to create a non-root user. We also add the user to sudoers for convenience.
* Instead of simply running `apt-get install nodejs`, we use a more flexible approach by installing nvm to manage the node version. 
* To allow different user to access npm, we assign a directory for nvm installation and change its permisission settings. In this scenario, only root user can install global node dependency. Other user are free to use npm locally but not globally.
