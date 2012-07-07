fcitx_selfused_config_doc
-------------------------
>milk skin(改) + 日文输入 + sougou词库


配置
----
###添加日文输入
>目录中的jp.txt是日文码表，目前没有相对完善的fcitx日文输入解决方案，暂时以码表来弥补。
>如果自己手动的话，使用fcitx自带的 'txt2mb' 工具，执行 'txt2mb jp.txt
>jp.mb' 来完成mb文件的生成，然后使用目录中的 'mbinstaller' 工具安装基本就可以了，同时注意jp.cof配置文件是需要的。
>相关的文件(直接用我的即可)放到 '/home/.../fcitx/' 下即可
>>更多信息详见[这里](http://forum.ubuntu.org.cn/viewtopic.php?f=8&t=290712&start=0)和[使用说明](http://fcitx.github.com/handbook/fcitx.html)


###添加sougou词库
>使用源安装的fcitx，只需将以上目录下的相关压缩包打开，执行 './run.sh' ,然后将生成的 'pybase.mb' 、 'pyphrase.mb' 复制到 '/usr/share/fcitx/data/'  目录下覆盖原文件即可
>>更多相关信息请查阅[这里](http://forum.ubuntu.org.cn/viewtopic.php?f=8&t=348487)


###主题
>直接将相应主题文件夹放到 '/home/.../fcitx/' 下的主题目录即可



