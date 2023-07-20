// ignore_for_file: unused_field, unused_local_variable

import 'package:chat/core/widgets/customSpace.dart';
import 'package:chat/features/User_Home/view/widgets/searchBarAndUpperPart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../core/constants.dart';

class Chat extends StatelessWidget {
  Chat({
    super.key,
  });

  final Stream<QuerySnapshot> _collectionStream = FirebaseFirestore.instance
      .collection('users')
      .snapshots(includeMetadataChanges: true);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kAppColor,
          ),
          child: const UpperPart(),
        ),
        const CustomSpace(height: 6, width: double.infinity),
        StreamBuilder<QuerySnapshot>(
          stream: _collectionStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Text('There is an error'),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Expanded(
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['firstName']),
                    subtitle: Text(data['email']),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
