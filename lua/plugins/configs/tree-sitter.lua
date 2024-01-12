local config = {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "cpp", "lua", "vim" },

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = false
  }
}

return config
