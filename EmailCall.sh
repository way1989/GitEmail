#!/bin/bash
########################################################
##    邮件通知的配置脚本
##
#######################################################
server=jasmine-repository-server.log
i=0
Path=$(pwd)
echo ""
echo "该脚本用于为"${server}"每个项目邮件通知的脚本配置"
echo "请确认"${server}"文件没有空白行"
echo "按回车键继续....."
read keyborad
echo "请稍候..."
while read line
do 
    cp -a post-receive /pub/gittrees/git_server/$line/hooks/post-receive
    cp -a functions /pub/gittrees/git_server/$line/hooks/
    cd  /pub/gittrees/git_server/$line
    if [ $? -eq 0 ] 
    then
        i=$[ $i + 1]
     
        sed -i '/post-receive-email/d' config
        sed -i '/mailinglist =/d' config
        sed -i '/announcelist =/d' config
        sed -i '/envelopesender = /d' config
        sed -i '/sendmail =/d' config
    
        echo "[hooks \"post-receive-email\"]" >> config
        echo -e "\tmailinglist = zhuy@trustcom.com, yuanj@trustcom.com, xhua@trustcom.com,\
              wliang@trustcom.com, wenjj@trustcom.com, feiq@trustcom.com " >> config
        echo -e "\tannouncelist =" >> config
        echo -e "\tenvelopesender = svn_server@trustcom.com" >> config
        echo -e "\tsendmail = /usr/bin/msmtp" >> config
    fi
    cd $Path
done < $Path/$server
j=`sed -n '$=' $Path/$server`
echo "成功处理的仓库数 ="$i
echo "总共的仓库数 ="$j
if [ $j -eq $i ] 
then
   echo "Run success!"
else
   echo "Run failed!"
fi
echo ""
