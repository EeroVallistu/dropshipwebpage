require('dotenv').config();
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors());

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

connection.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the database');
});

app.get('/api/products', (req, res) => {
    connection.query('SELECT * FROM products', (err, results) => {
        if (err) {
            console.error('Error fetching products:', err);
            res.status(500).send('Error fetching products');
            return;
        }
        res.json(results);
    });
});

app.get('/api/accounts', (req, res) => {
    connection.query('SELECT * FROM users', (err, results) => {
        if (err) {
            console.error('Error fetching accounts:', err);
            res.status(500).send('Error fetching accounts');
            return;
        }
        res.json(results);
    });
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});

app.use(express.json());

app.post('/api/login', (req, res) => {
    const { username, password } = req.body;
    console.log(`Login attempt for username: ${username}`);

    connection.query('SELECT * FROM users WHERE username = ? AND is_admin = 1', [username], (err, results) => {
        if (err) {
            console.error('Error fetching user:', err);
            res.status(500).send('Error fetching user');
            return;
        }
        if (results.length === 0) {
            console.log('No user found with the provided username and admin status');
            res.json({ success: false, message: 'Invalid username or password' });
            return;
        }
        const user = results[0];

        if (password === user.password) {
            res.json({ success: true });
        } else {
            console.log('Password does not match');
            res.json({ success: false, message: 'Invalid username or password' });
        }
    });
});