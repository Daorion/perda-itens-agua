local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")


-----------------------------------------------------------------------------------------------------------------------------------------
-- PERDER ITENS NA AGUA
-----------------------------------------------------------------------------------------------------------------------------------------
-- vRP = Proxy.getInterface("vRP")
-- vRPclient = Tunnel.getInterface("vRP")


RegisterNetEvent('perdeitem:nadando')
AddEventHandler('perdeitem:nadando', function(dinheiro)
	local user_id = vRP.getUserId(source)
	local dinheiro = vRP.getMoney(user_id)

	if user_id then
	   vRP.tryPayment(user_id,dinheiro)
	   local amountCelular = vRP.getInventoryItemAmount(user_id,"celular")		-- item que vao ser desmanchados
	   local amountRadio = vRP.getInventoryItemAmount(user_id,"radio")			-- item que vao ser desmanchados
	   local amountDinheirosujo = vRP.getInventoryItemAmount(user_id,"notas-marcadas") 			-- item que vao ser desmanchados

		   if vRP.tryGetInventoryItem(user_id,"celular",amountCelular) then		-- item que vai ser retirado
			   vRP.giveInventoryItem(user_id,"celular-queimado",1)				-- item que sera trocado pelo perdido
			   TriggerClientEvent("Notify",source,"negado","Seu Celular queimou pelo contato com a agua")		-- notificacao

		   elseif vRP.tryGetInventoryItem(user_id,"radio",amountRadio) then		-- item que vai ser retirado
				TriggerClientEvent("Notify",source,"negado","Seu Radio caiu na agua")		-- notificacao

		   elseif vRP.tryGetInventoryItem(user_id,"notas-marcadas",amountDinheirosujo) then		-- item que vai ser retirado
				TriggerClientEvent("Notify",source,"negado","Seu Dinheiro marcado desmanchou pelo contato com a agua")		-- notificacao
		   end

	end
end)
