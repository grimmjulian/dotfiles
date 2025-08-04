vim.o.list = true

vim.o.fillchars = table.concat(
-- Special UI symbols
	{ 'eob: ',
		'fold:╌',
		'horiz:═',
		'horizdown:╦',
		'horizup:╩',
		'vert:║',
		'verthoriz:╬',
		'vertleft:╣',
		'vertright:╠' },
	','
)
vim.o.listchars = table.concat(
	{ 'extends:…',
		'nbsp:␣',
		'precedes:…',
		'tab:|->',
		'space:·' },
	','
) -- Special text symbols
