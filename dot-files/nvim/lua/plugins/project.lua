return {
  "ahmedkhalf/project.nvim",
  opts = {
    detection_methods = { "pattern", "lsp" },
    patterns = { ".git", "Makefile", "package.json", "pyproject.toml", ".project" },
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)

    local project_dirs = { vim.fn.expand("~/Projects") }
    local history_file = vim.fn.stdpath("data") .. "/project_nvim/project_history"
    vim.fn.mkdir(vim.fn.fnamemodify(history_file, ":h"), "p")

    local lines = vim.fn.filereadable(history_file) == 1 and vim.fn.readfile(history_file) or {}
    local seen = {}
    for _, line in ipairs(lines) do
      seen[line] = true
    end

    local updated = false
    for _, base_dir in ipairs(project_dirs) do
      if vim.fn.isdirectory(base_dir) == 1 then
        for name, entry_type in vim.fs.dir(base_dir) do
          if entry_type == "directory" then
            local full_path = base_dir .. "/" .. name
            if not seen[full_path] then
              table.insert(lines, full_path)
              updated = true
            end
          end
        end
      end
    end

    if updated then
      vim.fn.writefile(lines, history_file)
    end
  end,
}
