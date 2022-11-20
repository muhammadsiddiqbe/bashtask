#!/bin/bash

echo "id,location_id,name,title,email" > accounts_new.csv # add column names

while IFS="," read -r id location_id name title email
do

  fullnameArr=(${name// / }) # split into array
  firstname=${fullnameArr[0],,} # get firstname manipulate all to lowercase
  lastname=${fullnameArr[1],,} # get lastname manipulate all to lowercase

  email=${firstname:0:1}.$lastname@abc.com # genereate email address

  if grep -q "$email" accounts_new.csv # check this email exists
  then
    echo "Duplicate $email"
    email=${firstname:0:1}.$lastname$location_id@abc.com # if exists add locatio_id also
  fi

  echo "$id,$location_id,${firstname^} ${lastname^},$title,$email" >> accounts_new.csv

done < <(tail -n +2 accounts.csv)
