const express = require('express');

const app = express();

const port = 80;


app.get('/', (req, res) => {
  res.status(200).json({
    message: 'Welcome'
  })
})

app.listen(port, () => console.log(`Server running on port: ${port}`));