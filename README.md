# CloudFlare-SSL-FullStrict

This script is following a lot of requests, it allows you to simply automate the creation of an SSL certificate in full strict mode on Cloud Flare.

# Step 1 - Create the CSR and Key certificate

Download the script then edit follow your country, region etc... and run `bash startssl.sh`

## Step 2 - Send CSR to Cloudflare
 1. Copy the contents of the CSR file you just generated :
 `cat /etc/ssl/private/exemple.com.csr`
 
 2. Go to the Cloudflare interface, under the "**SSL/TLS**" tab, choose "**Origin Server**" and paste the CSR in the "**Private Key and Certificate Signing Request (CSR)**" section.

3. Follow the instructions to complete the validation process for your domain.

## Step 3  Download Cloudflare certificate
Once the certificate has been issued, download the primary certificate (Origin Certificate) from Cloudflare and
upload the file to your Apache server, for example in the **/etc/ssl/private/** directory.

```apache
    SSLEngine on
    SSLCertificateFile /etc/ssl/private/your_domain.pem   # replace with the path to your Cloudflare certificate
    SSLCertificateKeyFile /etc/ssl/private/exemple.com.key   # Replace with the path to your private key
```
