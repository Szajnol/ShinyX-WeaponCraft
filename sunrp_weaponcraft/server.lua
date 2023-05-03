RegisterNetEvent('sunshinerp_weaponcraft:kupelemen')
AddEventHandler('sunshinerp_weaponcraft:kupelemen', function(odebrane)
	if exports.ox_inventory:Search(source, 'count', 'skladnikidobroni') < 2 then
		if exports.ox_inventory:Search(source, 'count', 'money') >= 2000 then
			exports.ox_inventory:RemoveItem(source, 'skladnikidobroni', 2000)
		        exports.ox_inventory:AddItem(source, 'skladnikidobroni', 1)
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
	count = exports.ox_inventory:Search(source, 'count', 'skladnikidobroni')
	if count > 0 and (bron == 'weapon_browning' or bron == 'weapon_vintagepistol' or bron == 'weapon_deagle' or bron == 'weapon_m92')then
		exports.ox_inventory:RemoveItem(source, 'skladnikidobroni', 1)
		exports.ox_inventory:AddItem(source, bron, 1)
		exports.ox_inventory:AddItem(source, 'ammo-9', 25)
	else
		TriggerClientEvent('esx:showNotification', source, 'Nie posiadasz części do wytworzenia broni!')
	end
end)
