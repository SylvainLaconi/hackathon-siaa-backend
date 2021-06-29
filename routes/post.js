/* eslint-disable camelcase */
const express = require('express');
const connection = require('../Config');

const router = express.Router();

// Route pour récupérer le nombre de posts d'un user
router.get('/:id', (req, res) => {
  const userId = req.params.id;
  const sql = 'SELECT COUNT(id) AS count FROM post WHERE user_id=?';
  connection.query(sql, [userId], (err, result) => {
    if (err) {
      res.status(500).json({ errorMessage: err });
    } else {
      res.status(200).json(result);
    }
  });
});

// Route pour récupèrer tous les posts avec détails
router.get('/', (req, res) => {
  connection.query(
    'SELECT p.id, p.post_category_id, p.community_id, c.community_name, p.title, p.picture, p.content, p.date, p.location, u.user_id, u.firstname, u.lastname, u.user_picture, u.job FROM user_has_community j JOIN user u ON j.user_id=u.user_id JOIN post p ON j.community_id=p.community_id JOIN community c ON j.community_id=c.id ORDER BY p.id ASC;',
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).send('Error retrieving data');
      } else {
        res.status(200).json(results);
      }
    }
  );
});

// Route pour supprimer un post par son id
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

// Route pour ajouter un post
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
