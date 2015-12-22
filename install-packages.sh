# updating and installation

sudo apt-get update
sudo apt-get -y install apache2
sudo apt-get -y install hostapd
sudo apt-get -y install isc-dhcp-server

# hostapd config

echo ''                           >> /etc/hostapd/hostapd.conf
echo '###'                        >> /etc/hostapd/hostapd.conf
echo ''                           >> /etc/hostapd/hostapd.conf
echo 'interface=wlan0'            >> /etc/hostapd/hostapd.conf
echo 'driver=nl80211'             >> /etc/hostapd/hostapd.conf
echo 'ssid=DrovosekWiFi'          >> /etc/hostapd/hostapd.conf
echo 'channel=6'                  >> /etc/hostapd/hostapd.conf
echo 'wmm_enabled=1'              >> /etc/hostapd/hostapd.conf
echo 'wpa=1'                      >> /etc/hostapd/hostapd.conf
echo 'wpa_passphrase=0000000000'  >> /etc/hostapd/hostapd.conf
echo 'wpa_key_mgmt=WPA-PSK'       >> /etc/hostapd/hostapd.conf
echo 'wpa_pairwise=TKIP'          >> /etc/hostapd/hostapd.conf
echo 'rsn_pairwise=CCMP'          >> /etc/hostapd/hostapd.conf
echo 'auth_algs=1'                >> /etc/hostapd/hostapd.conf
echo 'macaddr_acl=0'              >> /etc/hostapd/hostapd.conf

# interfaces config

echo ''                           >> /etc/network/interfaces
echo '###'                        >> /etc/network/interfaces
echo ''                           >> /etc/network/interfaces
echo 'iface wlan0 inet static'    >> /etc/network/interfaces
echo 'address 10.10.0.1'          >> /etc/network/interfaces
echo 'netmask 255.255.255.0'      >> /etc/network/interfaces

# dhcp config

echo ''                           >> /etc/dhcp/dhcpd.conf
echo '###'                        >> /etc/dhcp/dhcpd.conf
echo ''                           >> /etc/dhcp/dhcpd.conf
echo 'authoritative; #be careful with this setting'   >> /etc/dhcp/dhcpd.conf
echo 'ddns-update-style none;'    >> /etc/dhcp/dhcpd.conf
echo 'default-lease-time 600;'    >> /etc/dhcp/dhcpd.conf
echo 'max-lease-time 7200;'       >> /etc/dhcp/dhcpd.conf
echo 'log-facility local7;'       >> /etc/dhcp/dhcpd.conf
echo '#for the wireless network on wlan0'             >> /etc/dhcp/dhcpd.conf
echo 'subnet 10.10.0.0 netmask 255.255.255.0 {'       >> /etc/dhcp/dhcpd.conf
echo 'range 10.10.0.25 10.10.0.50;'                   >> /etc/dhcp/dhcpd.conf
echo 'option domain-name-servers 8.8.8.8, 8.8.4.4;'   >> /etc/dhcp/dhcpd.conf
echo 'option routers 10.10.0.1;'  >> /etc/dhcp/dhcpd.conf
echo 'interface wlan0;'           >> /etc/dhcp/dhcpd.conf
echo '}'                          >> /etc/dhcp/dhcpd.conf
