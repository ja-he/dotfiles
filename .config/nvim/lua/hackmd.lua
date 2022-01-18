-- When `hackmd()` is called the <cfile> under the cursor presumed to be a
-- HackMD URL is retrieved, and the external shell script 'hackmd-get.sh' is
-- executed.
-- This script gets the markdown-contents from the URL, writes them to a file in
-- '/tmp' and opens that file in the current buffer.
--
-- WARNING: no error checking, no input verification, etc.

local function openContents(url)
  local command = assert(io.popen("hackmd-get.sh".." "..url))
  command:flush()
  local filename = command:read('*all')
  command:close()

  vim.api.nvim_command("edit".." "..filename)
end

local function hackmd()
  local url = vim.fn.expand("<cfile>")
  openContents(url)
end

return {
  hackmd = hackmd,
}
