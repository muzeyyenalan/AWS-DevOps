<<<<<<< HEAD
#!/bin/bash

sed -i "s/ec2-private_ip/$(cat info.json | grep PrivateIpAddress | cut -d'"' -f4 | sort -u | sed '1d')/ig" terraform.tf
=======
1.Bolum : 
sed -i "s/ec2-private_ip/$(grep PrivateIpAddress info.json | head -n1 | cut -d'"' -f4)/g" terraform.tf

2.Bolum : 
>>>>>>> b7d09822249a83a8202b3dc11681de238138c3f6
