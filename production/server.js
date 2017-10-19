var serverFactory = require('spa-server')

var server = serverFactory.create({
  path: './',
  port: 8082,
  fallback: 'index.html'
})

server.start()
