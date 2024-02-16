const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const port = 3000; // Choose a port for your server

app.use(cors());
app.use(bodyParser.json());

// Replace these credentials with your MySQL database details
const mysql = require('mysql');
const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'Dion',
  password: '12345',
  database: 'bonktoys'
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
  } else {
    console.log('Connected to MySQL');
  }
});

// Fetch shop stock data
app.get('/api/shopstock', (req, res) => {
  connection.query('SELECT itemName, quantity FROM shop_stock', (err, results) => {
    if (err) {
      console.error('Error executing query:', err);
      res.status(500).json({ error: 'Internal Server Error' });
    } else {
      res.json(results);
    }
  });
});

// Update shop stock data
app.post('/api/shopstock/update', (req, res) => {
  const { itemName, quantity } = req.body;

  connection.query('UPDATE shop_stock SET quantity = ? WHERE itemName = ?', [quantity, itemName], (err, results) => {
    if (err) {
      console.error('Error executing query:', err);
      res.status(500).json({ error: 'Internal Server Error' });
    } else {
      res.json({ message: 'Stock updated successfully' });
    }
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
