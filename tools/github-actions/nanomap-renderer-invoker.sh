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

tools/github-actions/nanomap-renderer minimap -w 2240 -h 2240 "${map_files[@]}"

# Move and rename files so the game understands them
cd "data/nanomaps"

mv "talon1_nanomap_z1.png" "tether_nanomap_z13.png"
mv "talon2_nanomap_z1.png" "tether_nanomap_z14.png"
mv "southern_cross-1_nanomap_z1.png" "southern_cross_nanomap_z1.png"
mv "southern_cross-2_nanomap_z1.png" "southern_cross_nanomap_z2.png"
mv "southern_cross-3_nanomap_z1.png" "southern_cross_nanomap_z3.png"
mv "southern_cross-4_nanomap_z1.png" "southern_cross_nanomap_z4.png"
mv "southern_cross-5_nanomap_z1.png" "southern_cross_nanomap_z5.png"
mv "southern_cross-6_nanomap_z1.png" "southern_cross_nanomap_z6.png"
mv "southern_cross-7_nanomap_z1.png" "southern_cross_nanomap_z7.png"
mv "southern_cross-8_nanomap_z1.png" "southern_cross_nanomap_z8.png"
mv "southern_cross-9_nanomap_z1.png" "southern_cross_nanomap_z9.png"
mv "southern_cross-10_nanomap_z1.png" "southern_cross_nanomap_z10.png"
mv "southern_cross-11_nanomap_z1.png" "southern_cross_nanomap_z11.png"

cd "../../"
cp data/nanomaps/* "icons/_nanomaps/"
