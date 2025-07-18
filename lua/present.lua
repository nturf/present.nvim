local M = {}

M.setup = function()
  --do something
end

---@class present.slides
---@field slides string[]

---@param lines string[]:
---@return present.slides


local parse_slides = function(lines)
  local slides = { slides = {} }
  local current_slides = {}

  local seperator = '^#'

  for _, line in ipairs(lines) do
    print(line, 'find:', line:find(seperator), '|')
    if line:find(seperator) then
      if #current_slides > 0 then
        table.insert(slides.slides, current_slides)
      end
      current_slides = {}
    end
    table.insert(current_slides, line)
  end
  table.insert(slides.slides, current_slides)

  return slides
end

vim.print(parse_slides {
  "# Hey There",
  'Are you awake',
  'Lets go out',
  '# This is title in .md',
  'and do some fun'
})

return M
