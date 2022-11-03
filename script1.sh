#!/bin/bash

if [ -f recovery.lz4.img ];then
	lz4 -B6 --content-size -f recovery.lz4.img recovery.img
fi

off=$(grep -ab -o SEANDROIDENFORCE recovery.img |tail -n 1 |cut -d : -f 1)
dd if=recovery.img of=recovery.img bs=4k count=$off iflag=count_bytes

if [ ! -f phh.pem ];then
    openssl genrsa -f4 -out phh.pem 4096
fi
