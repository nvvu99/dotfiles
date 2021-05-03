vim.g.rainbow_active = 1
vim.g.rainbow_conf = {
    ['guifgs'] = {
        'orange',
        'cyan',
        'magenta',
        'seagreen3',
    },
    ['ctermfgs'] = {
        'lightred',
        'lightcyan',
        'lightmagenta',
        'lightgreen',
    },
    ['guis'] = { '' },
    ['cterms'] = { '' },
    ['operators'] = '_,_',
    ['parentheses'] = {
        'start=/(/ end=/)/ fold',
        [[start=/\[/ end=/\]/ fold]],
        'start=/{/ end=/}/ fold',
    },
    ['separately'] = {
        ['php'] = {
            ['syn_name_prefix'] = 'phpBlockRainbow',
            ['contains_prefix'] = '',
            ['parentheses'] = {
                'start=/(/ end=/)/ containedin=@htmlPreproc contains=@phpClTop',
                'start=/\\[/ end=/\\]/ containedin=@htmlPreproc contains=@phpClTop',
                'start=/{/ end=/}/ containedin=@htmlPreproc contains=@phpClTop',
            },
        },
        ['html'] = 0,
        ['htmldjango'] = 0,
        ['xml'] = 0,
        ['twig'] = 0,
    },
}
