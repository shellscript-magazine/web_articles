#!/bin/bash

##for���𐳂������s���邽�߂ɔ��p�X�y�[�X���u%�v�ɕϊ�
users_info=$(cat useradd_20180720.txt | tr ' ' '%')

for user_info in ${users_info}
do

##�u%�v�𔼊p�X�y�[�X�ɖ߂�
user_reg=$(echo $user_info | tr '%' ' ')

##�i���[�U�[�o�^�j
#echo ${user_reg} | newusers

##/etc/skel���̃t�@�C�������[�U�[�f�B���N�g���[�ɃR�s�[
user_home=$(echo $user_reg | cut -d ":" -f 6)
user_group=$(echo ${user_home} | tr '/home/' '')

echo ${user_home}
echo ${user_group}

#cp /etc/skel/* ${user_home}
#chown ${user_group}.{user_group} ${user_home}/*

done