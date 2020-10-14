#!/bin/sh
wget "http://192.168.99.1/goform/goform_set_cmd_process?goformId=SET_BEARER_PREFERENCE&BearerPreference=$1" --header="referer:http://192.168.99.1/index.html" -o /dev/null


