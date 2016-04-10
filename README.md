# Grant & Masha's Image Mosaic Program
Takes images, groups them in fours, converts each group into a tiled pdf, merges pdfs into a master pdf. Automating Masha's job.

## Running the shit
- make sure you have `imagemagick` and `poppler` (`pdfunite`) installed
- create `images` directory in the root
- ensure `mosaic.sh` is executable `chmod +x mosaic.sh`
- navigate to this directory `cd /path/to/image-mosaic/`
- run app using `./mosaic.sh`