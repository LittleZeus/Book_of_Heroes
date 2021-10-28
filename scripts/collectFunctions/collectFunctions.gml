
function collectCoins(_amount){
	global.playerMoney +=  _amount;
}

function collectAmmo(_item,_amount){
	//array = [type, amount]
	global.playerAmmo[_item] += _amount;
}