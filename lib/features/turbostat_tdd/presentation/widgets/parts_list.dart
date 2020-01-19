import 'package:flutter/material.dart';

class PartsListWidget extends StatelessWidget {
  const PartsListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // TODO Future Builder
    ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                child: Icon(Icons.adjust),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text('part name'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'part articule',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                        Text(
                          'part price',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /*
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () async {},
              ),
              */
              IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () async {},
              ),
            ],
          ),
        );
      },
    );
  }
}
