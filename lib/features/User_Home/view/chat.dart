import 'package:chat/core/widgets/customSpace.dart';
import 'package:chat/features/User_Home/view/widgets/searchBarAndUpperPart.dart';
import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Chat extends StatelessWidget {
  const Chat({
    super.key,
  });

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
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                      flex: 1,
                      padding: const EdgeInsets.all(8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: kAppColor,
                      icon: Icons.pin,
                      flex: 1,
                      padding: const EdgeInsets.all(8),
                      borderRadius: BorderRadius.circular(16),
                    )
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: kAppColor,
                    radius: 24,
                  ),
                  title: const Text('Hello this is Title'),
                  subtitle: const Text('Okay'),
                  trailing: Text(
                      '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                endIndent: 32,
                indent: 32,
                thickness: 1,
                color: kAppColor,
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
