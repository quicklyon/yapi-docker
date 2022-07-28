const userModel = require('./models/user.js');
const yapi = require('./yapi.js');
const commons = require('./utils/commons');
const mongoose = require('mongoose');
const dbModule = require('./utils/db.js');

yapi.commons = commons;
yapi.connect = dbModule.connect();


function exist() {
  yapi.connect
    .then(function() {
      let userCol = mongoose.connection.db.collection('user');
      userCol.countDocuments({"username": "admin"}).then(
        function(data) {
          if (data===0) {
             console.log("admin user not found, exec install.js");
             process.exit(128);
          } else {
             process.exit(0);
          }
        },
        
        function(err) {
          console.log(err)
          process.exit(1)
        }
      )

  }).catch(function(err) {
      throw new Error(err.message);
    });

}

exist()
