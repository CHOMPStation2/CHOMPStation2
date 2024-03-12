#!/bin/bash
# Generate maps
map_files=(
    "./maps/southern_cross/southern_cross-1.dmm"
    "./maps/southern_cross/southern_cross-2.dmm"
    "./maps/southern_cross/southern_cross-3.dmm"
    "./maps/southern_cross/southern_cross-4.dmm"
    "./maps/southern_cross/southern_cross-5.dmm"
    "./maps/southern_cross/southern_cross-6.dmm"
    "./maps/southern_cross/southern_cross-7.dmm"
    "./maps/southern_cross/southern_cross-8.dmm"
    "./maps/southern_cross/southern_cross-9.dmm"
    "./maps/southern_cross/southern_cross-10.dmm"
    "./maps/southern_cross/southern_cross-11.dmm"
)

~/dmm-tools minimap "${map_files[@]}"

# Move and rename files so the game understands them
cd "data/minimaps"

convert "southern_cross-1-1.png" -resize 2240x2240 "southern_cross_nanomap_z1.png"
convert "southern_cross-2-1.png" -resize 2240x2240 "southern_cross_nanomap_z2.png"
convert "southern_cross-3-1.png" -resize 2240x2240 "southern_cross_nanomap_z3.png"
convert "southern_cross-4-1.png" -resize 2240x2240 "southern_cross_nanomap_z4.png"
convert "southern_cross-5-1.png" -resize 2240x2240 "southern_cross_nanomap_z5.png"
convert "southern_cross-6-1.png" -resize 2240x2240 "southern_cross_nanomap_z6.png"
convert "southern_cross-7-1.png" -resize 2240x2240 "southern_cross_nanomap_z7.png"
convert "southern_cross-8-1.png" -resize 2240x2240 "southern_cross_nanomap_z8.png"
convert "southern_cross-9-1.png" -resize 2240x2240 "southern_cross_nanomap_z9.png"
convert "southern_cross-10-1.png" -resize 2240x2240 "southern_cross_nanomap_z10.png"
convert "southern_cross-11-1.png" -resize 2240x2240 "southern_cross_nanomap_z11.png"

rm -rf "southern_cross-1-1.png"
rm -rf "southern_cross-2-1.png"
rm -rf "southern_cross-3-1.png"
rm -rf "southern_cross-4-1.png"
rm -rf "southern_cross-5-1.png"
rm -rf "southern_cross-6-1.png"
rm -rf "southern_cross-7-1.png"
rm -rf "southern_cross-8-1.png"
rm -rf "southern_cross-9-1.png"
rm -rf "southern_cross-10-1.png"
rm -rf "southern_cross-11-1.png"

cd "../../"
cp data/minimaps/* "icons/_nanomaps/"
