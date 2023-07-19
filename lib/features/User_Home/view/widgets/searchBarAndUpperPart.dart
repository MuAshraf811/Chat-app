import 'package:chat/core/widgets/customSpace.dart';
import 'package:flutter/material.dart';

class UpperPart extends StatelessWidget {
  const UpperPart({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CustomSpace(height: 8, width: double.infinity),
          Text(
            'Chats',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomSpace(height: 6, width: double.infinity),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchBar(
                constraints: BoxConstraints(
                  maxHeight: 35,
                  maxWidth: 250,
                ),
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                hintText: 'Search',
                hintStyle: MaterialStatePropertyAll(
                  TextStyle(
                    letterSpacing: 2,
                  ),
                ),
                leading: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
