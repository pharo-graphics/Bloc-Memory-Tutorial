This is the code for the memory game booklet that is available on http://books.pharo.org and whose source is available 
on [http://github.com/booklet](https://github.com/SquareBracketAssociates/Booklet-ASimpleMemoryGame).

### Loading the Memory Game

To make the demo easier to follow and help you if you get lost, we already made a full implementation of the game. You can load it using the following code:

```smalltalk
Metacello new
    baseline: 'BlocMemoryTutorial';
    repository: 'github://pharo-graphics/Bloc-Memory-Tutorial/src';
    load
```
