return {
        "nvim-treesitter/nvim-treesitter",
        config = function()
                vim.filetype.add({
                        pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
                })
                vim.api.nvim_create_autocmd("FileType", {
                        pattern = "hyprlang",
                        callback = function(event) vim.bo[event.buf].commentstring = "# %s" end,
                })

                require 'nvim-treesitter.configs'.setup {
                        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "jsonc", "json", "css" },
                        auto_install = true,
                        highlight = {
                                enable = true,
                                -- disable = function(lang, buf)
                                --         local max_filesize = 100 * 1024 -- 100 KB
                                --         local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                                --         if ok and stats and stats.size > max_filesize then
                                --                 return true
                                --         end
                                -- end,
                                additional_vim_regex_highlighting = false,
                        },
                        indent = {
                                enable = true,
                        },
                }
        end,

}
