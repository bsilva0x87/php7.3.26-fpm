# PHP 7.3.26 FPM WITH COMPOSER
This is an Debian PHP 7.3 FPM Docker image for Laravel 5.6 proposal, including some build dependencies, composer, xdebug and redis.

### BUILD
```
$ docker build -t php7.3.26-fpm --rm=true .
```

### DEBUG / RUNNING
```
$ docker run -it php7.3.26-fpm
```

### DEBUG / RUNNING
```
$ docker run -p 8000:8000 php7.3.26-fpm [optional -u user ...]
```

### LOGOUT
```
$ exit
```

&copy;bsilva0x87, 2021.
