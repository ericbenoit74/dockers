# ericbenoit/node-red-w-config
A configurable node-red image with mongodb and mysql nodes

### Example of docker-compose.yml

```bash
nodereddata:
  image: busybox
  volumes:
    - '/root/.node-red'

# admin login = admin
# config with:
# HTTP_ADMIN_ROOT: admin console at http://your_server/admin
# ADMIN_PASSWORD : in this example, admin password = admin
# HTTP_USER & HTTP_PASSWORD : password protect for HTTP endpoints (in this example, login:user pass:admin)
# to create the password: node -e "console.log(require('bcryptjs').hashSync(process.argv[1], 8));" your-password-here
# Escape $ on recent docker-compose versions: replace $ by $$ in the result
# HTTP_STATIC: static pages in /root/.node-red/www
nodered:
  image: ericbenoit/node-red-w-config
  ports:
    - '80:1880'
  volumes_from:
    - nodereddata
  environment:
    - HTTP_ADMIN_ROOT=/admin
    - ADMIN_PASSWORD=$2a$08$O8jDv1NNVu30fdQrUkDe..s/cbECr.gk7mX7TOfoBxEjq2P33kT3O
# use the next line for most recent docker-compose versions
#    - ADMIN_PASSWORD=$$2a$$08$$O8jDv1NNVu30fdQrUkDe..s/cbECr.gk7mX7TOfoBxEjq2P33kT3O
    - HTTP_STATIC=/root/.node-red/www
    - HTTP_USER=user
    - HTTP_PASSWORD=$2a$08$O8jDv1NNVu30fdQrUkDe..s/cbECr.gk7mX7TOfoBxEjq2P33kT3O

```
