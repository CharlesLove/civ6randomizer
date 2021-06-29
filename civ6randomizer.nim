import os
import random
import sequtils
import strutils

randomize()

var
  mapSize = ""
  pick = ""
  mapPool: seq[string]

  sizeAnyMaps = ["Continents",
                "Fractal",
                "Inland Sea",
                "Island Plates",
                "Pangaea",
                "Shuffle",
                "Archipelago",
                "Seven Seas",
                "Small Continents",
                "Continents and Islands",
                "Lakes",
                "Primordial",
                "Splintered Fractal",
                "Terra",
                "Tilted Axis",
                "Highlands",
                "Wetlands"]
  sizeTinyMaps = ["4-Leaf Clover",
                  "Mirror"]
  sizeSmallMaps = ["6-Armed Shuffle"]
  sizeStandardMaps = ["Earth",
                      "True Start Location Earth",
                      "East Asia",
                      "True Start Location East Asia",
                      "Europe",
                      "True Start Location Europe"]
  sizeLargeMaps = ["Mediterranean Large",
                  "True Start Location Mediterranean"]
  sizeHugeMaps = ["Earth Huge", "True Start Location Earth Huge"]

try:
  mapSize = toLowerAscii(paramStr(1))
except:
  mapSize = "any"

while mapPool.len == 0:
  case mapSize:
    of "duel","d":
      mapSize = "duel"
      mapPool = @sizeAnyMaps
    of "tiny","t":
      mapSize = "tiny"
      mapPool = concat(@sizeAnyMaps, @sizeTinyMaps)
    of "small","sm":
      mapSize = "small"
      mapPool = concat(@sizeAnyMaps, @sizeSmallMaps)
    of "standard","st":
      mapSize = "standard"
      mapPool = concat(@sizeAnyMaps, @sizeStandardMaps)
    of "large","l":
      mapSize = "large"
      mapPool = concat(@sizeAnyMaps, @sizeLargeMaps)
    of "huge","h":
      mapSize = "huge"
      mapPool = concat(@sizeAnyMaps, @sizeHugeMaps)
    else:
      mapSize = sample(["tiny","small","standard","large","huge"])


pick = sample(mapPool)
echo "Your Random Map Pick:"

echo "\tType: ", pick
echo "\tSize: ", capitalizeAscii(mapSize)