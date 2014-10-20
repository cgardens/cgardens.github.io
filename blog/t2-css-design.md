relative, absolute, and fixed positioning?

Where the F*** am I?
CSS: Positioning Overview

In CSS there are four major "Position" options: static, relative, absolute, fixed. It is incredibly important to know what each does or you might find that some of your divs have gone missing. The key to understanding how positioning work is not only to understand what each attribute does, but how they interact with one on another, especially when augmented with display settings (block, inline-block).

Static is your default setting. It's going to float into the next available spot it can find.

Relative is a variation the theme. It's going to note where it would have ended up if it were static and then based on the parameters you feed it (top, left, right, bottom), it's going to move that many units based off of where it WOULD HAVE been. This is in contrast to absolute...

Absolute is going to look at the whole page when you give it a top, right, etc attribute and move to the correct pixel on the whole page using the top left corner as starting point. It doesn't reconnoiter at all where it would have been if it were static.

Fixed positioning, like abolute, is going to position itself exactly where you tell it to in your browser frame. When you scroll, however, the absolute item will move along the page, the fixed item will not. It will stay exactly where it's supposed to in the frame. If you told it to be at top: 0px; left: 0px, it will affix itself to the top left of the screen and never move.

This post is just a basic overview of the different position settings. Now go research display settings and experiment with what happens when you have multiple divs with different positions and display settings. Which ones stack the way you'd expect? Which do not?