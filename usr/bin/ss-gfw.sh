!/bin/sh

#create a new chain named SHADOWSOCKS
iptables -t nat -N SHADOWSOCKS

# Ignore your shadowsocks server's addresses
# It's very IMPORTANT, just be careful.

iptables -t nat -A SHADOWSOCKS -d 106.185.28.117 -j RETURN

# Ignore LANs IP address
iptables -t nat -A SHADOWSOCKS -d 0.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 10.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 127.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 169.254.0.0/16 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 172.16.0.0/12 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 192.168.0.0/16 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 224.0.0.0/4 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 240.0.0.0/4 -j RETURN

# Ignore Asia IP address
iptables -t nat -A SHADOWSOCKS -d 1.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 14.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 27.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 36.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 39.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 42.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 49.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 58.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 59.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 60.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 61.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 101.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 103.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 106.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 110.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 111.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 112.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 113.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 114.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 115.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 116.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 117.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 118.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 119.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 120.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 121.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 122.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 123.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 124.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 125.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 126.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 169.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 175.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 180.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 182.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 183.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 202.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 203.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 210.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 211.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 218.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 219.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 220.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 221.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 222.0.0.0/8 -j RETURN
iptables -t nat -A SHADOWSOCKS -d 223.0.0.0/8 -j RETURN

# Anything else should be redirected to shadowsocks's local port
iptables -t nat -A SHADOWSOCKS -p tcp -j REDIRECT --to-ports 1080
# Apply the rules
iptables -t nat -A PREROUTING -p tcp -j SHADOWSOCKS
#iptables -t nat -A OUTPUT -p tcp -j SHADOWSOCKS