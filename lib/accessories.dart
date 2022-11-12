import 'package:shared_preferences/shared_preferences.dart';

List<String> datas = [];

Future readData() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  datas=pref.getStringList('key')??[];

}
addData() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  datas.add('');
  await pref.setStringList('key', datas);
  readData();
}
removeData(String mLine) async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  datas.remove(mLine);
  await pref.setStringList('key', datas);
  readData();
}
saveData(int index, String newMline) async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  datas[index] = newMline;
  await pref.setStringList('key', datas);
  readData();
}