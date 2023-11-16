#!/bin/bash
user="Test_team"
echo -n  " Please enter the password: "
read pass
echo $pass
subscription-manager register --username=$user --password=$pass                                                              