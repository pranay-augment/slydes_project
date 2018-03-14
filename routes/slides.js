var express = require('express');
var router = express.Router();
var app = express();
var connection = require('.././config');
var mailFunction = require('.././model/mailFunction');
var nodemailer = require('nodemailer');
var uniqid = require('uniqid');
var async = require('async');
var sequelize = require('.././sequelize_config');

//Slides for user
router.get('/user_slides/:user_id', function (req,res) {
var data =  req.body;
var user_id =  req.params.user_id;

var sql = " SELECT * FROM users u \
LEFT JOIN slydes_user us ON u.id=us.user_id \
LEFT JOIN slydes s ON s.id=us.slydes_id \
LEFT JOIN slydes_detail si ON si.slydes_id=s.id  \
WHERE u.id = ? group by si.slydes_id";
/*if (role == 'Company Admin') {
			var sql = " SELECT * FROM users u \
			LEFT JOIN slydes_user us ON u.id=us.user_id \
			LEFT JOIN slydes s ON s.id=us.slydes_id \
			LEFT JOIN slydes_detail si ON si.slydes_id=s.id \
			group by si.slydes_id";
		} else if (role == 'User') {
		
    }*/

connection.query(sql, [user_id], function(err, result) {
    if (err) {
      console.log(err);
      res.json({status:400, message:"No data", item: err});      
    } else {
      //console.log(result);
      res.json({status:200, message:"User slides", item: result});
    }
});
});


//View slides
router.get('/slide_images/:slide_id', function (req,res) {
	var slide_id = req.params.slide_id;

	var sql = " SELECT * FROM slides s LEFT JOIN slide_image si ON si.slide_id=s.id WHERE s.id = ?";

connection.query(sql, [slide_id], function(err, result) {
    if (err) {
      console.log(err);
      res.json({status:400, message:"No data", item: err});      
    } else {
      //console.log(result);
      res.json({status:200, message:"User slides", item: result});
    }
});
});



//Share slide
router.post('/share_slide', function (req,res) {
	  var slide_id = req.body.slide_id;
    var allData = [];
    var failEmails = [];
    var userEmails = req.body.email;
    var date = new Date().toISOString()
                          .replace(/T/, ' ')
                          .replace(/\..+/, '')     

      async.forEachOf(userEmails, (email, index, callback) => {
        var activation_key = uniqid('Slydes-')+'-'+date;
        var data = {
          slide_id: slide_id,
          email: email,
          activation_key: activation_key
        }
        allData.push([slide_id, email, activation_key]);
        if (userEmails.length == allData.length) {
        var sql = "INSERT INTO `shared_slides`(`slide_id`, `email`, `activation_key`) VALUES ?";        
        //insert Data
        insertData(res, sql, allData);
        }

        var mailSubject = "SLYDES - Slides is shared with you!";
        var textFormat = "Please click below link to view slides";
        var htmlFormat = "<h1>SLYDES</h1><br> \
        <div><a href='"+req.body.link+"/"+activation_key+"'>Slide link</a></div>";
        //Email
        mailFunction.sendEmail(email, mailSubject, textFormat, htmlFormat, function(resposne) {
          console.log(resposne);
          if (resposne == 'Mail Sent') {
            return true;
          } else {
            failEmails.push(email);
          }
        });


       }, function (err) {
        if (err) console.error(err.message);
       
       });

});


function insertData(res, sql, all_data) {
  connection.query(sql, [all_data], function(err, resposne) {
    if (err) {console.log(err);}
    console.log(resposne);
    res.json({status:200, message:"User slides", item: resposne});
  })
}


router.get('/view_slide_usercheck/:temp_key', function (req, res) {
  var temp_key = req.params.temp_key;
  console.log('view_slide_usercheck');
  console.log(temp_key);
  var sql = "SELECT * FROM shared_slides WHERE activation_key = ? ";
  connection.query(sql, [temp_key], function (err, resposne) {
    if (err) {console.log(err)}
      if (resposne == '') {
        res.json({status:400, message:"Access Error"});
      } else {
        res.json({status:200, message:"User slides", item: resposne});
      }
  })
})


module.exports = router;