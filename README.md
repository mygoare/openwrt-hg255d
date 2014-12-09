#Openwrt-hg255d

Openwrt configure of HG255D, used to cross the GFW

#Note:

此项目只为实现快速刷机(hg255d)

固件是自己compile的，用来快速刷机与恢复系统。详见下方步骤

内shadowsocks个人账号，请勿滥用，不确保长期有效

请勿经常性P2P下载（迅雷、电驴）

#原理

通过 chinadns + dnsmasq + shadowsocks 来跳墙

chinadns 获得正确的 ip 地址，dnsmasq 只是用作 chinadns 的上游

取得正确 ip 之后， ss-gfw 使用 iptables 分流，过滤国内 ip ，国外 ip 走 shadowsocks ss-redir 1080 端口

shadowsocks 开启 ss-redir 和 ss-local ， ss-local 用于直连 路由器， 可以直接监听 路由器的 1081 地址 翻墙

#Let's go:

主要包括 **刷空白系统** 和 **导入配置** 两步 （未更新，但仍能使用）

1.	用网线将 电脑 和路由的 LAN 口相连，用牙签或笔 按住reset，开机，按住数秒后松开
1.	等待进入到uboot刷机界面。

		手动设置ip，子网掩码，网关，
		分别为 192.168.1.34（34可随意）, 255.255.255.0, 192.168.1.1，
		如果 ping 不通网关，可以换换ip地址试试；
		或手动设置网关 192.168.1.1 ，自动获取ip也可；

2.	上传固件，刷机开始，等待... 路由会自己重启
3.	等待完毕后，确认下能ping通网关
4.	默认无密码 telnet 192.168.1.1
4.	下载 overlay 备份，恢复备份

		cd /tmp
		wget http://trello-abc.stor.sinaapp.com/540c02c45ab1ef6669aa580428e5df5a3c7ff73cb162b.tar -O overlay_backup.tar
		rm -rf /overlay/*
		cd /
		tar zxvf /tmp/overlay_backup.tar


5.	reboot
6.	重启下网卡 sudo ifconfig en0 down, sudo ifcnfig en0 up
7.	用DHCP自动获取ip，你会发现ip地址变成了3的网段（比如：192.168.3.110）
8.	接下来你就可以自由畅游了...


##登录管理路由：
ssh root@192.168.3.1 或 网址登录 192.168.3.1

用户名: root, 密码: admin

开启无线后默认密码: helloworldFuckGFW

##连线注意事项：

谨记一条即可：连接路由器 **WAN** 口的线必须是可以直接插着电脑上网的，路由器 **LAN** 出来的线都是可以越过长城的


##ChinaDNS

成功加入 ChinaDNS-C 到openwrt，等待提供新的打包供快速刷机。

也可以 手动 在客户端（电脑）上手动开启 ChinaDNS ，然后修改 dns 到 127.0.0.1 即可， 长城宽带用户因为dns污染相对电信联通更严重，需自定义上游dns server加入208.67.222.222:443


#Todo:

- [x]	解决dns污染使用的自定义下ChinaDNS的防火墙ip_lists（比如长城宽带内部有dns污染）

- [x]	升级 shadowsocks（客户端和服务端） 来尝试 rc4-md5 加密
- [ ]	pac file support
- [ ]	更加精确的大陆ip段，误杀很多 香港，台湾和日本的 ip

#One More Thing

如果你想打赏我，就用支付宝手机APP扫码吧：

![](http://trello-abc.stor.sinaapp.com/5428d20acb7358186a4200c294039d80e21ca4e264a6e.jpg)

#感谢

Yanqun, sunnist, Songmei, jia姐

#License

[MIT](http://opensource.org/licenses/MIT)
