import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1()
                  ],
                ),
              );
            }
          
         Widget  _cardTipo1() {

           return Card(
             child: Column(
               children: <Widget>[
                 ListTile(
                   leading: Icon(Icons.photo_album, color: Colors.blue),
                   title: Text('Soy el titulo de esta tarjeta'),
                   subtitle: Text('Hola como andas, pero soy una tarjeta con un texto mas largo que les quiero mostrar'),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                     FlatButton(
                       child: Text('Cancelar'),
                       onPressed: () {},
                     ),
                     FlatButton(
                       child: Text('OK'),
                       onPressed: () {},
                     ),
                   ],
                 )
               ],
             ) ,

           );

         }
}