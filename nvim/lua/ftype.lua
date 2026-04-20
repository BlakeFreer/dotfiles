-- Override extension filetype

vim.filetype.add({
    extension = {
        tpp = "cpp",  -- cpp template file
        ini = "toml", -- platformio
        conf = "sh",
    },
})
