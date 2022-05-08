require 'nvim-tree'.setup {
	auto_reload_on_write = true, -- reloads the explorer every time a buffer is written to
	open_on_setup = true,
	open_on_setup_file = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {}
	}
}
