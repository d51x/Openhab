#!/bin/bash

#if [[ -z "$1" || -z "$2" ]]; then
#	exit 1
#fi;

if [[ -z "$1" ]]; then
	exit 1
fi;

#CONNECT="$1";
CONNECT="192.168.8.1:5555";
adb connect ${CONNECT} > /dev/null 2>&1;
#METRIC="$2";
METRIC="$1";

if [ "${METRIC}" = "chiptemp" ]; then
	IFS=',' read -a zTemp <<< `adb shell "atc AT^CHIPTEMP? 2>/dev/null | busybox sed -n '2p'"`;
	echo ${zTemp[3]};
fi;

if [ "${METRIC}" = "csq" ]; then
	IFS=',' read -a zCSQ <<< `adb shell "atc AT+CSQ 2>/dev/null | busybox sed -n '2p'" | tr ' ' ','`;
	echo $(( ${zCSQ[1]} * 2 - 113 ));
fi;

if [ "${METRIC}" = "lac" ]; then
	IFS=',' read -a zLAC <<< `adb shell "atc AT+CREG? 2>/dev/null | busybox sed -n '2p'"`;
	echo ${zLAC[2]};
fi;

if [ "${METRIC}" = "cid" ]; then
        IFS=',' read -a zCID <<< `adb shell "atc AT+CREG? 2>/dev/null | busybox sed -n '2p'"`;
        echo ${zCID[3]};
fi;

if [ "${METRIC}" = "hver" ]; then
	IFS=',' read -a zHVer <<< `adb shell "atc AT^FHVER 2>/dev/null | busybox sed -n '2p'" | tr ' ' ','`;
	echo ${zHVer[2]};
fi;

if [ "${METRIC}" = "fver" ]; then
        IFS=',' read -a zFVer <<< `adb shell "atc AT^FHVER 2>/dev/null | busybox sed -n '2p'" | tr ' ' ','`;
        echo ${zFVer[1]};
fi;

if [ "${METRIC}" = "cimi" ]; then
	echo `adb shell "atc AT+CIMI 2>/dev/null | busybox sed -n '2p'"`;
fi;

if [ "${METRIC}" = "mfactur" ]; then
	IFS=' ' read -a zMFactur <<< `adb shell "atc ATI 2>/dev/null | busybox sed -n '2p'"`;
        echo ${zMFactur[1]};
fi;

if [ "${METRIC}" = "model" ]; then
	IFS=' ' read -a zModel <<< `adb shell "atc ATI 2>/dev/null | busybox sed -n '3p'"`;
        echo ${zModel[1]};
fi;

if [ "${METRIC}" = "imei" ]; then
	IFS=' ' read -a zIMEI <<< `adb shell "atc ATI 2>/dev/null | busybox sed -n '5p'"`;
	echo ${zIMEI[1]};
fi;

if [ "${METRIC}" = "rssi" ]; then
	IFS=',' read -a zRSSI  <<< `adb shell "atc AT^HCSQ? 2>/dev/null | busybox sed -n '2p'"`;
	echo $((${zRSSI[1]}-121));
fi;

if [ "${METRIC}" = "rsrp" ]; then
	IFS=',' read -a zRSRP  <<< `adb shell "atc AT^HCSQ? 2>/dev/null | busybox sed -n '2p'"`;
	echo $((${zRSRP[2]}-141));
fi;

if [ "${METRIC}" = "sinr" ]; then
	IFS=',' read -a zSINR  <<< `adb shell "atc AT^HCSQ? 2>/dev/null | busybox sed -n '2p'"`;
        echo $(((${zSINR[3]}-1)/5-20));
fi;

if [ "${METRIC}" = "rsrq" ]; then
	IFS=',' read -a zRSRQ  <<< `adb shell "atc AT^HCSQ? 2>/dev/null | busybox sed -n '2p'" | tr '\r' ','`;
        echo $((${zRSRQ[4]}/2-20));
fi;

if [ "${METRIC}" = "type" ]; then
	IFS=',' read -a zTYPE  <<< `adb shell "atc AT^HCSQ? 2>/dev/null | busybox sed -n '2p'" | tr ':' ','`;
        echo ${zTYPE[1]};
fi;

if [ "${METRIC}" = "band" ]; then
	IFS=',' read -a zBand <<< `adb shell "atc AT^HFREQINFO? 2>/dev/null | busybox sed -n '2p'"`;
	echo ${zBand[2]};
fi;

if [ "${METRIC}" = "earfcn-down" ]; then
        IFS=',' read -a zearfcn <<< `adb shell "atc AT^HFREQINFO? 2>/dev/null | busybox sed -n '2p'"`;
        echo ${zearfcn[3]};
fi;

if [ "${METRIC}" = "earfcn-up" ]; then
        IFS=',' read -a zearfcn <<< `adb shell "atc AT^HFREQINFO? 2>/dev/null | busybox sed -n '2p'"`;
        echo ${zearfcn[6]};
fi;

if [ "${METRIC}" = "frequency-down" ]; then
        IFS=',' read -a zfrequency <<< `adb shell "atc AT^HFREQINFO? 2>/dev/null | busybox sed -n '2p'"`;
        echo $((${zfrequency[4]}/10));
fi;

if [ "${METRIC}" = "frequency-up" ]; then
        IFS=',' read -a zfrequency <<< `adb shell "atc AT^HFREQINFO? 2>/dev/null | busybox sed -n '2p'"`;
        echo $((${zfrequency[7]}/10));
fi;

if [ "${METRIC}" = "width-down" ]; then
        IFS=',' read -a zwidth <<< `adb shell "atc AT^HFREQINFO? 2>/dev/null | busybox sed -n '2p'"`;
        echo $((${zwidth[5]}/1000));
fi;

if [ "${METRIC}" = "width-up" ]; then
        IFS=',' read -a zwidth <<< `adb shell "atc AT^HFREQINFO? 2>/dev/null | busybox sed -n '2p'" | tr '\r' ','`;
        echo $((${zwidth[8]}/1000));
fi;

if [ "${METRIC}" = "mcc-mnc" ]; then
	IFS=',' read -a zmcc <<< `adb shell "atc AT+COPS? 2>/dev/null | busybox sed -n '2p'"`;
        echo ${zmcc[2]};
fi;


if [ "${METRIC}" = "iccid" ]; then
	IFS=',' read -a ziccid <<< `adb shell "atc AT^ICCID? 2>/dev/null | busybox sed -n '2p'" | tr ' ' ',' | tr '\r' ','`;
	echo ${ziccid[1]};
fi;

