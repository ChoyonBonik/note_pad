import 'package:flutter/material.dart';
import 'package:note_pad/accessories.dart';
import 'package:note_pad/note_pad.dart';
import 'accessories.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future deleteDialog(BuildContext context, String mLine) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Warning'),
        content: Text('Do you want to Delete this note?'),
        actions: [
          TextButton(onPressed: (){
            setState((){
              removeData(mLine);
            });
            Navigator.of(context).pop();
          }, child: Text('YES')),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('NO')),
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.red.shade100,
      body: FutureBuilder(
        future: readData(),
        builder: (context, snapshot) {
          return CustomScrollView(
            slivers: [
              SliverGrid.count(crossAxisCount: 2,
                children: [
                  ...datas.map((mLine) {
                    int index = datas.indexWhere((element) => element == mLine);
                    return
                      InkWell(
                        onLongPress: () {
                          deleteDialog(context, mLine);
                        },
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  NotePad(mLine: mLine, index: index)));
                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.red.shade300,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(8, 8),
                                  blurRadius: 15,
                                ),
                              ]
                          ),
                          child: Text(mLine),
                        ),
                      );
                  }
                  ).toList(),
                  InkWell(
                    onLongPress: () {
                      //setState((){});

                    },
                    onTap: () {
                      setState(() {
                        addData();
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(8, 8),
                              blurRadius: 15,
                            ),
                          ]
                      ),
                      child: Icon(Icons.add, size: 40,),
                    ),
                  ),
                ],
              )
            ],
          );
        }
      ),
    ));
  }
}
