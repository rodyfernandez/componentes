import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  TablePage() : super();
 
  final String title = "Table";
 
  @override
  TablePageState createState() => TablePageState();
}
 
class TablePageState extends State<TablePage> {
  List<User> users;
  List<User> selectedUsers;
  bool sort;
 
  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = User.getUsers();
    super.initState();
  }
 
  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        users.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }
 
  onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }
 
  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for (User user in temp) {
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
  }
 
  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text("NOMBRE"),
              numeric: false,
              tooltip: "This is First Name",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("APELLIDO"),
            numeric: false,
            tooltip: "This is Last Name",
          ),
        ],
        rows: users
            .map(
              (user) => DataRow(
                      selected: selectedUsers.contains(user),
                      onSelectChanged: (b) {
                        print("Onselect");
                        onSelectedRow(b, user);
                      },
                      cells: [
                        DataCell(
                          Text(user.firstName),
                          onTap: () {
                            print('Selected ${user.firstName}');
                          },
                        ),
                        DataCell(
                          Text(user.lastName),
                        ),
                      ]),
            )
            .toList(),
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('SELECCIONADO ${selectedUsers.length}'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('BORRAR SELECCION'),
                  onPressed: selectedUsers.isEmpty
                      ? null
                      : () {
                          deleteSelected();
                        },
                ),
              ),
           
            ],
          ),
        ],
      ),
    );
  }
}

class User {
  String firstName;
  String lastName;
 
  User({this.firstName, this.lastName});
 
  static List<User> getUsers() {
    return <User>[
      User(firstName: "Aaryan", lastName: "Shah"),
      User(firstName: "Ben", lastName: "John"),
      User(firstName: "Carrie", lastName: "Brown"),
      User(firstName: "Deep", lastName: "Sen"),
      User(firstName: "Emily", lastName: "Jane"),
    ];
  }
}