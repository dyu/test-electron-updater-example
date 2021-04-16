#!/bin/sh

[ -n "$1" ] && [ -n "$2" ] || { echo '1st arg (version) and 2nd arg (user) is required.'; exit 1; }

cat <<EOF > /tmp/notarize.json
{
  "notarize": [
    {
      "path": "dist/TestElectronUpdater-$1.dmg",
      "bundle_id": "com.github.dyu.testelectronupdaterexample",
      "staple": true
    }
  ],
  "apple_id": {
     "username": "$2",
     "password": "@env:AC_PASSWORD"
  }
}
EOF

gon -log-level=debug -log-json /tmp/notarize.json