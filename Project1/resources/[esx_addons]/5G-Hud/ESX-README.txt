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

1- go to Config.lua and in line 12 you must put "ESX" for example:

Config.Framework = "ESX"

3- If you are going to use Black Money!.
	-Set line 37 to true Example:
		Config.USEMoneyDuty = true

4- If you are going to use the VIP coins.
	-Set line 38 to true Example:
		Config.USEMoneyVIP = true
	-Go to es_extended/config.lua and on line 8 add this money = _U('account_money'),
		Example:
			Config.Accounts = {
				bank = _U('account_bank'),
				black_money = _U('account_black_money'),
				money = _U('account_money'),
				coins = 'VIP Coins',
			}

5- If you want to use stress system, you must put true on line 64. For example:

	-Config.USEStress = true

	You must find your own stress resource, in ESX, it is not normally to use Stress

6- To install the SAFE ZONE, you must go to line 84 and put true.
example:
Config.USESafeZone = true

You must find a resource that works with a safe zone and add the event that I put as an example in the Config.lua line 86 to 90.

If you don't have any safe zone resources, I can try one for you, open a tick on my Discord and I'll send it to you. 
like if you have one, and you have a problem with adding the safe zone I can help you.

7 - Add the HUD in your resources!... and ensure