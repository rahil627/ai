const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.json());

const markers = [];

app.get('/api/markers', (req, res) => {
  res.json(markers);
});

app.post('/api/markers', (req, res) => {
  const { lat, lng } = req.body;
  const id = markers.length + 1;
  markers.push({ id, lat, lng });
  res.status(201).json({ id, lat, lng });
});

app.put('/api/markers/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const { lat, lng } = req.body;
  const marker = markers.find(m => m.id === id);
  if (marker) {
    marker.lat = lat;
    marker.lng = lng;
    res.json(marker);
  } else {
    res.sendStatus(404);
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
