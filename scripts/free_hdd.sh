#!/bin/bash

FREE=`df -k --output=avail "/home/media" | tail -n1`
echo $FREE
