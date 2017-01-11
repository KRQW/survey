var sql = require('./sql');
var db = require('../routes/db');

module.exports = {
    list : function(req, res){
        db.exeSql({
            query: sql.result,
            params : [req.params.id]
        }, function(err, result){
            db.exeResult.get(res,err,result);
        });
    },
    find : function(req, res){
        db.exeSql({
            query: sql.find,
            params : [req.params.id]
        }, function(err, result){
            db.exeResult.get(res,err,result[0]);
        });
    }
};