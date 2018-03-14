var express = require('express');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var path = require('path');
var passwordHash = require('password-hash');
var exphbs = require('express-handlebars');
var connection = require('./config');
var cors = require('cors');
require('dotenv').config()

//routes
var user = require('./routes/users');
var slides = require('./routes/slides');

//Multer for image upload
var multer = require('multer');
var upload = multer({ dest: 'public/images/' });
var router = express.Router();
var app = express();
var port = process.env.PORT;

//Controllers
//var auth = require('./controller/auth');

//View engile
app.set('views', path.join(__dirname,'views'));
app.engine('handlebars',exphbs({defaultLayout:'layout'}));
app.set('view engine','handlebars');

//BodyParser middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use(cookieParser());

//CORS
app.use(cors());

//Making Puplic folder
//app.use(express.static(path.join(__dirname,'public')));
app.use(express.static(__dirname + '/public/images'));
//session
var session = require('express-session');
app.use(session({
   resave: true,
    saveUninitialized: true,
	secret: 'raswi'
}));


// Add headers
app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');    
    res.setHeader('Access-Control-Allow-Origin', process.env.NG_HOST);        
    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Credentials', 'true');
    res.setHeader('Access-Control-Allow-Headers', 'x-account, accept, access-control-request-origin');
    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);
    // Pass to next layer of middleware
    next();
});


// caching disabled for every route
app.use(function(req, res, next) {  
  res.set('Cache-Control', 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0');
  next();
});

//routes init
app.use('/user', user);
app.use('/slide', slides);


app.get('/post', function (req,res) {  
  console.log(process.env.PORT);
  res.json('Im node js ');
});

app.listen(port);
console.log("The listing port is " + port);