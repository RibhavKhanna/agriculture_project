import 'package:flutter_practice/widgets/sheet1.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetApi{
  static const _credentials=r'''
  {
  Add credentials Here
  ''';
  static final _spreadsheetId='1fkDRVRDRDpK6VUeHyJ4f1-gwjTGyYXsxIlT0iFiyhFc';
  static final _gsheets=GSheets(_credentials);
  static Worksheet? _userSheet;
  static Future init() async{
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Sheet1');
      final firstrow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstrow);
    }catch(e){
      print("init error $e");
    }
  }
  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,{required String title}) async{
    try {
      return await spreadsheet.addWorksheet(title);
    }catch(e){
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
  static Future insert(List<Map<String,dynamic>> rowlist) async{
    if(_userSheet==null) return;
    _userSheet!.values.map.appendRows(rowlist);
  }

}
