import 'package:cobakuis1/thirdpage.dart';
import 'package:flutter/material.dart';
import 'package:cobakuis1/homepage.dart';
import 'package:cobakuis1/DataDummy.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final List<Member> person = GenerateMember.getDataMembers();
          Member member = person[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(member: person[index]),
                  ));
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.network(member.photoUrl),
                  ),
                  Text(member.name),
                ],
              ),
            ),
          );
        },
        itemCount: GenerateMember.getDataMembers().length,
      ),
    );
  }
}
