# tor-fied-lamp
## Intro

These are docker-compose and dockerfile scripts for creating a basic installation of [Simple Machines Forum](http://www.simplemachines.org/) 2.1 Beta 2 as a hidden service onion.

#### Special thanks to [cmehay](https://github.com/cmehay/docker-tor-hidden-service) for their projects which allowed me to build this one.

#### About the scripts:

docker-compose.yml calls on three images:

<dl>
  <dt>tor</dt>
  <dd>tor is the docker images which published the lamp stack as a .onion website.</dd>

  <dt>db</dt>
  <dd>db uses the official mariadb image from http://hub.docker.com</dd>

  <dt>apache</dt>
  <dd>apache is my own image that is build by the attached dockerfile.</dd>
</dl>

Dockerfile uses ubuntu:14.04 and installs a list of packages including apache2, php, and some standard dependancies. The list of packages can be changed or added to as needed for your own personal needs.

#### Variables

Volumes: In the tor section, docker-compose will create a ~/.keys directory with the hostname and private key.

Passwords: **Change all passwords to something other than the default passwords!** I included a basic starter database in the configuration to ease in setting up something like wordpress or whatever.

#### Build & Run!

```
docker-compose build
docker-compose up -d
```
After you finish your installation run:
```
docker exec -it torfiedsmf_apache_1 rm /var/www/html/install.php
```
you can now start running your app!

#### Stop and remove

```
docker-compose down
```

#### What's my .onion url?

Your new .onion hostname will be in ~/.keys/apache/hostname or you can run the following command:

```
$ docker exec -ti torfiedsmf_tor_1 onions
```

#### What works and what doesn't

Email confirmation and captcha don't work yet. I'll need to attach a forth Docker image with a MTS like sendmail to provide mail access and add in the php requirements needed to captcha.  It's a work in progress.

Everything else works as far as I can see.
