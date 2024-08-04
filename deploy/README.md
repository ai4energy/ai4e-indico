# indico 部署

## indico 是什么

## indico 的运行逻辑

## indico 的依赖

## docker-compose 部署 indico

## kubernetes 部署 indico

## 再多说几句

我们设置一个域名indico.ai4energy.org, 通过ingress也好，或者通过docker-compose里的设定也好，把这个域名的服务导到后端的nginx服务上去。nginx的服务里头，对/直接就导到uwsgi的后端，而css等其他的目录就自己提供这些文件。

在 Kubernetes `Secret` 对象中，数据需要以 base64 编码格式存储。要将明文值编码为 base64，可以使用命令行工具如 `base64`。

### 编码明文值为 base64

以下是如何将明文值 "indico" 编码为 base64 格式：

```bash
echo -n 'indico' | base64
```

输出应为：

```
aW5kaWNv
```

### 编码明文密码为 base64

同样地，将明文密码 "indicopass" 编码为 base64 格式：

```bash
echo -n 'indicopass' | base64
```

输出应为：

```
aW5kaWNvcGFzcw==
```
