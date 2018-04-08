Geomantic
=========

A script to generate figures with which to fill in a Geomancy chart.

Totally useless for anyone who isn't already knowledgeable about geomancy, a medieval divinitory system (popular in Europe, but borrowed from Muslim sources) that is now very obscure.

Curious about geomancy?

Geomancy relies on a set of sixteen figure, each figure made up of four lines of binary values -- like the hexagrams of the I Ching, only with fewer lines. 
Each line represents a different classical element (fire, air, water, earth), and has either one point or two points. 
Four such figures are generated by random means -- dots drawn on paper, coin flips, dice rolls, whatever -- and plugged into the first four slots of a shield-shaped chart with fifteen such slots. 
The rest of the figures are generated by manipulating the first four figures and their derivatives.
Divination can be done solely with the shield chart, or the figures can be transcribed into a square, 12-slot chart based on the houses of the zodiac, which can provide a more nuanced reading.

This script is simply intended to generate the first four and derive the other eleven figures so that a geomancer can fill in the charts without actually having to do the math involved, because I always screw up at least one of them.

You can find my explanation of how the generation and derivation of figures works here: http://www.lynde-scott.com/geomancy-a-kata/

This project was originally a beginning Ruby project, so old versions of the code are *awful*. The latest version is still pretty naive, but it has a SQLite database to store things, and any version posted is working code for whatever's actually there.

The next step is to create a GUI using FOX and FxRuby.
