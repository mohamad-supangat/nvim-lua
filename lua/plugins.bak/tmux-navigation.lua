local status_ok, tmux = pcall(require, "tmux")
if not status_ok then
	return
end

tmux.setup()
