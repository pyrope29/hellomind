var mysql = require('mysql');
var dbConfig = {
   host : 'localhost',
   user : 'hellomind',
   password : '1111',
   port : 3306,
   multipleStatements : true,
   database : 'hellomind'
};

var pool = mysql.createPool(dbConfig);
module.exports = pool;
