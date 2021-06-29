/* eslint-disable camelcase */
const express = require('express');
const connection = require('../Config');

const router = express.Router();

// Route pour récupèrer la liste des users avec détails
router.get('/', (req, res) => {
  const sql = 'SELECT * FROM user';
  connection.query(sql, (err, result) => {
    if (err) {
      res.status(500).json({ errorMessage: err });
    } else {
      res.status(200).json(result);
    }
  });
});

module.exports = router;
