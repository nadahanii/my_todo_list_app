import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var toDos = List.filled(3, 'Task', growable: true);

  var isChecked = List<bool>.filled(3, false, growable: true);

  String input = "";

  @override
  void initState() {
    super.initState();
    //toDos.add('value');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white60,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                CupertinoIcons.search,
                color: Colors.black,
              ),
              SizedBox(
                width: 18.0,
              ),
              Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Add your task',
                      style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    content: TextField(
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    actions: <Widget>[
                      /*TextButton(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.blue,
                          ),
                          child: Text(
                            'New Task',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              // fontSize: 24.0,
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            toDos.add(input);
                            bool temp = false;
                            isChecked.add(temp);
                          });
                          Navigator.of(context).pop();
                        },
                      ),*/
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            toDos.add(input);
                            bool temp = false;
                            isChecked.add(temp);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'New Task',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.indigo.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0)),
                      ),
                    ],
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.indigo.shade900,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 50.0,
                  child: Text(
                    'What\'s Up , Joy!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'TODAY\'S TASKS',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: toDos.length ,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        /*Key(toDos[index])*/
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            toDos.removeAt(index);
                            isChecked.removeAt(index);
                          });

                          //Text(" The task was deleted")
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(" The task was deleted"),
                          ));
                        },
                        child: CheckboxListTile(
                          title: Text(toDos[index]),
                          
                          value: isChecked[index],
                          checkColor: Colors.white,
                          tristate: false,
                          onChanged: (bool newValue) {
                            setState(() {
                              isChecked[index] = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.purple.shade900,
            child: ListView(
              children: [
                Container(
                  width: 310.0,
                  height: 210.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/originals/b4/00/85/b400851a6b07f8877a9236f275bd8d4f.jpg'),
                            maxRadius: 45.0,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  'Joy Mitchel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.bookmark_border_outlined,
                    size: 23.0,
                    color: Colors.white30,
                  ),
                  title: Text(
                    'Templates',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.now_widgets_outlined,
                    size: 23.0,
                    color: Colors.white30,
                  ),
                  title: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.pie_chart_outline_rounded,
                    size: 23.0,
                    color: Colors.white30,
                  ),
                  title: Text(
                    'Analytics',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings_outlined,
                    size: 23.0,
                    color: Colors.white30,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
