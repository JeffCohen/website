# Expires Friday, Nov 18 2016

# RENEWING:

- sudo certbot certonly --manual -d jeffcohenonline.com,www.jeffcohenonline.com
- sudo heroku certs:update /etc/letsencrypt/live/jeffcohenonline.com/fullchain.pem /etc/letsencrypt/live/jeffcohenonline.com/privkey.pem --confirm website-dev


# IMPORTANT NOTES:

Initial install: `sudo certbot certonly --manual`

 - Congratulations! Your certificate and chain have been saved at
   /etc/letsencrypt/live/jeffcohenonline.com/fullchain.pem. Your cert
   will expire on 2016-09-09. To obtain a new version of the
   certificate in the future, simply run Certbot again.
 - If you lose your account credentials, you can recover through
   e-mails sent to cohen.jeff@gmail.com.
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
