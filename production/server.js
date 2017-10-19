var serverFactory = require('spa-server')

var server = serverFactory.create({
  path: './',
  port: 5000,
  fallback: 'index.html'
})

server.start()
