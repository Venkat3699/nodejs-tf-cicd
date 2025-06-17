const express = require('express');
const router = express.Router();

// Root endpoint
router.get('/', (req, res) => {
  res.status(200).json({ message: 'Welcome to the Node.js DevOps API' });
});

// Health check endpoint
router.get('/health', (req, res) => {
  res.status(200).json({ status: 'UP' });
});

// Hello endpoint
router.get('/hello', (req, res) => {
  res.json({ message: 'Welcome to the DevOps World!' });
});

module.exports = router;
