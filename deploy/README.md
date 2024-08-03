# indico 部署

## indico 是什么

## indico 的运行逻辑

## indico 的依赖

## docker-compose 部署 indico

## kubernetes 部署 indico

## 再多说几句

我们设置一个域名indico.ai4energy.org, 通过ingress也好，或者通过docker-compose里的设定也好，把这个域名的服务导到后端的nginx服务上去。nginx的服务里头，对/直接就导到uwsgi的后端，而css等其他的目录就自己提供这些文件。
