module.exports = {
    business: {
        login: 'SELECT id AS bid, name, info, hasBranch FROM business WHERE loginName = ? AND loginPwd = ?',
        getSubBusiness: 'SELECT id AS bid, name, info FROM business WHERE parentId = ?',
        getActListByBid: 'SELECT id AS aid, name AS actName FROM rdactivity WHERE bId = ? AND isDel = 0 ' +
        'ORDER BY createdTime DESC LIMIT 10',
        getActJoinStatus: 'SELECT ar.id, ar.isDel FROM rdactrecord ar, rdactivity a WHERE a.id = ? AND ' +
        'a.id = ar.parentId AND ar.contactPhone = ?',
        chargeOff: 'UPDATE rdactrecord SET isDel = ?, modifiedBy = ?, modifiedTime = NOW() WHERE id = ?',
    },
};