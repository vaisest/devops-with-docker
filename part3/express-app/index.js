const express = require('express')
const app = express()

app.get('/', (req, res) => {
  res.send('<h1>Hello localhost and, more importantly, Heroku! widepeepoHappy</h1>')
})

const PORT = process.env.PORT || 8080

app.listen(PORT, () => {
  console.log(`Server running on port asdd ${PORT}`)
})