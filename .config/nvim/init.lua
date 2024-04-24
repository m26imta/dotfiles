if vim.fn.filereadable(vim.fn.expand("$HOME/.vimrc")) == 1 then
	vim.cmd([[ source $HOME/.vimrc ]])
end
