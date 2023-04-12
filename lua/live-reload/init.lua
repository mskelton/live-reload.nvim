local function join(...)
	local args = { ... }
	if #args == 0 then
		return ""
	end

	return table.concat(args, package.config:sub(1, 1))
end

local function get_pattern(opts, dir)
	return join(vim.fn.expand(opts.root_dir or "") or "*", dir, "*.lua")
end

local M = {}

M.setup = function(opts)
	opts = opts or {}

	for _, value in pairs(opts.plugins or {}) do
		local plugin_name, pattern

		if type(value) == "table" then
			plugin_name = value[1]
			pattern = get_pattern(opts, value.dir or plugin_name)
		else
			plugin_name = value
			pattern = get_pattern(opts, value)
		end

		vim.api.nvim_create_autocmd("BufWritePost", {
			group = vim.api.nvim_create_augroup(plugin_name .. "-live-reload", {}),
			pattern = pattern,
			callback = function()
				for name in pairs(package.loaded) do
					if string.sub(name, 1, #plugin_name) == plugin_name then
						package.loaded[name] = nil
					end
				end
			end,
		})
	end
end

return M
