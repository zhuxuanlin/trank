### 简介
-admin-center
    监控中心
    
- registry-center

  注册中心，用于服务的注册与发现，第一个要启动的程序

- config-center

  配置中心，用来管理所有的配置文件，配置文件可以存放在github，或者gitlab上，第二个启动的程序

- gateway-center

  网关中心，所有服务的统一入口，用来做认证和鉴权。开发阶段哭可以不启动

- common-service

  一些公共的工具类，可以在所有的业务服务中进行引入，不需要启动

- order-service

  订单服务，一个业务服务

- order-api

  订单服务的一些实体类，枚举，常量等会存放在这个里面

- message-service

  消息服务

- message-feign

  消息服务对外提供的接口，在各个服务内部通过feign的方式调用

- message-api

  消息服务的一些实体类，枚举，常量等会存放在这个里面

