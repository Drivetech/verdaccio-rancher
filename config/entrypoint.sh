#!/usr/bin/env sh

# Generate htpasswd file
if [ ! -f /verdaccio/conf/htpasswd ]
then
  htpasswd -b -c /verdaccio/conf/htpasswd $ADMIN_USERNAME $ADMIN_PASSWORD
fi

# Change storage directory
sed -i -E "s/storage: .+/storage: \/storage/g" /verdaccio/conf/config.yaml

# Set max_users
if [ -n "${MAX_USERS}" ]
then
  sed -i -E "s/#?(\s+)?max_users: [0-9-]+/max_users: $MAX_USERS/g" /verdaccio/conf/config.yaml
fi

exec "$@"
