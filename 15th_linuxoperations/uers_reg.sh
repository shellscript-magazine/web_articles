#!/bin/bash

##for文を正しく実行するために半角スペースを「%」に変換
users_info=$(cat useradd_20180720.txt | tr ' ' '%')

for user_info in ${users_info}
do

##「%」を半角スペースに戻す
user_reg=$(echo $user_info | tr '%' ' ')

##（ユーザー登録）
#echo ${user_reg} | newusers

##/etc/skel内のファイルをユーザーディレクトリーにコピー
user_home=$(echo $user_reg | cut -d ":" -f 6)
user_group=$(echo ${user_home} | tr '/home/' '')

echo ${user_home}
echo ${user_group}

#cp /etc/skel/* ${user_home}
#chown ${user_group}.{user_group} ${user_home}/*

done