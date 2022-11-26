## Environment variables

[environment 참고](etc/nginx/fastcgi_params)

```
echo $_SERVER['ENV']; // local
echo getenv('ENV'); // local
```

## Log monitoring

1. access log

   ```shell
   docker exec -it ------------ ls -al /var/log/nginx/www.codeigniter.co_access.log
   docker exec -it ------------ ls -al /var/log/nginx/www.codeigniter.co_error.log   
   
   docker exec -it ------------ ls -al /var/log/nginx/www.laravel.co_access.log
   docker exec -it ------------ ls -al /var/log/nginx/www.laravel.co_error.log
   ```

## Xdebug
