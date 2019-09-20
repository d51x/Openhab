#!/bin/bash
MODEM_IP="192.168.8.1"
UserName="admin"
UserPassword="admin"
TEMP_FOLDER="/var/log/openhab2/"
#TEMP_FOLDER="/etc/openhab2/scripts/"
CookieFile=$TEMP_FOLDER"modem_huawei.cookie"
SignalFile=$TEMP_FOLDER"modem_signal.xml"
AddParamsFile=$TEMP_FOLDER"modem_add_param.xml"
NetModeFile=$TEMP_FOLDER"modem_netmode.xml"
InfoFile=$TEMP_FOLDER"modem_info.xml"
StatusFile=$TEMP_FOLDER"modem_status.xml"
TrafficFile=$TEMP_FOLDER"modem_traffic.xml"

rm -f "$CookieFile"
rm -f "$SignalFile"
rm -f "$AddParamsFile"
rm -f "$NetModeFile"
rm -f "$InfoFile"
rm -f "$StatusFile"
rm -f "$TrafficFile"

TOKEN=`curl -s -c "$CookieFile" "http://$MODEM_IP/html/home.html" | grep -i token | head -1 | cut -d"\"" -f 4`
UserPasswordEnc=`echo -n "$UserPassword" | base64 -w0`
REQUEST="<request><Username>$UserName</Username><Password>$UserPasswordEnc</Password><password_type>3</password_type></request>"
curl -sS -b "$CookieFile" -c "$CookieFile" -d "$REQUEST" "http://$MODEM_IP/api/user/login" -H "__RequestVerificationToken: $TOKEN" > /dev/null 2>&1
#curl -s -b "$CookieFile" "http://$MODEM_IP/api/device/signal" | xmlstarlet sel -t -m /response -o "pci: " -v ./pci -n -o "sc: " -v ./sc -n \
#                                                        -o "cell_id: " -v ./cell_id -n -o "rsrq: " -v ./rsrq -n -o "rsrp: " -v ./rsrp -n \
#                                                        -o "rssi: " -v ./rssi -n -o "sinr: " -v ./sinr -n -o "rscp: " -v ./rscp -n \
#                                                        -o "ecio: " -v ./ecio -n -o "psatt: " -v ./psatt -n -o "mode: " -v ./mode -n \
#                                                        -o "lte_bandwidth: " -v ./lte_bandwidth -n -o "lte_bandinfo: " -v ./lte_bandinfo -n >> "$SignalFile"
curl -s -b "$CookieFile" "http://$MODEM_IP/api/device/signal" >> "$SignalFile"
curl -s -b "$CookieFile" "http://$MODEM_IP/config/deviceinformation/add_param.xml" >> "$AddParamsFile"
#curl -s -b "$CookieFile" "http://$MODEM_IP/api/net/net-mode" >> "$NetModeFile"
curl -s -b "$CookieFile" "http://$MODEM_IP/api/device/information" >> "$InfoFile"
curl -s -b "$CookieFile" "http://$MODEM_IP/api/monitoring/status" >> "$StatusFile"
curl -s -b "$CookieFile" "http://$MODEM_IP/api/monitoring/traffic-statistics" >> "$TrafficFile"
return 1


