# GeOrchestra datadir (config folder)  initializer

Retrieves and configures the geOrchestra datadir :
 * clones the georchestra datadir (git repo)
 * Replaces some values (see below), to allow for the usage of secrets, for sensitive information

It does not permit full customization fo the datadir. It is supposed that you first fork the [geOrchestra datadir repository](https://github.com/georchestra/datadir) and modify it to suit your needs. Then you will use this image to clone your fork, and replace the sensitive values like LDAP admin password and a few values that you might have to easily change, like the domain name, in order to simplify your work when developing.

It also allows you to use a private repository: see GIT_REPO and GIT_TOKEN descriptions.

## Environment variables :
 * GEORCHESTRA_FQDN: domain name for georchestra conf
 * DEST_DIR: where the repository will be cloned
 * GIT_REPO: the git repository to clone. You can include environment variables inside (escaped by $$), like a gitlab token for private repositories.
 * GIT_BRANCH: the branch to clone
 * GIT_TOKEN: token to use inside the GIT_REPO string. You can use secrets, and declare the GIT_TOKEN_FILE variable.
 * RECAPTCHA_PRIVATE_KEY: private key used for reacptcha (console). You can use secrets, and declare the RECAPTCHA_PRIVATE_KEY_FILE variable.
 * RESET_GEORCHESTRA_DATADIR: if set to `true`, removes the datadir before
  recreating a brand new one.
 * PGSQL_HOST: set the database host.
 * LDAP_HOST: LDAP host.
 * GEOSERVER_PRIVILEGED_USER_PASSWORD: password for the geoserver_privileged_user. You can use secrets and declare the GEOSERVER_PRIVILEGED_USER_PASSWORD_FILE variable.
 * LDAPADMIN_PASSWORD: password for the LDAP admin user. You can use secrets and declare the LDAPADMIN_PASSWORD_FILE variable.
 * PGSQL_ADMIN_PASSWORD: password of the postgresql admin user (`georchestra`).You can (should) use secrets and declare the PGSQL_ADMIN_PASSWORD_FILE variable.


## Usage

### Build
Clone this repository, then
`make docker-build IMAGE=pigeosolutions/georchestra-datadir-initializer`

### Push to this repository
`make docker-push IMAGE=pigeosolutions/georchestra-datadir-initializer`

### Run
`docker run -it --rm -e DEST_DIR=/mnt/georchestra_datadir -e GEORCHESTRA_FQDN=geor.pigeosolutions.fr -e GIT_BRANCH=docker-master -v [destination_volume]:/mnt  pigeosolutions/georchestra-datadir-initializer:latest`
