module.exports = {
    list : 'SELECT id,title,DATE_FORMAT(startTime,"%Y-%m-%d %H:%i:%s") AS startTime,DATE_FORMAT(endTime,"%Y-%m-%d %H:%i:%s") AS endTime,items FROM sheet',
    find : this.list + ' WHERE id = ?',
    add : 'INSERT INTO sheet (id,title,startTime,endTime,items) VALUES (REPLACE(UUID(), "-", ""),?,?,?,?)'
};