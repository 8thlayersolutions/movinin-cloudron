import http from 'node:http'

const options = {
  host: '127.0.0.1',
  port: Number.parseInt(process.env.PORT || '4004', 10),
  path: '/api/health',
  timeout: 5000,
}

const req = http.request(options, (res) => {
  if (res.statusCode && res.statusCode >= 200 && res.statusCode < 500) {
    process.exit(0)
  }
  process.exit(1)
})

req.on('error', () => process.exit(1))
req.on('timeout', () => {
  req.destroy()
  process.exit(1)
})
req.end()
