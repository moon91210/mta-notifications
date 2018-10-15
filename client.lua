local sw, sh = guiGetScreenSize()
local web = createBrowser(sw, sh, true, true)
setDevelopmentMode(true, true)

function createNotification(msg, options)
	web:exec('createNotification', msg, options)
end

addEvent('onNotify', true)
addEventHandler('onNotify', resourceRoot, createNotification)

addEventHandler('onClientBrowserCreated', web, function()
	web:loadURL('http://mta/local/notify.html')
end)

addEventHandler('onClientBrowserDocumentReady', web, function()
	web:injectMouseDown('left')
	local sr = sw/sh
	web:exec('setZoomLevel', sr/1.77*(sr*0.5))
	-- info('Welcome to the server!')
end)

addEventHandler('onClientRender', root, function()
	dxDrawImage(0, 0, sw, sh, web, 0, 0, 0, tocolor(255,255,255,255), true)
end)

function Browser:exec(funcName, ...)
	for i = 1, arg.n do
		if type(arg[i]) == "table" then
			arg[i] = toJSON(arg[i])
		elseif type(arg[i]) == "string" then
			arg[i] = arg[i]:gsub("'", "\\'")
			arg[i] = arg[i]:gsub('"', '\\"')
		end
	end
	self:executeJavascript(("%s ('%s')"):format(funcName, table.concat(arg, "','")))
end