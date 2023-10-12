	
# Set three aws zones to create RDS instances 
DB_AWS_ZONE=('us-east-2a' 'us-west-1a' 'eu-central-1a')
 
for zone in "${DB_AWS_ZONE[@]}"
do
  echo "Creating rds (DB) server in $zone, please wait ..."
  aws rds create-db-instance \
  --availability-zone "$zone" \
  --allocated-storage 20 --db-instance-class db.m1.small \
  --db-instance-identifier test-instance \
  --engine mariadb \
  --master-username my_user_name \
  --master-user-password my_password_here
done



