import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreFirstPage extends StatelessWidget {
  const PreFirstPage({
    super.key,
    required CollectionReference<Object?> users,
  }) : _users = users;

  final CollectionReference<Object?> _users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _users.snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> streamSnapshot){
          if(streamSnapshot.hasData){
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context,index){
                  final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['FullName']),
                      subtitle: Text(documentSnapshot['Email']),
                      trailing: SizedBox(width: 100,
                        child: Row(
                          children: [
                            // IconButton(onPressed: ()=> _update(documentSnapshot), icon: Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
