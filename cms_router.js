
var express = require('express');
var router = express.Router();

var result = require('./cms_controllers/result');
router.get('/results/:id', result.list);
router.get('/find/:id', result.find);

module.exports = router;