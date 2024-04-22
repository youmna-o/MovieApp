import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate/rate.dart';

import '../../features/profile/view/manager/theme_const.dart';
import '../../features/profile/view/manager/theme_mode_manager.dart';
import '../models/movies_model.dart';

class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({
    super.key,
    required this.movie,
    required this.title,
    required this.image,
      required this.isSaved,
     required this.save,
//
  });
  final MoviesModel movie ;
   final bool isSaved ;
  final String title ;
  final String image ;
   final void Function() save ;
  @override
  Widget build(BuildContext context) {
    final currentMode = Provider.of<ThemeProvider>(context).themData;
    return Container(
       height: MediaQuery.of(context).size.height*0.3,
      decoration: BoxDecoration(
        color: currentMode == darkTheme ? Color(0xFF1F1F1F).withOpacity(0.2) : Colors.black,
        borderRadius: BorderRadius.circular(24),
        border:Border(
          left: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
          right: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
          top: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        )

    ),
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: MediaQuery.of(context).size.height*0.20,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),),
                  child:Image.network("${image}",fit: BoxFit.fill) ,
                ),
                Positioned(
                    top:0,
                    right: 0,
                    child: IconButton(
                      onPressed:save, //save,
                      icon: Icon(
                         isSaved?
                        Icons.bookmark_add :
                        Icons.bookmark_add_outlined,
                        color: Colors.white,size: 50,),
                    )
                ),

              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "${title}",
                        style: TextStyle(color: Colors.white,fontSize: 18),)),
                ],
              ),
            ),
          ),
        ],

      ),

    );
  }
}
