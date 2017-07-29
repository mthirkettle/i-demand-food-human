
local Colors = require "colors"
local Gila = require "lib/gila"
local Class, Room = class(Gila.Widget)


local LIT_COLOR = Colors.primary_4
local DARK_COLOR = Colors.complement_5
local TEXT_COLOR = Colors.secondary_b2
local FOOD_COLOR = Colors.secondary_b5

local size


function Class:SetSize(new_size)
  size = new_size
end


local super = Room.Initialize
function Room:Initialize(x, y, row, col, ...)
  self._x = x
  self._y = y
  self._row = row
  self._col = col

  return super(self, x, y, row, col, ...)
end


function Room:Reset(food_row, food_col)
  self._dist = math.abs(self.row - food_row) + math.abs(self.col - food_col)
  self._lit = false
  self._lit = true
end


function Room:Draw()
  love.graphics.push()
  love.graphics.translate(self._x, self._y)

  local color = self._lit and LIT_COLOR or DARK_COLOR
  love.graphics.setColor(color)
  love.graphics.rectangle("fill", 0, 0, size, size)

  if self._lit then
    -- Distance text
    love.graphics.setColor(TEXT_COLOR)
    love.graphics.print(self._dist, 4, 4)

    -- Draw the food
    if self._dist == 0 then
      local offset = size/2
      local radius = size/8
      love.graphics.setColor(FOOD_COLOR)
      love.graphics.circle("fill", offset, offset, radius, 50)
    end
  end

  love.graphics.pop()
end


return Class
