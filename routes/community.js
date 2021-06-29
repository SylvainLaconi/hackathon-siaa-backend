/* eslint-disable no-unused-vars */
/* eslint-disable camelcase */
const express = require('express');
const connection = require('../Config');

const router = express.Router();

// Route pour récupèrer la liste des communautés
router.get('/', (req, res) => {
  const sql = 'SELECT * FROM community';
  connection.query(sql, (err, result) => {
    if (err) {
      res.status(500).json({ errorMessage: err });
    } else {
      res.status(200).json(result);
    }
  });
});

// Route pour s'inscrire à une communauté

router.post('/', (req, res) => {
  const { user_id, community_id } = req.body;
  connection.query(
    'INSERT INTO user_has_community (user_id, community_id) VALUES (?, ?)',
    [user_id, community_id],
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).send('Error adding new community');
      } else {
        const newCommunity = { user_id, community_id };
        res
          .status(201)
          .send(
            `${`User ${newCommunity.user_id} added community ${newCommunity.community_id}`} correctly`
          );
      }
    }
  );
});

module.exports = router;
