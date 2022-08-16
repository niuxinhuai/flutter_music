# coding: u8

import re
from pathlib import Path


ROOT = Path(__file__).resolve().parent#.parent
MAIN = ROOT


# 将 iconfont 的 css 自动转换为 dart 代码

def translate():
    print('Begin translate...')

    code = """
import 'package:flutter/widgets.dart' hide Action;


// 代码由程序自动生成。请不要对此文件做任何修改。


class IconF {

  IconF._();

  static const _font_name = 'iconfont';

{icon_codes}

}
""".strip()

    strings = []

    tmp = []
    p = re.compile(r'.icon(.*?):.*?"\\(.*?)";')

    content = open(MAIN / 'iconfont.css').read().replace('\n  content', 'content')

    for line in content.splitlines():
        line = line.strip()
        if line:
            res = p.findall(line)
            if res:
                name, value = res[0]
                name = name.replace('-', '')
                tmp.append((name.lower(), value))

    tmp.sort()
    for name, value in tmp:
        string = f'  static const IconData {name} = const IconData(0x{value}, fontFamily: _font_name);'
        strings.append(string)

    strings = '\n'.join(strings)
    code = code.replace('{icon_codes}', strings)

    open(MAIN / 'iconfont.dart', 'w').write(code)

    print('Finish translate...')


if __name__ == "__main__":
    translate()