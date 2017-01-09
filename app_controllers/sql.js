module.exports = {
	sheet : {
	    list : 'SELECT id,title,DATE_FORMAT(createdTime,"%Y-%m-%d %H:%i:%s") AS createdTime FROM sheet ORDER BY createdTime DESC LIMIT ?,20',
	    find : 'SELECT id,title,DATE_FORMAT(createdTime,"%Y-%m-%d %H:%i:%s") AS createdTime,items FROM sheet WHERE id = ?'
	},result : {
		add : "INSERT INTO result (id,uId,sId,items) VALUES (REPLACE(UUID(), '-', ''),?,?,?)"
	}
};