local o = vim.opt

vim.api.nvim_create_augroup("FileTypes", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.astro", "*.js*", "*.ts*", "*.css", "*.html", "*.ocaml", "*.php" },
    group = "FileTypes",
    callback = function()
        o.tabstop = 2
        o.shiftwidth = 2
        o.softtabstop = 2
    end,
})
