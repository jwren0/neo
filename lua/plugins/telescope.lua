local present, telescope, utils

present, utils = pcall(require, "core.utils")
if not present then
    return
end

present, telescope = pcall(require, "telescope")
if not present then
    return
end

utils.nmap("<leader>t", ":Telescope<CR>")
