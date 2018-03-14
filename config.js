var mysql = require('mysql');
require('dotenv').config();


var connection = mysql.createConnection({
	host: process.env.DB_HOST,
	user: process.env.DB_USER,
	password: process.env.DB_PASS,
	database: process.env.DATABASE
});



connection.connect(function (err) {
	// if (err) { console.log(err)};
	if(err) {
		console.log('DB error');
    	connection.end();
    	console.error(err);
    	return;
	}
	console.log("Database connected");
});



module.exports = connection;