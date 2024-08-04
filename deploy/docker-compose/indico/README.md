
## 413 错误
把indico放在nginx-proxy的后面的时候，上传文件出现413错误，就是文件大小超了。经查，是nginx-proxy的问题，因为如果我们直接使用port映射80到容器的80，不经过nginx-proxy就没有这个问题。
nginx-proxy容器里的/etc/nginx/nginx.conf是主配置文件，它include了conf.d目录的*.conf文件，我们可以进入容器看的。

所以我们在/srv/nginx-proxy/conf.d/目录下建立client_max_body_size.conf，内容如下：

```
[root@ai4energy nginx-proxy]# cat conf.d/client_max_body_size.conf
client_max_body_size 1G;
```
问题得到解决。