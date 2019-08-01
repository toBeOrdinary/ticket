# Javaweb_ticket
JavaWeb development, online ticket purchase;

A project use servlet&jsp,follows the MVC modle

JavaWeb开发的网络购票系统

使用servlet&jsp,遵循MVC模型开发

(该项目主要是个人拿来熟悉Javaweb基础知识用)
代码未完待续...

2019-7-31  设计orders表，添加orderid  根据订单号+用户名+路线  删除对应数据库记录  实现退票

......
2019年8月2日，解决同一个用户订单列表有两个相同路线的订单，在退票时会将这两个路线相同订单都删除掉；思路：重新设计ticket数据库orders表，为每一个订单添加非空唯一自增属性id,根据id删除订单即可

