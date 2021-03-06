<p align="center"> 
  <img src="images/profile.png" width="350" title="oscr" align="center">
  <h2 align="center">Collective</h2>
</p>

A collection of tools to help anonymize your browsing. It uses privoxy and traefik to load balance tor circuits. DNS is done with pihole and 1.1.1.1.  

## Quick Start

1. Download docker and docker-compose

1. Checkout this repo and run docker-compose see examples

1. You can then use ```localhost:8118``` as your proxy and set your dns resolver to ```localhost or 127.0.0.1```

1. You can scale tor up and down and traefik will loadbalance.

### Start Examples

* 5 Tor Circuits

``
docker-compose up -d --scale tor=5 --remove-orphans
``

* 10 Tor Circuits

``
docker-compose up -d --scale tor=10 --remove-orphans
``

## Containers

### Tor

The tor contianers automatically stop and start again between 200-400 seconds

### Traefik 

Pulls latest and uses the config in the compose file

### pihole(DNS)

Containers use the pihole container for DNS 

## Command Examples

curl

```
curl --proxy http://localhost:8118 https://icanhazip.com
```
## Common Issues

If you are running multiple docker networks you may need to adjust the IP range in the docker-compose file.


## Similar Projects

* https://github.com/trimstray/multitor
* https://github.com/evait-security/docker-multitor
