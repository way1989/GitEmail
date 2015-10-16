# GitEmail
git配置邮件通知hooks

###文件说明：
`functions`和`post-receive`是git邮件通知用到的脚本，放到服务器git仓库hooks目录下，`config`文件是服务器git仓库的配置文件，将以下部分添加到该文件后面。
```
[hooks "post-receive-email"]
sendmail = /usr/bin/msmtp
mailinglist = mu.su@tinno.com,li.weiping@tinno.com
envelopesender = li.weiping@tinno.com
```

`msmtprc`文件是msmtp服务配置文件，直接copy到/etc/msmtprc，需要先安装msmtp。

最好是先将服务器git仓库hooks目录下`post-update.sample`文件改成`post-receive`，然后再将本工程的`post-receive`或者`post-receive-tinno`内容拷贝到服务器git仓库hooks目录下`post-receive`中。

`git-serve.conf`是`post-receive-tinno`匹配使用的配置文件，需要改成自己的邮箱配置，脚本指定放在`~/.git-serve/conf/git-serve.conf`。
