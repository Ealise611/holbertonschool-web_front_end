#!/bin/bash

# 找到當前最新的 CSS 文件
filename=$(ls -1 styles/ 2>/dev/null | grep '^[0-9]' | sort -V | tail -n 1)

if [ -z "$filename" ]; then
    # 第一次運行
    prevNum=0
    newNum=1
    mkdir -p styles
    touch styles/1-style.css
    # 替換 # 為第一個 CSS 文件
    sed -i "s|href='#'|href='styles/1-style.css'|g" index.html
else
    # 後續運行
    prevNum=${filename%-style.css}
    newNum=$((prevNum + 1))
    cp styles/$filename styles/"${newNum}-style.css"
    # 更新到新版本
    sed -i "s|styles/${prevNum}-style.css|styles/${newNum}-style.css|g" index.html
fi

echo "✅ Created styles/${newNum}-style.css"
echo "✅ Updated index.html CSS link"
echo "🚀 Ready for Task ${newNum}!"

code styles/"${newNum}-style.css"