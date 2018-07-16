#!/bin/bash

##for文を正しく実行するために半角スペースを「#」に変換
users_info=$(cat $1 | tr ' ' '#')

for user_info in ${users_info}
do

##「#」を半角スペースに戻す
user_reg=$(echo $user_info | tr '#' ' ')

#echo ${user_reg}
##（ユーザー登録）
echo ${user_reg} | newusers

##/etc/skel内のファイルをホームディレクトリーにコピー
user_home=$(echo $user_reg | cut -d ":" -f 6)
user_group=$(echo ${user_home} | sed 's/\/home\///')

cp /etc/skel/.??* ${user_home}
chown ${user_group}.${user_group} ${user_home}/.??*

##初回ログイン時にパスワードを変更させる設定
chage -d 0 ${user_group}

echo "ユーザー登録完了：${user_group}"

done

