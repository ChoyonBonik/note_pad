import 'package:flutter/material.dart';
import 'package:note_pad/accessories.dart';
import 'package:note_pad/home_page.dart';

class NotePad extends StatefulWidget {
  String mLine;
  int index;
  NotePad({Key? key, required this.mLine, required this.index}) : super(key: key);

  @override
  State<NotePad> createState() => _NotePadState();
}

class _NotePadState extends State<NotePad> {
  String _text='';
  TextEditingController _controller=TextEditingController();
  @override
  void initState() {
    _controller= TextEditingController(text: widget.mLine);
    _text = widget.mLine;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade100,
        actions: [
          MaterialButton(onPressed: (){
            setState((){
              saveData(widget.index, _text);
            });
          }, child: Text('Save')),
          SizedBox(width: 15,),
          MaterialButton(onPressed: (){
            setState((){
              saveData(widget.index, _text);
            });
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
          }, child: Text('Save and Exit')),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (String value){
              setState((){
                _text = value;
              });
            },
            controller: _controller,
            keyboardType: TextInputType.multiline,
            maxLines: null,
          )
        ],
      ),
    );
  }
}
