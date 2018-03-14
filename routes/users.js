var express = require('express');
var router = express.Router();
var app = express();
var connection = require('.././config');
var uniqid = require('uniqid');
var passwordHash = require('password-hash');
var moment = require("moment");
var nodemailer = require('nodemailer');
var multer = require('multer');



//3000
let node_host = process.env.NODE_HOST;
//4200
let ng_host = process.env.NG_HOST;

//mail setup
var smtpConfig = {
    service: 'gmail',    
    secure: false, // use SSL
    port: 25,    
    auth: {
        user: "4testurposeonly@gmail.com",
        pass: "G2TECH@!@#"
    },
    tls: {
      rejectUnauthorized: false
    }
};
var transporter = nodemailer.createTransport(smtpConfig);


//User Login
router.post('/login',function (req,res) {
//var pid = req.params.makeId;
var cred =  req.body;
console.log(cred);

var email = cred.email;
var password = cred.password;

var role_id = cred.role_id;
var status = 1;
var sql = 'select u.id id, u.email email, u.password password, r.role_name role_name, r.id role_id \
          from users u left join roles r on u.role=r.id where u.email = ? and status = ?';
  connection.query(sql,[email, status],function (err, results, rows) {
    if (err) {
      console.log(err)
      res.json('error');
    }
    else {
        if (results.length > 0) {
        if (passwordHash.verify(password,results[0].password)) {
          //console.log(results);
          console.log('Successfully logged in');          
          res.json({status:200, message:"Login Success", item:results});
        }//pass verify
         else {
          //req.flash('error_msg',"Username and password Not match");
          console.log('Username and Password Not match');
          res.json({status:400, message:"Login Error"});
        }
        }//user verify
      else {
          console.log('Invalid Username and Password');
          res.json({status:400, message:"Login Error"});
        }

      }//conn.query else
  })//conn.query
})



// var storage = multer.diskStorage({
//   // destination  
//   destination: function (req, file, cb) {
//     cb(null, './public/images/user/')
//   },
//   filename: function (req, file, cb) {
//     cb(null, file.originalname + '-' + uniqid()+'.'+file.mimetype.slice(6))
//     //cb(null, file.originalname+uniqid());
//   }
// });
// var upload = multer({ storage: storage }).any();



//User Register
router.post('/register', function (req,res) {
var data =  req.body;
var sql = "INSERT INTO users SET ?";
var user = {        
          "email": data.email,        
          "company_name": data.companyname,
          "password": passwordHash.generate(data.password),
          }
connection.query(sql, user, function(err, result) {
    if (err) {
      console.log(err);
      res.json({status:400, message:"Register failed", item: err});      
    } else {
      console.log(result);
      res.json({status:200, message:"Register success", item: result});
    }  
});
});



//Verify password Link
router.get('/verify_password/:uniq_id/:user_id', function (req, res) {
    var params = req.params;
    var uniq_id = params.uniq_id;
    var user_id = params.user_id;    
    console.log(params);
    var sql = 'select * from users where id = ? and activation_key = ? ';    
    /* Checking for temprory key destroy or not */
    connection.query(sql, [user_id, uniq_id], function(err, result) {
      if (err) { res.json(400); } 
      else {
      if (result  == "") {
        console.log('No result 400');
        console.log(result);
        //http://172.16.3.225:4200
        res.redirect(ng_host+'/login');
        //res.json(400);
      } else {
          console.log('result');
          console.log(result);          
          var temp_key = result[0].activation_key;        
          //http://172.16.3.225:4200
              res.redirect(ng_host+'/change-password/'+temp_key);          
      }
    }
    });

});



module.exports = router;