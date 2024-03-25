return function()
    require('codegpt.config')
    local api_key_path = vim.fn.stdpath('config') .. '/codegpt_openai_api_key.txt'
    local file = io.open(api_key_path, 'r')
    if not file then
        return
    end
    vim.g.codegpt_openai_api_key = file:read()
    file:close()
end
