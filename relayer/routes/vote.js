var express = require('express');
var router = express.Router();
var handler = require("../handlers/vote");
var ethers = require("ethers");

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send(handler(req));
});

module.exports = router;
