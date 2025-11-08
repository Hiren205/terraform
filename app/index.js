// Import express
const express = require('express');

// Initialize app
const app = express();
const PORT = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.status(200).json({ status: 'ok', message: 'api is working' });
});

// Health check route
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok', message: 'Server is healthy' });
});

// Start server
app.listen(PORT, () => {
  console.log(`✅ Server running on http://localhost:${PORT}`);
});
