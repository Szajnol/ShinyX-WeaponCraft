Config = {
    ["sandy"] = {
		pos = vector3(1263.11, -1084.95, 39.40-1.1),
		width = 1.0,
		length = 2.2,
		name = "weaponcraftSandy",
		heading = 155.97,
		minZ = 38.2,
		maxZ = 40.0,
	},
	["paleto"] = {
		pos = vector3(-580.26, -1591.56, 26.75),
		width = 1.0,
		length = 2.2,
		name = "weaponcraftPaleto",
		heading = 25.646988868713,
		minZ = 24.75,
		maxZ = 28.9,
    },
}

Citizen.CreateThread(function()
	local object = CreateObject(904554844, vector3(1263.11, -1084.95, 39.40-1.1), false)
	FreezeEntityPosition(object, true)
	SetEntityHeading(object, 53.0)
	local object2 = CreateObject(904554844, vector3(-580.26, -1591.56, 26.75-0.95), false)
	FreezeEntityPosition(object2, true)
	SetEntityHeading(object2, 25.0)

	RequestModel(joaat("a_m_y_epsilon_01"))
	while not HasModelLoaded(joaat("a_m_y_epsilon_01")) do
		Wait(0)
	end
	SpawnedPed = CreatePed(2, "a_m_y_epsilon_01", -1070.24, -1653.79, 4.42 - 1.0, 128.47, false, true)
	FreezeEntityPosition(SpawnedPed, true)
	SetEntityInvincible(SpawnedPed, true)
	SetBlockingOfNonTemporaryEvents(SpawnedPed, true)
	exports.qtarget:AddTargetEntity(SpawnedPed, {
		options = {
			{
				event = "sunshinerp_weaponcraft:kupelemen",
				icon = "fas fa-sack-dollar",
				label = "KUP [$2000]",
			},
		},
		distance = 2
	})

	for k, v in pairs(Config) do
		exports.qtarget:AddBoxZone(v.name, v.pos, v.width, v.length, {
			name = v.name,
			heading = v.heading,
			debugPoly = false,
			minZ = v.minZ,
			maxZ = v.maxZ,
		}, {
			options = {
				{
					event = "sunshinerp_weaponcraft:stworz",
					icon = "fas fa-hands",
					label = "Otwórz stół",
				},
			},
			distance = 3.5
		})
	end
end)

RegisterNetEvent('sunshinerp_weaponcraft:kupelemen', function(job)
	TriggerServerEvent('sunshinerp_weaponcraft:kupelemen')
end)

local cooldown = false
local wytwarza = false

RegisterNetEvent('sunshinerp_weaponcraft:stworz', function()
	SetNuiFocus(true, true)
	SendNUIMessage({
		action = 'open'
	})

	exports['sunshine_keys']:StartKey({
		useone = true, 
		textone = 'Zamknij', 
		imgone = 'keys/esc.png', 
		keyone = 'Escape', 
		usetwo = false})

	-- ESX.UI.Menu.CloseAll()
	
	-- elements = {}
	
	-- elements[#elements + 1] = {label = "Browning", value = "weapon_browning"}
	-- elements[#elements + 1] = {label = "Vintage pistol", value = "weapon_vintagepistol"}
	-- elements[#elements + 1] = {label = "Deagle", value = "weapon_deagle"}
	-- elements[#elements + 1] = {label = "M92", value = "weapon_m92"}
	
	-- Wait(100)
	
	-- ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
	-- 	title    = "Wybierz broń",
	-- 	align    = 'center',
	-- 	elements = elements
	-- }, function(data, menu)

	-- 	if not wytwarza then
	-- 		if not cooldown then
	-- 			count = exports.ox_inventory:Search('count', 'skladnikidobroni')
	-- 			if count > 0 then
	-- 				wytwarza = true
	-- 				menu.close()
	-- 				FreezeEntityPosition(PlayerPedId(), true)
	-- 				ESX.ShowProgressBar('Trwa tworzenie broni', 150000)
	-- 				Wait(150000)
	-- 				FreezeEntityPosition(PlayerPedId(), false)
	-- 				TriggerServerEvent('sunshinerp_weaponcraft:stworz', data.current.value)
	-- 				wytwarza = false
	-- 				cooldown = true
	-- 			else
	-- 				ESX.ShowNotification('Nie posiadasz składników do broni!')
	-- 			end
	-- 		else
	-- 			ESX.ShowNotification("Nie możesz teraz tego zrobić!")
	-- 		end
	-- 	else
	-- 		ESX.ShowNotification("Wytwarzasz już broń!")
	-- 	end
	-- end, function(data, menu)
	-- 	menu.close()
	-- end)
end)

RegisterNUICallback('browning', function()
	SetNuiFocus(false, false)
	TriggerServerEvent('sunshinerp_weaponcraft:stworz', 'weapon_browning')
	exports['sunshine_keys']:EndKeys()
end)

RegisterNUICallback('vintage', function()
	SetNuiFocus(false, false)
	TriggerServerEvent('sunshinerp_weaponcraft:stworz', 'weapon_vintagepistol')
	exports['sunshine_keys']:EndKeys()
end)

RegisterNUICallback('deagle', function()
	SetNuiFocus(false, false)
	TriggerServerEvent('sunshinerp_weaponcraft:stworz', 'weapon_deagle')
	exports['sunshine_keys']:EndKeys()
end)

RegisterNUICallback('m92', function()
	SetNuiFocus(false, false)
	TriggerServerEvent('sunshinerp_weaponcraft:stworz', 'weapon_m92')
	exports['sunshine_keys']:EndKeys()
end)

RegisterNUICallback("closeui", function()
	SetNuiFocus(false, false)
	exports['sunshine_keys']:EndKeys()
end)

RegisterNetEvent("onResourceStop", function(res)
	if res ~= GetCurrentResourceName() then
		return
	end
	DeleteEntity(object)
	DeleteEntity(object2)
end)