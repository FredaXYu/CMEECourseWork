#!/bin/bash

# -e 
# \b is the backspace for the previous character
echo "\b this is the print out\b content----"   # \b this is the print out\b content----
echo -e "\b this is the print out\b content----"  # this is the print ou content----

# \a is the bell. While I don't hear it rings somehow??
echo "\a this is the print out\a content----"   # \a this is the print out\a content----
echo -e "\a this is the print out\a content----"  #  this is the print out content----

echo "$0"   # name of this file


# echo 命令的语法如下:

# echo [-neE] [ARGUMENTS]
# 当-n 选项，则取消尾随换行符
# 如果-e 选项，则将解释以下反斜杠转义字符:
# \ 显示反斜杠字符
# \a 警报(BEL)
# \b 显示退格字符
# \c 禁止任何进一步的输出
# \e 显示转义字符
# \f 显示窗体提要字符
# \n 显示新行
# \r 显示回车
# \t 显示水平标签
# \v 显示垂直标签
# 这个-E 项禁用转义字符的解释。这是默认值


# chmod +x myscript.sh
# ./myscript.sh