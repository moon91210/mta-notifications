local exportedFunctions = {'info', 'warning', 'error', 'success'}

for i=1, #exportedFunctions do
	_G[exportedFunctions[i]] = function(msg, options)
		assert(type(msg) == 'string', '(popup) argument 1 not a string')

		if options then
			assert(type(options) == 'table', '(popup) argument 2 not a table')
		end

		local opts = options or {}

		opts.type = exportedFunctions[i]

		if localPlayer then -- check if this is the client side
			createNotification(msg, opts)
		else
			triggerClientEvent('onNotify', resourceRoot, msg, opts)
		end
	end
end