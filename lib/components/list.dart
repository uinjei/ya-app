import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//import 'dart:developer' as developer;

class WListTile extends StatelessWidget {
  const WListTile({
    Key key,
    @required this.listTileArgs,
    this.onTap,
  }) : super(key: key);

  final ListTileArgs listTileArgs;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(listTileArgs.title),
              subtitle: Text(listTileArgs.details),
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class WListView extends StatelessWidget {
  const WListView({Key key,
        @required this.listViewArgs,
        this.handleTap})
      : super(key: key);

  final ListViewArgs listViewArgs;
  final Function handleTap;

  @override
  Widget build(BuildContext context) {
    var eventListTiles = _getListTiles(listViewArgs, handleTap);

    return ListView.builder(
      itemBuilder: (context, position) {
        return eventListTiles[position];
      },
      itemCount: eventListTiles.length,
    );
  }
}

/* args */
List<WListTile> _getListTiles(ListViewArgs listViewArgs, handleTap) {
  return listViewArgs.listTileArgs
      .map((args) => WListTile(
            listTileArgs: args,
            onTap: () => handleTap(args),
          ))
      .toList();
}

class ListTileArgs {
  ListTileArgs({
    @required this.title,
    @required this.details,
  });

  String title;
  String details;
}

class ListViewArgs {
  ListViewArgs(this.listTileArgs);

  List<ListTileArgs> listTileArgs;
}