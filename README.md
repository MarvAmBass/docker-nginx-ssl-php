# Docker Nginx SSL PHP Container (based on marvambass/nginx-ssl-secure)
_maintained by MarvAmBass_

[FAQ - All you need to know about the marvambass Containers]https://marvin.im/docker-faq-all-you-need-to-know-about-the-marvambass-containers/)

## What is it

This Dockerfile (available as ___marvambass/nginx-ssl-php___) gives you a completly secure running Nginx Container with php5-fpm.

It's based on the [marvambass/nginx-ssl-secure](https://registry.hub.docker.com/u/marvambass/nginx-ssl-secure/) Image

View in Docker Registry [marvambass/nginx-ssl-php](https://registry.hub.docker.com/u/marvambass/nginx-ssl-php/)

View in GitHub [MarvAmBass/docker-nginx-ssl-php](https://github.com/MarvAmBass/docker-nginx-ssl-php)

## Environment variables and defaults

* __DH\_SIZE__
 * default: 4096 (which takes a long time to create), for demo or unsecure applications you can use smaller values like 512

## Using the marvambass/nginx-ssl-php Container

Add the following lines to your nginx server config:

    index index.php index.html index.htm;

    location ~ \.php$ {
      try_files $uri =404;
      fastcgi_split_path_info ^(.+\.php)(/.+)$;
      fastcgi_pass unix:/var/run/php5-fpm.sock;
      fastcgi_index index.php;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      include fastcgi_params;
    }
