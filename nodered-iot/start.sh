#!/bin/bash


  if [ $HTTP_ADMIN_ROOT ]; then
    sed -i "s|//httpAdminRoot:|httpAdminRoot:|" /usr/local/lib/node_modules/node-red/settings.js
    sed -i "s|httpAdminRoot: '[/_a-zA-Z0-9-]*'|httpAdminRoot: '$HTTP_ADMIN_ROOT'|" /usr/local/lib/node_modules/node-red/settings.js
  fi

  if [ $ADMIN_PASSWORD ]; then
    sed -i "s|// default password : admin|adminAuth: { type: \"credentials\", users: [{ username: \"admin\", password: \"$ADMIN_PASSWORD\", permissions: \"*\" }] },|" /usr/local/lib/node_modules/node-red/settings.js   
  fi

  if [ $HTTP_STATIC ]; then
    sed -i "s|//httpStatic:|httpStatic:|" /usr/local/lib/node_modules/node-red/settings.js
    sed -i "s|httpStatic: '[/_a-zA-Z0-9-]*'|httpStatic: '$HTTP_STATIC'|" /usr/local/lib/node_modules/node-red/settings.js
  fi

# start all the services
/usr/local/bin/node-red


