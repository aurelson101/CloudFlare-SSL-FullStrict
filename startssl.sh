#!/bin/bash

echo "Please enter domain name : "
cd /etc/ssl/private/
read domain_name

# Generate the private key
openssl genrsa -out "${domain_name}.key" 2048

# Create the openssl.cnf file
cat <<EOF > openssl.cnf
[req]
default_bits       = 2048
default_keyfile    = ${domain_name}.key
distinguished_name = req_distinguished_name
req_extensions     = req_ext
prompt             = no
days               = 365

[req_distinguished_name]
C  = FR
ST = IDF
L  = Paris
O  = HCM
OU = OrganizationalUnit
CN = ${domain_name}

[req_ext]
subjectAltName = @alt_names

[alt_names]
DNS.1 = ${domain_name}
DNS.2 = *.${domain_name}
EOF

# Generate the CSR
openssl req -new -key "${domain_name}.key" -out "${domain_name}.csr" -config openssl.cnf

echo "CSR and private key successfully generated for domain : ${domain_name}"
