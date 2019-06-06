local exportedFunctions = {'info', 'warning', 'error', 'success'}

for i=1, #exportedFunctions do
	_G[exportedFunctions[i]] = function(msg, options, target)
		assert(type(msg) == 'string', '(popup) argument 1 not a string')

		if options then
			assert(type(options) == 'table', '(popup) argument 2 not a table')
		end

		if target then
			assert(type(target) == 'userdata', '(popup) argument 3 not an element')
		end

		local opts = options or {}

		opts.type = exportedFunctions[i]

		if localPlayer then -- check if this is the client side
			createNotification(msg, opts)
		else
			triggerClientEvent(target or root, 'onNotify', resourceRoot, msg, opts)
		end
	end
end