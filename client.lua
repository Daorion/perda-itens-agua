local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- PERDER ITENS NA AGUA
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		 if IsPedSwimming(PlayerPedId()) then
			TriggerServerEvent('perdeitem:nadando',true)
		end
	end
 end)