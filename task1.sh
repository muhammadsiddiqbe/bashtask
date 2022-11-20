#!/bin/bash

echo "id,location_id,name,title,email" > accounts_new.csv # add column names
sed -r 's/,([^,"]*|"[^"]*")/|\1/g' accounts.csv >> data.csv # I used this to replace , to | and it and it became easier to parse then. I found many ways to do it this one may not be most accurate but working :) i need to optimize it :)

while IFS="|" read -r id location_id name title email
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

done < <(tail -n +2 data.csv)

# I think all working as it is said in the task