# Javaweb_ticket
JavaWeb development, online ticket purchase;

A project use servlet&jsp,follows the MVC modle

JavaWeb开发的网络购票系统

使用servlet&jsp,遵循MVC模型开发

(该项目主要是个人拿来熟悉Javaweb基础知识用)

2019-7-31  设计orders表，添加orderid  根据订单号+用户名+路线  删除对应数据库记录  实现退票
......
2019年8月2日，解决同一个用户订单列表有两个相同路线的订单，在退票时会将这两个路线相同订单都删除掉;思路：重新设计车票数据库订单表，为每一个订单添加非空唯一自增属性ID，根据ID删除订单即可
......
2019年8月10日，到目前只实现了增删改查功能，前端（不太会，吐血）到后端再到数据库，基本都是自己代码实现的，后续不再写该项目了，正在向SSM框架进发！
