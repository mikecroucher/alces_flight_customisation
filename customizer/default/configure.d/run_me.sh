#!/bin/bash
echo "configure.d script"
number_of_users=35
password_file=/home/walkingrandomly/users.txt

#Install mkpasswd
sudo yum install expect -y

if [ $2 = 'master' ]; then
 echo "Running on master node"
 #Master node
 touch $password_file
 for i in `seq 1 $number_of_users`;
  do
  username=training_user$i
  sudo useradd -m -d /home/$username $username
  userpassword=`mkpasswd`
  echo $username:$userpassword | sudo chpasswd
  echo "UserID:" $username "has been created with the following password " $userpassword >> $password_file
 done

#allow password authentication to the master node
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo service sshd restart
else
 #Compute node
 echo "running on compute node"
 for i in `seq 1 $number_of_users`;
 do
  username=training_user$i
  sudo useradd -m -d /home/$username $username
 done
fi

