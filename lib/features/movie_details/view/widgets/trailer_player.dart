import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPlayer extends StatelessWidget {
  
  const TrailerPlayer({
    super.key,
    required YoutubePlayerController controller,
  }) : _controller = controller;

  final YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Container(
        width: 300,
        height: 200,
        child: YoutubePlayerBuilder(
            player:YoutubePlayer(controller: _controller,),
            builder: (context,player){
              return player ;
            }
        ),
      ),
    );
  }
}

