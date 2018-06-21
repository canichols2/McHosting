var express = require('express'),
    app = express(),
    http = require('http')
    server = http.Server(app),
    io = require('socket.io')(server),
    request = require('request'),
    cheerio = require('cheerio'),
    fs = require('fs-extra'),
    cp = require('child_process')
module.exports.express = express
module.exports.app = app
module.exports.http = http
module.exports.server = server
module.exports.io = io
module.exports.request = request
module.exports.cheerio = cheerio
module.exports.fs = fs
module.exports.cp = cp
module.exports.spawn = cp.spawn
module.exports.exec = cp.exec
module.exports.fork = cp.fork