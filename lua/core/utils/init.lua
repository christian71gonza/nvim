local M = require("core.utils.lua")

M = M.merge(M, require("core.utils.chars"))
M = M.merge(M, require("core.utils.neovim"))

return M
