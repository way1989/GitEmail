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
