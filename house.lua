
local Agni = require "lib/agni"

local C = require "constants"
local Cat = require "cat"
local CatPower = require "catpower"
local Food = require "food"
local Room = require "room"


local House = {}


local function Initialize()
  local y_offset = C.HOUSE_MARGIN

  for row=1,C.NUM_ROWS do
    local x_offset = C.HOUSE_MARGIN

    for col=1,C.NUM_COLS do
      Room(x_offset, y_offset, row, col)
      x_offset = x_offset + C.ROOM_SIZE + C.ROOM_MARGIN
    end

    y_offset = y_offset + C.ROOM_SIZE + C.ROOM_MARGIN
  end

  Agni:RegisterCallback(House, "StartNewGame")

  House:OnStartNewGame()
end


function House:OnStartNewGame()
  local row, col = Food:Randomize()
  Room:Reset(row, col)
  Cat:Randomize(row, col)
  CatPower:Reset()
end


Initialize()
