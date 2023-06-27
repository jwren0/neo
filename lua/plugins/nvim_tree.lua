local present, nvim_tree, utils

present, utils = pcall(require, "core.utils")
if not present then
    return
end

present, nvim_tree= pcall(require, "nvim-tree")
if not present then
    return
end

utils.nmap("<leader>f", ":NvimTreeToggle<CR>")

nvim_tree.setup({
    renderer = {
        root_folder_label = ":t"
    }
})
