require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "python",
    "cpp",
    "lua",
    "vim",
    "javascript",
    "tsx",
    "json",
    "yaml",
    "html",
    "css"
  },
  ignore_install = {}, -- List of parsers to ignore installing
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { 'help' }, -- list of language that will be disabled
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx"}

-- AutoTag close for React
-----------------------------------------------------------------------
local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end
autotag.setup({})

-----------------------------------------------------------------------


-- For closing brackets
-----------------------------------------------------------------------
local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

-----------------------------------------------------------------------

