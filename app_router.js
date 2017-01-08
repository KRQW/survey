
var express = require('express');
var router = express.Router();
var sheet = require('./app_controllers/sheet');

router.get('/list', sheet.list);
router.get('/find/:id', sheet.find);

module.exports = router;