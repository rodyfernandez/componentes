import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_pages.dart';
import 'package:componentes/src/pages/csv_page.dart';
import 'package:componentes/src/pages/filepicker_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/table_page.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

return  <String, WidgetBuilder>{

          '/'    : (BuildContext context) => HomePage(),
          'alert'    : (BuildContext context) => AlertPage(),
          'avatar'    : (BuildContext context) => AvatarPage(),
          'card'    : (BuildContext context) => CardPage(),
          'csv'    : (BuildContext context) => CsvPage(),
          'table'    : (BuildContext context) => TablePage(),
          'filepicker'    : (BuildContext context) => FilePickerPage(),
          

        };
  
}


