RegisterNetEvent('sunshinerp_weaponcraft:kupelemen')
AddEventHandler('sunshinerp_weaponcraft:kupelemen', function(odebrane)
	local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
	if xPlayer.getInventoryItem('skladnikidobroni').count < 2 then
		if xPlayer.getMoney() >= 2000 then
			xPlayer.removeMoney(2000)
			xPlayer.addInventoryItem('skladnikidobroni', 1)
			TriggerClientEvent('esx:showNotification', _source, 'Zakupiłeś składniki do wytwarzania!')
		else
			TriggerClientEvent('esx:showNotification', _source, 'Nie posiadasz wystarczająco gotówki!')
		end
	else
		TriggerClientEvent('esx:showNotification', _source, 'Posiadasz maksymalną ilość tego przedmiotu!')
	end
end)

RegisterNetEvent('sunshinerp_weaponcraft:stworz')
AddEventHandler('sunshinerp_weaponcraft:stworz', function(bron)
	local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
	count = exports.ox_inventory:Search(source, 'count', 'skladnikidobroni')

	if count > 0 and (bron == 'weapon_browning' or bron == 'weapon_vintagepistol' or bron == 'weapon_deagle' or bron == 'weapon_m92')then
		exports.ox_inventory:RemoveItem(_source, 'skladnikidobroni', 1)
		exports.ox_inventory:AddItem(_source, bron, 1)
		exports.ox_inventory:AddItem(_source, 'ammo-9', 25)
	else
		TriggerClientEvent('esx:showNotification', _source, 'Nie posiadasz części do wytworzenia broni!')
	end
end)