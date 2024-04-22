/*import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.title});
  final String title;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 200,
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return Image.network("https://via.placeholder.com/350x150",fit: BoxFit.fill,);
          },
          itemCount: 3,
          pagination: SwiperPagination(),
          control: SwiperControl(),
        ),
      ),
    );
  }
}*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: MaterialButton(
          color: Colors.black.withOpacity(0.5),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Durations.medium1,
                content: Text("Not Exist Email"),
                backgroundColor: Colors.red,
              ),
            );
          },
          child: Text('Show SnackBar'),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectadindex =0;
  List<Widget> widgets = [
    Container(color: Colors.black,),
    Container(color: Colors.red),
    Container(color: Colors.black,),
    Container(color: Colors.white,),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF1F1F1F),
        ),
        child: new BottomNavigationBar
          ( type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.black, //
          selectedItemColor: Color(0xFFF48D15),
          currentIndex: selectadindex,
          onTap: (index){
            setState(() {
              selectadindex = index ;
            });
          },
          items: [
            BottomNavigationBarItem(label : "Home",icon: Icon(Icons.home)),
            BottomNavigationBarItem(label : "Search",icon: Icon(Icons.search)),
            BottomNavigationBarItem(label : "Saved",icon: Icon(Icons.bookmark_add)),
            BottomNavigationBarItem(label : "Profile",icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: widgets.elementAt(selectadindex),


    );
  }
}*/
