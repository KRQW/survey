module.exports = {
    result : "SELECT DATE_FORMAT(createdTime,'%Y-%m-%d') AS createdTime,uId,items FROM result WHERE sId = ?",
    find : 'SELECT id,title,DATE_FORMAT(createdTime,"%Y-%m-%d %H:%i:%s") AS createdTime,items FROM sheet WHERE id = ?'
};