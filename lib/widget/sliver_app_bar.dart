

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

class PersonalizationAppBar extends StatefulWidget {
  @override
  _PersonalizationAppBarState createState() => _PersonalizationAppBarState();
}

class _PersonalizationAppBarState extends State<PersonalizationAppBar> {

  double _top = 0.0;
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver : SliverSafeArea(
              top: false,
              sliver: SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 2.0,
                expandedHeight: MediaQuery.of(context).size.height * 0.45,
                pinned: true,
                actions: [
                  IconButton(
                    splashRadius: 20,
                    splashColor: Colors.grey[600],
                    onPressed: () {},
                    icon: Icon(Icons.star_border, color: Palette.themeGreen, size: 22,),
                  ),
                  IconButton(
                    splashRadius: 20,
                    splashColor: Colors.grey[600],
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: Palette.themeGreen,),
                  ),
                  IconButton(
                    splashRadius: 20,
                    splashColor: Colors.grey[600],
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: Palette.themeGreen,),
                  ),
                ],
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    _top = constraints.biggest.height;
                    return FlexibleSpaceBar(
                     title: Text('Konjina', style: TextStyle(color: Colors.black),),
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[600].withOpacity(0.7),
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                image: AssetImage("images/new_york.jpg",),
                                fit: BoxFit.fill,
                            )
                        ),
                      ),

                    );
                  },
                ),

              ),
            ),
          )
        ];
      },
      body: SingleChildScrollView(
        child : Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    minWidth: 150,
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    color: Palette.themeGreen,
                    shape: RoundedRectangleBorder(
                        side: BorderSide( color: Colors.grey.withOpacity(0.6), width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: () {},
                    child: Text('Call owner'),
                  ),
                  FlatButton(
                    minWidth: 150,
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    color: Palette.themeGreen,
                    shape: RoundedRectangleBorder(
                      side: BorderSide( color: Colors.grey.withOpacity(0.6), width: 2),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: () {},
                    child: Text('Free message'),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text('062551752', style: TextStyle(fontSize: 18),)
                        ),
                        Spacer(),
                        Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey[400], size: 30,)
                        )
                      ],
                    ),
                    Divider(thickness: 1, color: Colors.grey[400],),

                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
