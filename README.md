# "Galaxy Docker Edition"

[![AGPLv3 License](http://img.shields.io/badge/license-AGPLv3-blue.svg) ](https://github.com/DINA-Web/galaxy-docker/blob/master/LICENSE)

Galaxy is a server to support intrateam local collaboration - it contains GitLab and some other services.

Note: This is Work In Progress - things can be improved and everything may not work the way you expect it to work.

# Requirements

The installation requires a docker host under your control, ie a machine with the `docker` daemon running, see https://docs.docker.com/engine/installation/

You also need to install `docker-compose`, see https://docs.docker.com/compose/install/

# Usage

## Makefile

The `Makefile` provides targets (which are actions, like VERBs), for example you can....

	# start all services 
	make

	# before using it, wait for a minute after startup
	# since gitlab takes some time to initialize
	make test

	# stop and remove service
	make down

## Services

The `docker-compose.yml` file provides the various components of the system (NOUNs), providing the services, for example:

	proxy 
	dnsdock 
	web
	gitlab

## Explaning routing and name resolution

This is handled by dnsdock, proxy and web and requires DNS to be configured on the host machine.

For setting up DNS to work well on your host machine, please follow the setup instructions at https://github.com/mskyttner/dns-test-docker. 

The "web" component provides a front or portal to the rest of the services that provide http services or management interfaces. This component (nginx) receives traffic from the "proxy" component that routes http traffic from the outside, this is an nginx reverse proxy that provides the only way in from the "outside" (port 80 and 443) so it also provides ssl termination and that way the rest of the services don't have to provide ssl individually. 

For details, see the "app.conf" file which provides the rules to route the web traffic to the various services available to the outside world.

The dnsdock component is used for service discovery from within the host machine, on the "inside" of the software defined network. With this component, it becomes possible for you to reach the various components inside the SDN using commands like "ping galaxy.docker" from the host running the docker daemon. 


## TODO

Consider adding support for more content:

* Community-relevant content
* Employee Handbook (bookdown format)
* cites-barcode from github

Also provide an entire front-end / desktop pre-configured for NRM... a "BioBox"

* Packages and apps for guest researchers and employees
* Set up everything including mail etc w Davmail(?) see 
* Access to file shares
* VPN / remote access


