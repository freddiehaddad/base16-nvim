local M = {}

local default_config = {
	colorscheme = "base16-default-dark",
	hot_reload = {
		enabled = false,
		base16_theme_file = "~/.config/tinted-theming/theme_name",
	},
}

local listeners = {}

local notify_listeners = function(colorscheme)
	for _, listener in ipairs(listeners) do
		listener(colorscheme)
	end
end

local read_colorscheme_name = function(filename)
	local f = io.open(filename, "r")
	if f == nil then
		vim.notify("failed to open: " .. filename, vim.log.levels.ERROR)
		return nil
	end
	local theme_name = f:read("*l")
	f:close()
	local colorscheme = "base16-" .. theme_name
	return colorscheme
end

local setup_hot_reload = function(config)
	local filename = vim.fn.expand(config.hot_reload.base16_theme_file)

	local w = vim.loop.new_fs_event()

	local set_colorscheme = function()
		local colorscheme = read_colorscheme_name(filename)
		if colorscheme ~= nil then
			vim.cmd.colorscheme(colorscheme)
		else
			vim.notify("read_colorscheme_name failed!", vim.log.levels.ERROR)
		end
	end

	function on_change()
		w:stop() -- debounce: start/stop
		set_colorscheme()
		w:start(filename, {}, vim.schedule_wrap(function() on_change() end))
	end
	set_colorscheme()
	w:start(filename, {}, vim.schedule_wrap(function() on_change() end))
end

M.listen = function(callback) table.insert(listeners, callback) end

M.setup = function(opts)
	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "base16-*",
		callback = notify_listeners,
	})

	local config = vim.tbl_deep_extend("keep", opts or {}, default_config)

	if config.hot_reload.enabled == false then
		vim.cmd.colorscheme(config.colorscheme)
		return
	end

	setup_hot_reload(config)
end

return M
