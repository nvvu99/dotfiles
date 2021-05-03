require('nvim-autopairs').setup({})

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')

npairs.add_rules({
    -- Latex
    Rule('$$', '$$', 'tex'),
    Rule('$', '$', { 'tex', 'latex' }):with_move(cond.none()):with_cr(cond.none()),

    Rule('"""', '"""'),
    Rule("'''", "'''"),

    -- Python
    Rule('f"', '"', 'python'),
    Rule("f'", "'", 'python'),
    Rule('f"""', '"""', 'python'),
    Rule("f'''", "'''", 'python'),

    -- Add spaces between parentheses
    Rule(' ', ' '):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
    Rule('( ', ' )')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match('.%)') ~= nil
        end)
        :use_key(')'),
    Rule('{ ', ' }')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match('.%}') ~= nil
        end)
        :use_key('}'),
    Rule('[ ', ' ]')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match('.%]') ~= nil
        end)
        :use_key(']'),

    -- Arrow key on javascript
    Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' })
        :use_regex(true)
        :set_end_pair_length(2),
})
