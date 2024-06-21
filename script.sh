#!/usr/bin/env bash
#author: Harshvardhan J. Pandit
#github: coolharsh55

#script: Takes a PDF and creates a HTML slideshow for it

#requirements: 
#   - pdftoppm: export PDF pages as png images
#   - sed: insert link to images in HTML template for slideshow

# Handling arguments / flags
while getopts "p:f" opt; do
    case "${opt}" in
        p)
            file=${OPTARG}
            ;;
        f)
            FORCE_PROCESSING=1
            ;;
        *)
            ;;
    esac
done

# dir=$(dirname "$file")
dir="./public"
assets="./assets"

date=$(date '+%d-%m-%Y')

# Check if $dir/index.html exists, if yes, skip this file
if [[ "$dir" ]]; then
    echo "Directory exists. Deleting all..."
    rm -rf "$dir"
    mkdir "$dir"
fi

# Convert PDF to images
# pdftoppm will extract each page as a png
echo -n "Exporting PDF pages as PNG to $dir ... "
pdftoppm "${assets}"/pdf/*.pdf "${dir}"/slide -png
echo "DONE"

# Copy assets to directory
# mkdir "${dir}/revealjs"
cp -r "${assets}"/revealjs "${dir}"

# Insert link to images in HTML template
cp "${assets}"/template.html "${dir}"/index.html
echo -n "Creating HTML ... "
gsed -i "17i Actualizado al: $date" "${dir}"/index.html
mapfile -t slides < <(find "${dir}" -iname '*.png' | sort -r)
for f in "${slides[@]}"; do
    f=$(basename "$f")
    img="<section><img src='$f'></section>"
    gsed -i "14i $img" "${dir}"/index.html
done;
echo "DONE"
