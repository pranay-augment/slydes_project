const Sequelize = require('sequelize');
const sequelize = new Sequelize(process.env.DATABASE, process.env.DB_USER, '', {
  host: process.env.DB_HOST,
  dialect: 'mysql',

//staging
  // host:"localhost", 
  // user:"root",
  // password:"g@T3ch!@#",
  // database:"augment_qti"
  // pool: {
  //   max: 5,
  //   min: 0,
  //   acquire: 30000,
  //   idle: 10000
  // },

  
});


//Checking connection status
var test = sequelize.authenticate()
    .then(function () {
        console.log("sequelize CONNECTED! ");
    })
    .catch(function (err) {
        console.log("sequelize SOMETHING DONE GOOFED");
    })
    .done();


module.exports = sequelize;