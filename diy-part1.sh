#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#echo 'src-git froer_Packages https://github.com/ofroer/ofroer_mod_Packages.git' >> feeds.conf.defaul
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
sed -i '1i src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns && rm -rf feeds/packages/net/{alist,adguardhome,mosdns,smartdns}
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd-alt,miniupnpd-iptables,wireless-regdb}
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
./scripts/feeds install -a 
make menuconfig
#echo 'src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' >> feeds.conf.default
#git clone https://github.com/kenzok8/openwrt-packages  package/openwrt-packages
#git clone https://github.com/kenzok8/small.git  package/openwrt-small
#git clone https://github.com/kuoruan/openwrt-upx.git package/openwrt-upx
#echo 'src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' >> feeds.conf.default
# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
