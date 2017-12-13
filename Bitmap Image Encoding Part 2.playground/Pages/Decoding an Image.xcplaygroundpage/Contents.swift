//: [Previous](@previous) / [Next](@next)
//: # Decoding an Image
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
/*:
 ## Decoding the text
 Now we will (at last!) decode the image.
 
 Recall, our rules are:
 
 * If a line starts with a 0, the first pixel is black.
 * If a line does not start with a 0, the first pixel is white.
 * When a comma is encountered, a new number begins, and the colour switches.
 * When a newline character is encountered, go to a new row in the image.
 * Once we have a new number, we draw that many pixels in the current colour.
 
 First, copy and paste your encoded image string to this page.
*/

// Copy your encoded image string here...
let encodedBitmap = """
w9w9w2
w9w9w2
w7b6w8
w5b2G1g4G1b2w6
w4b2G1g6G1b2w5
w4b9b3w5
w3b1G1g1G8g1G1b1w4
w2b1G1b9b3G1b1w3
w2b1G1b1o1w2o4w2o1b1G1b1w3
w3b1o1y1w1y6w1y1o1b1w4
w3b1o1y1w1y6w1y1o1b1w4
w3b1o1y4o2y4o1b1w4
w2b1G1b1o1w1y1b4y1w1o1b1G1b1w3
w2b1G2b3G4b3G2b1w3
w3b1G2g1b1g1b2g1b1g1G2b1w4
w4b2G1b1G4b1G1b2w5
w5b3G4b3w6
w6b2G4b2w7
w8b4w9
w9w9w2
w9w9w2
"""

// Make a canvas
//let canvas = Canvas(width: 402, height: 422)
//If I want to look at it well on xcode, delete the ultra quality
let canvas = Canvas(width: 402, height: 422)



// Make a grid
// NOTE: The code that builds the grid was tucked away in something called a *function* to keep things tidy. We'll learn about functions later.
drawGrid(on: canvas)

// Start drawing at left
var x = 0

// Set the size of a "pixel"
let cellSize = 20

// Keep track of current colour
var currentColor = "white"

// Start drawing at top of grid
var y = canvas.height - cellSize - 2

// Store the current number of pixels to draw
var drawThisManyPixels = 0

// Iterate over each character in the encoded bitmap string
for character in encodedBitmap {
    
    // What is the current character
    character
    
    // Set colour at start of a line
    if character == "0" {
        
        canvas.fillColor = Color.black
        currentColor = "black"

    } else if character == "," {
        
        // We have a new number
        // Are we past the first pixel in a row?
        if x > 0 {

            // Toggle the pixel colour
            if currentColor == "black" {
                currentColor = "white"
                canvas.fillColor = Color.white
            } else {
                currentColor = "black"
                canvas.fillColor = Color.black
            }

        }
        
    } else if character == "\n" {
        
        // We are on a new line, so reduce the vertical position
        // and reset the horizontal position
        y = y - cellSize
        x = 0
        
        // Default colour after new line is white
        canvas.fillColor = Color.white
        currentColor = "white"
        
    }
    else if character == "w" {
        canvas.fillColor = Color.white
        }
    else if character == "b" {
        canvas.fillColor = Color.black
    }
    else if character == "g" {
        canvas.fillColor = Color.green
    }
    else if character == "G" {
        canvas.fillColor = Color.init(hue: 106, saturation: 100, brightness: 60, alpha: 100)
    }
    else if character == "o" {
        canvas.fillColor = Color.orange
    }
    else if character == "w" {
        canvas.fillColor = Color.white
    }
    else if character == "y" {
        canvas.fillColor = Color.yellow
    }
    
    else {
        
        print(character)
        
        // Get the new number of pixels to draw
        drawThisManyPixels = Int(String(character))!
        
        // Draw the pixels
        for _ in 1...drawThisManyPixels {
            
            // Draw the enlarged "pixel"
            canvas.drawRectangle(bottomLeftX: x, bottomLeftY: y, width: cellSize, height: cellSize)
            
            // Increase x so that the next pixel is drawn to the right of this one
            x += cellSize
            
        }
        
    }
    
}

// Copy the image to the clipboard
canvas.copyToClipboard()

/*:
 ### Check the results
 Does the output match what you'd expect, based on the values in the encoded string?
 
 How do you know?
 
 Write your ideas in the code comment below.
 */

// I notice that...
// I know this because...

/*:
 ## Extension
 Now that you have an understanding of how if statements (also called *selection* statements or *conditional* statements) work... extend this code.
 
 How could you adjust the rules so that pixels can be rendered in colour?
 
 What additions or changes would you need to make to the code above?
 
 Work with a partner to discuss possibilities and then make the changes in code.
 */


/*:
 Now, **remember to commit and push your work**.
 */
/*:
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right. Please do not remove.
 */
PlaygroundPage.current.liveView = canvas.imageView
