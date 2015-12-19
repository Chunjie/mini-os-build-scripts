#!/bin/bash

set -e

echo "Launching daytime server test:"

echo "Test1: ping ..."
ping -c 4 192.168.1.100

echo ""

echo "Test2: telnet ..."
telnet 192.168.1.100 13
