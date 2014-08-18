#Drawing Circles

This is an example project showing a weird behaviour trying to change the flatness of a bezier path in a CAShapeLayer.

Changing the flatness of the bezier path has no effect in a
CAShapeLayer, while it works properly when the path is stroked
manually in a CGContext.

![Drawing circles](https://raw.github.com/sergiou87/DrawingCircles/master/Images/flatness.gif)

I've filed a bug report to Apple and submitted to [Open Radar](http://openradar.io/23784682), 
but I know it may be my fault. If that's the case, I'll thank you if you let me know the right way to do it at Twitter: [@sergiou87](https://twitter.com/sergiou87).
