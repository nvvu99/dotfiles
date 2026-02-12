return {
    'kevinhwang91/nvim-ufo',
    opts = {
        open_fold_hl_timeout = 0,
        close_fold_kinds_for_ft = {
            default = { 'imports', 'comment' },
            json = { 'array' },
            c = { 'comment', 'region' },
        },
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (' 󰁂 %d '):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, 'MoreMsg' })
            return newVirtText
        end,
        preview = {
            win_config = {
                border = { '', '─', '', '', '', '─', '', '' },
                winhighlight = 'Normal:Folded',
                winblend = 0,
            },
            mappings = {
                scrollU = '<C-u>',
                scrollD = '<C-d>',
                jumpTop = '[',
                jumpBot = ']',
            },
        },
        enable_get_fold_virt_text = true,
    },
    config = function(_, opts)
        local ufo = require('ufo')
        ufo.setup(opts)

        require('utils').nmap('zR', ufo.openAllFolds)
        require('utils').nmap('zM', ufo.closeAllFolds)

        require('utils').nmap('K', function()
            local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
                require('utils').diagnostic_hover()
            end
        end)
    end,
}
