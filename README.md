# Bitmap editor

## Program input
The input consists of a file containing a sequence of commands, where a command is represented by a single capital letter at the beginning of the line. Parameters of the command are separated by white spaces and they follow the command character.
Pixel coordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250. Bitmaps starts at coordinates 1,1. Colours are specified by capital letters.

## Commands
There are 6 supported commands:
* `I N M` - Create a new M x N image with all pixels coloured white (O).
* `C` - Clears the table, setting all pixels to white (O).
* `L X Y C` - Colours the pixel (X,Y) with colour C.
* `V X Y1 Y2 C` - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
* `H X1 X2 Y C` - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
* `S` - Show the contents of the current image

## Dependency installation
```
gem install bundler
bundle install
```

## Running
`>bin/bitmap_editor examples/show.txt`

## Example
### Sample Input File:
```
I 5 6
L 1 3 A
V 2 3 6 W
H 3 5 2 Z
S
```

### Expected Output:
```
OOOOO
OOZZZ
AWOOO
OWOOO
OWOOO
OWOOO
```

## Notes
* Command files has to start with creating a bitmap
* Bitmap can't be created twice within a commands file
* The code could be improved with more error handling, refactoring(error classes with more error handling) and edge case testing 

## Running tests
`>rspec`

### Tests
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
