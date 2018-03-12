## Problem

The attached text file contains the favorite musical artists of 1000 users from Some Popular Music Review Website. Each line is a list of up to 50 artists, formatted as follows:

Radiohead,Pulp,Morrissey,Delays,Stereophonics,Blur,Suede,Sleeper,The La's,Super Furry Animals,Iggy Pop\n
Band of Horses,Smashing Pumpkins,The Velvet Underground,Radiohead,The Decemberists,Morrissey,Television\n
etc.

Write a program that, using this file as input, produces an output file containing a list of pairs of artists which appear TOGETHER in at least fifty different lists. For example, in the above sample, Radiohead and Morrissey appear together twice, but every other pair appears only once. Your solution should be a cvs, with each row being a pair. For example:

Morrissey,Radiohead\n

Your solution MAY return a best guess, i.e. pairs which appear at least 50 times with high probability, as long as you explain why this tradeoff improves the performance of the algorithm. Please include, either in comments or in a separate file, a brief one-paragraph description of any optimizations you made and how they impact the run-time of the algorithm.

## How to Run
Ensure your environment can execute Ruby (https://rvm.io/rvm/install)

Then run `ruby entry_point.rb`

Running the specs requires installing two small dependencies:

`gem install rspec`

`gem install fakefs`

Then run `rspec spec`

## Solution

The apriori algorithm for finding frequent itemsets with 100% accuracy is used. This has runtime complexity of O(k^2) where k is the number of unique artists in the input file. Space complexity is O(m*n) where n is the number of lines and m is the number of artists per line.

1. A first pass is made to map each distinct artist to the set of lines they appear on.
2. Artists with set counts < 50 are filtered out since they cannot possibly make a frequent pair.
3. Artist pairs with set intersection counts >= 50 are the frequent pairs.


## Optimization
Space could be reduced at the expense of accuracy by using a count-min sketch to store the counts.
