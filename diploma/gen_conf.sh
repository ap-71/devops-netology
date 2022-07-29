echo "===> GEN CONFIGURATION"

echo "endpoint   = \"$endpoint\"
bucket     = \"$bucket\"
region     = \"$region\"
key        = \"$key\"
access_key = \"$access_key\"
secret_key = \"$secret_key\"
skip_region_validation      = $skip_region_validation
skip_credentials_validation = $skip_credentials_validation" > ./terraform/backend.conf