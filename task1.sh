#!/bin/bash

echo "id,location_id,name,title,department, email" > accounts_new.csv # add column names

while IFS="," read -r id location_id name title email department
do

  fullnameArr=(${name// / }) # split into array
  firstname=${fullnameArr[0],,} # get firstname manipulate all to lowercase
  lastname=${fullnameArr[1],,} # get lastname manipulate all to lowercase

  email=${firstname:0:1}.$lastname@abc.com # genereate email address

  if grep -q "$email" accounts_new.csv
  then
      echo "Duplicate $email"
      email=${firstname:0:1}.$lastname${location_id:0:1}@abc.com
  else
      email=$email
      echo "not duplicate $email"
  fi

  echo "$id,$location_id,${firstname^} ${lastname^},$title,$department,$email" >> accounts_new.csv

  # printf '%s\n' $id $location_id $name $title $email $department | paste -sd ',' >> accounts_new.csv

done < <(tail -n +2 accounts.csv)


# while read p; do
#   echo "$p"
# done < accounts.csv # read file by line

# while IFS=, read -r one two three four; do
#     case $two in
#       1) echo "$one,$two,$three,$four" >>B_1.csv;;
#       2) echo "$one,$two,$three,$four" >>B_2.csv;;
#     esac
# done < accounts.csv