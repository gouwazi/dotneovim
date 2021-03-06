require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		--component_separators = { left = '', right = '' },
		component_separators = { left = '|', right = '|' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
			'branch',
			'diff', {
				'diagnostics',

				-- Table of diagnostic sources, available sources are:
				--   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
				-- or a function that returns a table as such:
				--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
				sources = { 'coc', 'nvim_diagnostic' },

				-- Displays diagnostics for the defined severity types
				sections = { 'error', 'warn', 'info', 'hint' },

				diagnostics_color = {
					-- Same values as the general color option can be used here.
					error = 'DiagnosticError', -- Changes diagnostics' error color.
					warn  = 'DiagnosticWarn', -- Changes diagnostics' warn color.
					info  = 'DiagnosticInfo', -- Changes diagnostics' info color.
					hint  = 'DiagnosticHint', -- Changes diagnostics' hint color.
				},
				--symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
				symbols = { error = ' ', warn = ' ', info = ' ' },
				colored = true, -- Displays diagnostics status in color if set to true.
				update_in_insert = false, -- Update diagnostics in insert mode.
				always_visible = false, -- Show diagnostics even if there are none.
			} },
		lualine_c = { {
			'filename',
			file_status = true, -- Displays file status (readonly status, modified status)
			-- 0: Just the filename
			-- 1: Relative path
			-- 2: Absolute path
			path = 1,

			shorting_target = 40, -- Shortens path to leave 40 spaces in the window
			-- for other components. (terrible name, any suggestions?)
			symbols = {
				modified = '[+]', -- Text to show when the file is modified.
				readonly = '[]', -- Text to show when the file is non-modifiable or readonly.
				unnamed = '[No Name]', -- Text to show for unnamed buffers.
			}
		}, 'filesize' },
		lualine_x = { 'encoding', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}
