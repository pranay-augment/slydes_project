var express = require('express');
var router = express.Router();
var connection = require('.././config');
var uniqid = require('uniqid');
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
        // user: "4testurposeonly@gmail.com",
        // pass: "G2TECH@!@#"
        user: "testuseonly18@gmail.com",
        pass: "1234ASDF"
    },
    tls: {
      rejectUnauthorized: false
    }
};
var transporter = nodemailer.createTransport(smtpConfig);

module.exports = {
  sendEmail: function (toEmail, subject=null, textFormat=null, htmlForamt = null, callbackMail) {
    var mailOptions = {
      from: '"The Slydes" <4testurposeonly@gmail.com>',
      to: toEmail,
      subject: subject,
      text: textFormat,
      html: htmlForamt
    };
    // callbackMail("Mail Sent");
    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        callbackMail(error);
      } else {
        // console.log('Email sent: ' + info.response);
        callbackMail("Mail Sent");
      }
    });
  },
  anothFunction: function () {
    // whatever
  }
};