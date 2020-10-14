#!/bin/bash

FREE=`df -h --output=avail "/home/media" | tail -n1`
echo $FREE
