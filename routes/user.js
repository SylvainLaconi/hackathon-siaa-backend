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

// Route pour récupèrer un user
router.get('/:id', (req, res) => {
  const sql = 'SELECT * FROM user WHERE user_id=?';
  connection.query(sql, [req.params.id], (err, result) => {
    if (err) {
      res.status(500).json({ errorMessage: err });
    } else {
      res.status(200).json(result);
    }
  });
});

// Route pour récupèrer la liste des communautés d'un user
router.get('/community/:id', (req, res) => {
  const sql =
    'SELECT c.id, c.community_name FROM user_has_community j JOIN community c ON j.community_id=c.id WHERE j.user_id=?;';
  connection.query(sql, [req.params.id], (err, result) => {
    if (err) {
      res.status(500).json({ errorMessage: err });
    } else {
      res.status(200).json(result);
    }
  });
});

// Route pour récupèrer un user par son lastname
router.get('/lastname/:name', (req, res) => {
  const sql = `SELECT * FROM user WHERE lastname=?`;
  connection.query(sql, [req.params.name], (err, result) => {
    if (err) {
      res.status(500).json({ errorMessage: err });
    } else {
      res.status(200).json(result);
    }
  });
});

module.exports = router;
