/* eslint-disable camelcase */
const express = require('express');
const connection = require('../Config');

const router = express.Router();

router.get('/', (req, res) => {
  const sql = 'SELECT * FROM post';
  connection.query(sql, (err, result) => {
    if (err) {
      res.status(500).json({ errorMessage: err });
    } else {
      res.status(200).json(result);
    }
  });
});

router.post('/', (req, res) => {
  const {
    title,
    picture,
    content,
    date,
    location,
    community_id,
    user_id,
    post_category_id,
  } = req.body;
  connection.query(
    'INSERT INTO post (title, picture, content, date, location, community_id, user_id, post_category_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
    [
      title,
      picture,
      content,
      date,
      location,
      community_id,
      user_id,
      post_category_id,
    ],
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).send('Error saving the user');
      } else {
        const id = result.insertId;
        const createdPost = {
          id,
          title,
          picture,
          content,
          date,
          location,
          community_id,
          user_id,
          post_category_id,
        };
        res.status(201).send(`${createdPost.title} correctly created`);
      }
    }
  );
});

module.exports = router;
