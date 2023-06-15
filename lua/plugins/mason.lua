local present, mason, utils

present, mason = pcall(require, "mason")
if not present then
    return
end

present, utils = pcall(require, "core.utils")
if not present then
    return
end

utils.nmap("<leader>m", ":Mason<CR>")
utils.nmap("<leader>um", ":MasonUpdate<CR>")

mason.setup()
