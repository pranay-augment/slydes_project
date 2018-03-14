var express = require('express');
var passwordHash = require('password-hash');
var connection = require('./../config');
var app = express();
var flash = require('connect-flash');
var session = require('express-session');

var req = req;
var res = res;

module.exports.auth = function (req,res) {
	var username = req.body.username;
	var password = req.body.password;
	var role_id = req.body.role_id;
	var sql = 'select * from users where username = ?';
	connection.query(sql,[username,role_id],function (err,results) {
		if (err) {throw err}
			//console.log(results[0].password);
		else {
				if (results.length > 0) {
				if (passwordHash.verify(password,results[0].password)) {					
					req.session.adLogged = results[0].role_id;
					console.log(req.session.adLogged);
				if (req.session.adLogged == 1) {
				if (req.body.secret  == "123") {
					// req.flash('success_msg','Admin successfully logged in');
					// res.redirect('/admin/adhome');
					console.log('Admin successfully logged in');
				} else {
					// req.flash('error_msg','Incorrect Username & password');
					// res.redirect('/login');
					console.log('Incorrect Username & password');
				}

				}
				else if (req.session.adLogged == 2) {
					// req.flash('success_msg','Hr successfully logged in');
					// res.redirect('/hrHome');
					console.log('Hr successfully logged in');
				}
				else if (req.session.adLogged == 3) {

					req.session.uid = results[0].id;
					req.session.username = results[0].username;
					// req.flash('success_msg','Employee successfully logged in');
					// res.redirect('/user_pro/shopping_cart');
					console.log('Emp successfully logged in');

				}	
				}//pass verify
				 else {
					//req.flash('error_msg',"Username and password Not match");
					console.log('Username and password Not match');
				}
				}//user verify
			else {
					res.end("User not exist");
				}

			}//conn.query else
	})//conn.query

}