<!-- 该文档是模板生成，手动修改的内容会被覆盖，详情参见：https://github.com/quicklyon/template-toolkit -->
# QuickOn yapi 应用镜像

## 快速参考

- 通过 [渠成软件百宝箱](https://www.qucheng.com/app-install/install-yapi-1.html) 一键安装 **yapi**
- [Dockerfile 源码](https://github.com/quicklyon/yapi-docker)
- [yapi 源码](https://github.com/YMFE/yapi)
- [yapi 官网](http://yapi.smart-xwork.cn/)

## 一、关于 yapi

[yapi](http://yapi.smart-xwork.cn/) 是为API开发者设计的管理平台, 旨在为开发、产品、测试人员提供更优雅的接口管理服务。
可以帮助开发者轻松创建、发布、维护 API，让接口开发更简单高效，让接口的管理更具可读性、可维护性，让团队协作更合理

### 特性

- 项目管理: 提供基本的项目分组，项目管理，接口管理功能
- 可视化接口管理: 基于websocket的多人协作接口编辑功能和类postman测试工具，让多人协作成倍提升开发效率
- Mock Server: 易用的 Mock Server，再也不用担心 mock 数据的生成了
- 自动化测试: 完善的接口自动化测试,保证数据的正确性
- 数据导入: 支持导入 swagger, postman, har 数据格式，方便迁移旧项目
- 配置中心: 支持 KV、文本、json 等格式的配置
- 插件机制: 强大的插件机制，满足各类业务需求

yapi官网：[http://yapi.smart-xwork.cn/](http://yapi.smart-xwork.cn/)


### 特性

- 项目管理: 提供基本的项目分组，项目管理，接口管理功能
- 可视化接口管理: 基于websocket的多人协作接口编辑功能和类postman测试工具，让多人协作成倍提升开发效率
- Mock Server: 易用的 Mock Server，再也不用担心 mock 数据的生成了
- 自动化测试: 完善的接口自动化测试,保证数据的正确性
- 数据导入: 支持导入 swagger, postman, har 数据格式，方便迁移旧项目
- 配置中心: 支持 KV、文本、json 等格式的配置
- 插件机制: 强大的插件机制，满足各类业务需求

## 二、支持的版本(Tag)

由于版本比较多,这里只列出最新的5个版本,更详细的版本列表请参考:[可用版本列表](https://hub.docker.com/r/easysoft/yapi/tags/)

- [latest](https://github.com/YMFE/yapi/tags)
- [1.9.3](https://github.com/YMFE/yapi/releases/tag/1.9.3)

## 三、获取镜像

推荐从 [Docker Hub Registry](https://hub.docker.com/r/easysoft/yapi) 拉取我们构建好的官方Docker镜像。

```bash
docker pull easysoft/yapi:latest
```

如需使用指定的版本，可以拉取一个包含版本标签的镜像，在Docker Hub仓库中查看 [可用版本列表](https://hub.docker.com/r/easysoft/yapi/tags/)

```bash
docker pull easysoft/yapi:[TAG]
```

## 四、持久化数据

Yapi 的数据写入了 mongodb，自身不需要持久化

## 五、环境变量

| 变量名           | 默认值        | 说明                             |
| ---------------- | ------------- | -------------------------------- |
| EASYSOFT_DEBUG   | false         | 是否打开调试信息，默认关闭       |
| MONGODB_HOST       | 127.0.0.1     | MongoDB 主机地址                   |
| MONGODB_PORT       | 27017          | MongoDB 端口                       |
| MONGODB_DATABASE         | yapi          | yapi 数据库名称                 |
| MONGODB_USER       | yapi          | MongoDB 用户名                      |
| MONGODB_PASSWORD   | pass4Yapi     | MongoDB 密码                        |
| YAPI_ADMIN_EMAIL | admin@localhost | 默认管理员邮箱地址 |

## 六、运行

### 6.1 单机Docker-compose方式运行

```bash
# 启动服务
make run

# 查看服务状态
make ps

# 查看服务日志
docker-compose logs -f gogs

```

**说明:**

- 启动成功后，打开浏览器输入 `http://<你的IP>:3000` 访问管理后台
- 默认用户名：`admin@localhost`，默认密码：`ymfe.org`
- [VERSION](https://github.com/quicklyon/yapi-docker/blob/main/VERSION) 文件中详细的定义了Makefile可以操作的版本
- [docker-compose.yml](https://github.com/quicklyon/yapi-docker/blob/main/docker-compose.yml)
