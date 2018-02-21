# Alces fight customisation

This is the github repo behind the blog post at http://www.walkingrandomly.com/?p=6431 

## What does these scripts do?

The customisation scripts in this github repo do the following

* Creates 35 training accounts with random passwords and puts details in /home/walkingrandomly/users.txt
* Allows SSH log in with passwords
* Installs a few packages using the script https://github.com/mikecroucher/alces_flight_customisation/blob/master/customizer/default/configure.d/install_software.sh

## Using the scripts with Alces flight

Details on the blog post but the short version is that you need to upload this repo to an S3 bucket.

```
git clone https://github.com/mikecroucher/alces_flight_customisation
cd alces_flight_customisation
```
Now you need to upload these to an s3 bucket. I called mine `walkingrandomly-aws-cluster`
```
aws s3api create-bucket --bucket walkingrandomly-aws-cluster --region eu-west-2 --create-bucket-configuration LocationConstraint=eu-west-2
aws s3 sync . s3://walkingrandomly-aws-cluster --delete
```
