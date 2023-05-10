██    ██ ██      ████████ ██████   █████  
██    ██ ██         ██    ██   ██ ██   ██ 
██    ██ ██         ██    ██████  ███████ 
██    ██ ██         ██    ██   ██ ██   ██ 
 ██████  ███████    ██    ██   ██ ██   ██ 


CONTACT/CONTACTO

DISCORD: https://discord.io/ultracode


ENGLISH
Important:

EVERYTHING IS IN THE CONFIG.LUA ANY HELP, WRITE ME ON DISCORD


Installation is easy, everything is detailed in Config.lua 

1- go to fxmanifest.lua and uncomment line 19, 20 and 45.
2- go to Config.lua and in line 12 you must put "QBCORE" for example:

Config.Framework = "QBCORE"

3- If you are going to use Dirty Money! Here I am going to introduce you how to install dirty money on your server.
	-Set line 37 to true Example:
		Config.USEMoneyDuty = true
	-Go to qb-core/config.lua and on line 9 add this: ['DirtyMoney'] = 0
		Example:
		QBConfig.Money.MoneyTypes = { ['cash'] = 500, ['bank'] = 5000, ['crypto'] = 0, ['dirtymoney'] = 0}

4- If you are going to use the VIP coins, you should do the same as you did with the dirty money.
	-Set line 38 to true Example:
		Config.USEMoneyVIP = true
	-Go to qb-core/config.lua and on line 9 add this: ['coins'] = 0
		Example:
	QBConfig.Money.MoneyTypes = {['cash'] = 500, ['bank'] = 5000, ['crypto'] = 0, ['coins'] = 0}

5- If you want to use stress system, you must put true on line 64. For example:

Config.USEStress = true

the stress system is already included.

6- To install the SAFE ZONE, you must go to line 84 and put true.
example:
Config.USESafeZone = true

You must find a resource that works with a safe zone and add the event that I put as an example in the Config.lua line 86 to 90.

If you don't have any safe zone resources, I can try one for you, open a tick on my Discord and I'll send it to you. 
like if you have one, and you have a problem with adding the safe zone I can help you.

7 - Add the HUD in your resources!... and ensure