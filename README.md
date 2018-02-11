# Bitmap editor

## Dependency installation
```
gem install bundler
bundle install
```

## Running
`>bin/bitmap_editor examples/show.txt`

## Notes
* Command files has to start with creating a bitmap
* Bitmap can't be created twice within a commands file
* Bitmap height and width has to be between 1 and 250
* The code could be improved with more error handling, refactoring(error classes with more error handling) and edge case testing 

## Running tests
`>rspec`

## Tests
```
BitmapEditor
  #run
    edits a bitmap regarding a file input
    raises error when not a correct file was provided

Bitmap
  #initialize
    creates a white bitmap with the given size when initialized
    raises error when the bitmap to create is higher than 250
    raises error when the bitmap to create is lower than 0
  #change_pixel_colour
    changes the colour in a given pixel
    raises error when pixel is not in Bitmap
  #clear_pixels
    changes the colour of every pixel to white
  #change_pixel_colours_vertically
    changes the colour of pixels vertically
    raises error when first pixel to colour is higher than last pixel
  #change_pixel_colours_horizontally
    changes the colour of pixels horizontally
    raises error when first pixel to colour is higher than last pixel

Output
  #show
    prints pixels line by line
```
