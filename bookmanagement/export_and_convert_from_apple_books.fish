set target "azw3"
set fixed "fixed"
set converted "converted"

mkdir -p $fixed
mkdir -p $converted

for f in *.epub
    echo "CONVERTING $f"
    set basename (basename $f .epub)
    cd $f
    zip -X -r "../$fixed/$basename.epub" mimetype *
    cd ..
    ebook-convert "$fixed/$basename.epub" "$converted/$basename.$target"
end
