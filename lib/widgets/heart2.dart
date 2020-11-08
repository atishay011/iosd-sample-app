import 'package:flutter/material.dart';

class Heart2 extends StatefulWidget {
  final Color color;
  final double size;
  Heart2({this.color , this.size});
  @override
  _Heart2State createState() => _Heart2State();
}

class _Heart2State extends State<Heart2> with SingleTickerProviderStateMixin {
  bool isFav = false;
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  int count = 4;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _colorAnimation = ColorTween(begin: widget.color, end: Colors.red).animate(_controller);

    _controller.addListener(() {
      // print(_controller.value);
      // print(_colorAnimation.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    }); 
  }

  // dismiss the animation when widgit exits screen
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _){
        return 
        IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: widget.size,
          ),
          onPressed: () {
            isFav ? _controller.reverse() : _controller.forward();
            setState(() {
              count == 4 ? count = 5 : count = 4;
            });
          },
        );
      }
    );
  }
}