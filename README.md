openwrt-hg255d
==============

Openwrt configure of HG255D, used to cross the GFW

Note:
===

此项目只为实现快速刷机(hg255d)

固件是自己compile的，overlay_backup是自己折腾后的一些备份，用来恢复与快速刷机

内shadowsocks个人账号，请勿滥用，不确保长期有效

Let's go:
===

1.	进入到uboot刷机界面。

		自己手动设置ip，子网掩码，网关，
		分别为 192.168.1.34, 255.255.255.0, 192.168.1.1，
		如果 ping 不通网关，可以换换ip地址试试

2.	上传固件，刷机开始，等待... 路由会自己重启
3.	等待完毕后，确认下能ping通网关 （默认无密码，可能要网页登录下网关设置下密码，比如admin）
4.	ssh root@192.168.1.1， 密码admin
4.	下载 overlay 备份，恢复备份

		cd /tmp
		wget http://trello-abc.stor.sinaapp.com/540a90fa21400f6669aa580428e5df5a3c7ff73cb162b.tar
		rm rf /overlay/*
		cd /
		tar zxvf /tmp/540a90fa21400f6669aa580428e5df5a3c7ff73cb162b.tar
	
5.	reboot
6.	重启下网卡 sudo ifconfig en0 down, sudo ifcnfig en0 up
7.	用DHCP自动获取ip，你会发现ip地址变成了3的网段（比如：192.168.3.110）
8.	接下来你就可以自由畅游了...
