

RegisterServerEvent("Night:pawnserver")
AddEventHandler("Night:pawnserver", function(itemName, amount, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item = xPlayer.getInventoryItem(itemName)
	local locationItem = Config.shop[least]
    local amount = tonumber(amount)

	if amount <= 20 then
		if price * amount > Config.totalselling then

			if Config.usingdiscordhook then
				local pawnshop = {
					['Player'] = xPlayer.source, 
					['Log'] = 'default', 
					['Title'] = 'Pawnshop', 
					['Message'] = ''.. GetPlayerName(xPlayer.source) ..' je pokusao da zabaguje pawnshop!!', 
					['Color'] = 'blue' 
				}
			
				TriggerEvent('Boost-Logs:SendLog', pawnshop)
				return
	
				DropPlayer(source, 'Probaj opet majmune')
			else
				return
				DropPlayer(source, 'Probaj opet majmune')
			end
			
	
		end	
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Ne mozes prodati vise od 20 stvari odjednom'})
	end	



	

	if (item.count < amount) then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Nemas dovoljno stvari kod sebe!'})
	elseif amount <= 20 then
		xPlayer.removeInventoryItem(item.name, amount)
		xPlayer.addAccountMoney('black_money', price * amount)	
	
	end

end)