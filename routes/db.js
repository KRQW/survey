var mysql = require('mysql'),
    config = require('./config'),
    pool = mysql.createPool(config.local);

exports.exeSql = function(sql,cb){

  pool.getConnection(function (err, connection) {

    var p = sql.params || null;

    if(p)console.log('exeSql params: ' + JSON.stringify(p));
    var query = connection.query(sql.query, p, function (err, result) {
      if(err){
        console.log('exeSql err: ' + err.message);
        if(cb)cb(err, result);
      }else{
        if(cb)cb(false, result);
      }

    });
    console.log('exeSql sql: ' + query.sql);
    connection.release();
  });
};

exports.exeResult = {
  /***
   *
   * @param res
   * @param err
   * @param result
   * @param cb 查询成功需要处理的逻辑回调
   * @param isFindOne 是否是查询单条数据
   */
  get : function(res,err,result,cb,isFindOne) { //get查询处理方法
    res.header('Access-Control-Allow-Origin', '*');//解决跨域问题
    if (err) {
      res.send({code: 4, msg: 'sql异常', data: []});
    } else {
      //console.log('result: ' + JSON.stringify(result));
      if (result) {
        if (cb) cb();
        else res.send({code: 0, msg: '获取成功', data: isFindOne ? result[0] : result});
      } else {
        res.send({code: 3, msg: '暂无数据', data: []});
      }
    }
  },
  /***
   *
   * @param res
   * @param err
   * @param result
   * @param cb 更新成果需要处理的逻辑回调
   */
  post : function(res,err,result,cb,isList) { //post更新数据处理方法
    res.header('Access-Control-Allow-Origin', '*');
    if (err) {
      res.send({code: 4, msg: 'sql异常', data: []});
    } else {
      if (result.affectedRows > 0) {
        if (cb) cb();
        else res.send({code: 0, msg: '提交成功', data: isList ? result : []});
      } else {
        res.send({code: 3, msg: '无修改记录', data: []});
      }
    }
  }//post
};
