#!/usr/bin/env bash

#1. 将 iconfont.css , iconfont.ttf 拷贝到 grapes_flutter/fonts/目录下
#2. 运行此脚本
if [ ! -d "sh" ];then
  cd ..
fi
cd assets/fonts/ &&
python3 translate_icon_font_from_css_to_dart.py
# rm iconfont.css
# rm iconfont.ttf
mv iconfont.dart ../../lib/res/iconfont.dart

