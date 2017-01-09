var sql = require('./sql');
var db = require('../routes/db');

module.exports = {
    add : function(req, res){
        db.exeSql({
            query: sql.result.add,
            params :[req.ip,req.params.sId,req.params.items+""]
        }, function(err, result){
            db.exeResult.post(res,err,result);
        });
    }
};