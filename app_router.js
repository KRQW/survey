
var express = require('express');
var router = express.Router();
var sheet = require('./app_controllers/sheet');

router.get('/list', sheet.list);

module.exports = router;