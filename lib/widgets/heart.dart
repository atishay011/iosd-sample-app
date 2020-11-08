import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  final Color color;
  final double size;
  Heart({this.color , this.size});
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
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
        return Row(
          children : [
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
        ),
        Text("$count",
      style : Theme.of(context).textTheme.button.copyWith(color : Colors.grey[800] , fontSize: 16.0)             
        )
          ]
        );
      }
    );
  }
}