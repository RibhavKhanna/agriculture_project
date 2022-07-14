import 'package:flutter_practice/widgets/sheet1.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetApi{
  static const _credentials=r'''
  {
  "type": "service_account",
  "project_id": "endsemprojectfirstyear",
  "private_key_id": "4b46a274127200719c81dbd0230e26669ce9de41",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDkW762dQKm8hRo\nQzbSodEnxxBiemE3j4IHTGky3cDNCziI4cuXG7lFlQy9tb0DW7ntXdXZ54axRLQb\nuLPRLvD4kmWd3EYheX5Du0sBmZ/KH1q63jamazBJSYiQ0M3eePALd3pPFvq464PE\nWBwp3AYZZyctVcA4kLJ2My/5YB2H1UGV/boBmhSYEXFZBtPdhvkjQii1G5vyV9oE\neQtfup7DeWUA2cX0/HsNpzRMp0O2Kv8se2sgfrMbjpZA0hruc0ZBl8nuw0mS7XWb\n1xVGLWgABJgLkUKuabnE70WvXfEzFGEimMWs6glUD1n/52Z99BxUJQSM8BfckExj\nc1Fydw/VAgMBAAECgf9B3DP6FhqDC6PXGODhiXSehEsKxpZDRUsQenkyB8K+Cv5t\n0VwRDhiLzkZecIvoQWGI6VyZUVeyHfPUCvEm442cI0eAv9wky2V0eLqpO3qvpgYE\n3xHj7Vt/x4rGOXJ74hAD6UbdM0NxvHsZpaUkbXtU2ECe/UbzCXMZo/8HbTEXJglx\npTIo3RHhbP4WWi0sDQ22Bg7YFumT/YxOoTnxXgLLjucE4y7MWW/rFPCb8BzHXtAu\nLvAIJzvIMTH9ARyvOlJf47X008x1MW8CesRX4DtQQYgPLB9gl7Vha9Vm9ZsRiKg2\nHzip6GozYyYvRqI7EOPASnSD0HPr3fU8d3s8SNECgYEA9jhFPXL00hqLsAc2IFZ0\nrfS+b8Sa3gydF+KhKg2kVTHJ/N7Mv/UrD+0lpB0CeNm+Yj5sHSHzD+uXCCKTIUdf\nAznem78V8/L32l4qdhmkuszO4CB7+gqA7dMwE6hEKRJt2v6t+TaGR0Q2anWfcyq9\n2s7w7Up1zNQIAIKNgp1cTZkCgYEA7W3Y8M8pYEV7yxkkvByH+fK5sCbj00aScoJP\nYoN1zC80yhqwcNdBSdZ4zxc39gc/ODP+tv/2x9Fz4LT1PJwTqYmXXhtRuS/hLeWP\nWLWS0YcLfjF0lL96s8Q49oprPC8xArCHowVBZBGwbUSeGyz1Hb+FbzFc7ulfr35X\neS7o4Z0CgYAc7MFdlaqjIBE27bHzHJT6dp0EnlEfMtYlny8VtKKQi5fSCA5/onqb\nlV1tqSbIMbRG8FRdG8blIOUORJmKOEs2Is8+9rTKgsmRMqzEUQDkHPlUpRxLZH5+\n8edc99CCDrMvHeosM7aUmrPVz9maevPwx4zQI4YxONtzy+J57KiSSQKBgQDcQcQ4\nGSZcLflafxfJ/nnSUO8bz+gX7mcbHXIBhMy5v60sNDgsZjQmCHWIQBTlAvIN9IY+\nRBQuaEskURsTwAKpi3/FiHh24Ej4J/akJ8Vs5OeviLeK6lss+0KQy/YRHgJMaXFa\ntRxlddeCdl5p/Xniv/JMJbH93LesePsy62aVLQKBgQDu0rW6/rOcNLZViFqn9cdL\nqPvQ1sjVtlunokODXEw3v9YZCBKzHd2wQIvszx3OAujF23A+rx2OThY2Xvq+6Obg\np+GXHT3uAWoG6oYeSDVITVKIbx1zo79+31ZHZMU/obr3bY9Wl3paW94PEJrdRd9D\nYQ5aAsn0qaluWtDmJ8YTwA==\n-----END PRIVATE KEY-----\n",
  "client_email": "endsemprojectfirstyear@endsemprojectfirstyear.iam.gserviceaccount.com",
  "client_id": "115383368231598040747",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/endsemprojectfirstyear%40endsemprojectfirstyear.iam.gserviceaccount.com"
}
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