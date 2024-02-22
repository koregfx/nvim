local M = {}

local function stringTable(list, i)
  local listString = ''
  --~ begin of the list so write the {
  if not i then
    listString = listString .. '{'
  end

  i = i or 1
  local element = list[i]
  --~ it may be the end of the list
  if not element then
    return listString .. '}'
  end
  --~ if the element is a list too call it recursively
  if type(element) == 'table' then
    listString = listString .. stringTable(element)
  else
    listString = listString .. element
  end

  return listString .. ', ' .. stringTable(list, i + 1)
end

function M.printTable(table)
  print(stringTable(table))
end

function M.split(pString, pPattern)
  local Table = {} -- NOTE: use {n = 0} in Lua-5.0
  local fpat = '(.-)' .. pPattern
  local last_end = 1
  local s, e, cap = pString:find(fpat, 1)
  while s do
    if s ~= 1 or cap ~= '' then
      table.insert(Table, cap)
    end
    last_end = e + 1
    s, e, cap = pString:find(fpat, last_end)
  end
  if last_end <= #pString then
    cap = pString:sub(last_end)
    table.insert(Table, cap)
  end
  return Table
end

return M
