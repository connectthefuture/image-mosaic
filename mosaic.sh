#!/bin/bash

# make tmp directory
mkdir -p tmp
# make initial group directory
mkdir -p tmp/comps/test-1
# make pdf directory
mkdir -p tmp/pdf

# count how many images exist
count=(images/*)
count=${#count[@]}

# let em know
echo "Parsing $count images"

# set initial counter
x=1
# set initial directory suffix
d=1
# for each image
for file in images/*
do
  # copy to the directory
  cp $file "tmp/comps/test-$d/"
  # is divisible by 4?
  let m=$x%4
  # if divisible by 4
  if [ "$m" -eq 0 ]; then
    # if not last image
    if [ "$x" -ne $count ]; then
      # increase directory number
      d=`expr $d + 1`
      # make the next directory
      mkdir -p "tmp/comps/test-$d/"
    fi
  fi
  # increase counter
  x=`expr $x + 1`
done

# count how many pdfs exist
count=(tmp/comps/*)
count=${#count[@]}

# let em know
echo "Generating $count composites"

# set counter
y=1
# for each directory of 4 images
for file in tmp/comps/*
do
  # run the montage into pdf
  montage "$file/*" -tile 2x2 -geometry 564x780+24+24 "tmp/pdf/test-$y.pdf"
  # increase the counter (used in output filename)
  y=`expr $y + 1`
done

# let em know
echo "Merging $count pdf composites"

# merge the pdfs
pdfunite tmp/pdf/* output.pdf

# let em know
echo "Cleaning up"

# delete tmp
rm -rf tmp