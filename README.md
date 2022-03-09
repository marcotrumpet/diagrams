# diagrams

This is a test project to play around with CustomPainter and an excuse to test Flutter Web and Flutter Desktop.

The main idea is to basically rewrite [draw.io](draw.io) as close as possible.
In this way I can explore and learn new stuff.

### goals

[x] have a set of basic shapes <br />
[x] draw arrows to link shapes <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(after many iteration I tryed to adapt [this](https://github.com/RafaelBarbosatec/a_star) A* algorithm to my needs) <br />
[] change arrow path <br />
[] change elements dimensions <br />
[] textfields inside elements <br />
[] change elements properties (color, border, background) <br />
[] change text properties <br />
[] many, many, more


### examples

This first image is the empty grid when app starts: <br />
<img src="readme_images/1.png" alt="drawing" width="600"/>

When you add elements you can link them with arrows, the A* alghorithm takes care of finding the shortest path: <br />
<img src="readme_images/2.png" alt="drawing" width="600"/>

When you add elements that cross arrows, the A* alghorithm takes care of finding the shortest path avoiding collision with element not linked to the arrow: <br />
<img src="readme_images/3.png" alt="drawing" width="600"/>


### tests

To run bloc tests `flutter test test/bloc_test.dart` <br />
To run golden tests `flutter test test/golden_test.dart --tags=golden` <br />
To update golden tests `flutter test test/golden_test.dart --update-goldens --tags=golden`