cd vm-lon1-vpn-1
terraform apply -var "do_token=${DO_TOKEN}" -var "pvt_key=../id_rsa" --auto-approve