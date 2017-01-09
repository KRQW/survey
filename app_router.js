
var express = require('express');
var router = express.Router();

var sheet = require('./app_controllers/sheet');
var result = require('./app_controllers/result');

router.get('/list/:pageIndex', sheet.list);
router.get('/find/:id', sheet.find);
router.get('/add_result/:sId/:items', result.add);

module.exports = router;