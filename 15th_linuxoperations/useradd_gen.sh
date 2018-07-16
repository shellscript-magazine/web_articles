#!/bin/bash

while [ 1 ]
do

##ユーザー名の入力
echo -n "ユーザー名を入力してください："
read user_id

##名字の入力
echo -n "名字を入力してください："
read last_name

##名前の入力
echo -n "名前を入力してください："
read first_name

##パスワードの生成
password=$(pwgen 12 1)

##ユーザー登録用ファイルの作成
echo "${user_id}:${password}:::${first_name} ${last_name}:/home/${user_id}:/bin/bash" >> useradd_$(date +%Y%m%d).txt

##ユーザーへのメッセージ作成
mkdir -p message
cat << EOM >> message/usermesg_$(date +%Y%m%d).txt
---メッセージはここから

${last_name} ${first_name} 様

ユーザー登録が完了しました。
ユーザー名は、「${user_id}」、
パスワードは、「${password}」です。

初回ログイン時にパスワードを変更してください。

                      システム管理部

---メッセージはここまで


EOM

##ユーザー登録用ファイルの作成続行確認
echo -n "ほかのユーザーを追加しますか（y/N）："
read other_user
if [[ ${other_user} != "y" && ${other_user} != "Y" ]]; then

exit 0

fi

done
