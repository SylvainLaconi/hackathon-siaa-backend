/* eslint-disable camelcase */
const express = require('express');
const connection = require('../Config');

const router = express.Router();

router.get('/:id', (req, res) => {
  const userId = req.params.id;
  const sql = 'SELECT COUNT(*) FROM post WHERE user_id=?';
  connection.query(sql, [userId], (err, result) => {
    if (err) {
      res.status(500).json({ errorMessage: err });
    } else {
      res.status(200).json(result);
    }
  });
});

router.get(
  '/category/:cat&ampcommunity=:com1&ampcommunity=:com2&ampcommunity=:com3&ampcommunity=:com4',
  (req, res) => {
    connection.query(
      'SELECT * from post WHERE post_category_id=? AND community_id IN (?, ?, ?, ?)',
      [
        req.params.cat,
        req.params.com1,
        req.params.com2,
        req.params.com3,
        req.params.com4,
      ],
      (err, results) => {
        if (err) {
          console.log(err);
          res.status(500).send('Error retrieving data');
        } else {
          res.status(200).json(results);
        }
      }
    );
  }
);

router.delete('/:id', (req, res) => {
  const postId = req.params.id;
  connection.query('DELETE FROM post WHERE id = ?', [postId], (err) => {
    if (err) {
      console.log(err);
      res.status(500).send('Error deleting post');
    } else {
      res.status(200).send('Post successfully deleted');
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
