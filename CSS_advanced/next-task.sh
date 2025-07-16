#!/bin/bash

filename=$(ls -1 styles/ | grep ^'[0-9]' | sort -V | tail -n 1)
prevNum=${filename%-style.css}
newNum=$((prevNum + 1))
cp styles/$filename styles/"${newNum}-style.css"
sed -i "s/styles\/${prevNum}-style.css/styles\/${newNum}-style.css/g" index.html
code styles/"${newNum}-style.css"
