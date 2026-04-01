function compress_pdf
    set file $argv[1]
    set base (string replace -r '\.pdf$' '' -- $file)
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dBATCH -dColorImageResolution=150 -sOutputFile=$base-compressed.pdf $file
end
