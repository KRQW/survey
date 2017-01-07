module.exports = {
    list : 'SELECT id,title,DATE_FORMAT(createdTime,"%Y-%m-%d %H:%i:%s") AS createdTime FROM sheet',
    find : this.list + ' WHERE id = ?',
    add : 'INSERT INTO sheet (id,title,startTime,endTime,items) VALUES (REPLACE(UUID(), "-", ""),?,?,?,?)'
};