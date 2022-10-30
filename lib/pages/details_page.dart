import 'package:bontia_pacuit_act4/models/student_model.dart';
import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {
  final StudentModel studentData;
  const DetailsPage({Key? key, required this.studentData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Student Details', style: TextStyle(fontSize: 25)),
        ),
        body: ListView(
          children: [
            Card(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                      width: 100,
                      child: Text('ID Number: '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 150,
                      child: Text(studentData.iD.toString()),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                      width: 100,
                      child: Text('Name: '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 150,
                      child: Text(studentData.name.toString()),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                      width: 100,
                      child: Text('Birthday: '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 150,
                      child: Text(studentData.birthday.toString()),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                      width: 100,
                      child: Text('Gender: '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 150,
                      child: Text(studentData.gender.toString()),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                      width: 100,
                      child: Text('Year & Section: '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 150,
                      child: Text(studentData.yearSec.toString()),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                      width: 100,
                      child: Text('Course: '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 150,
                      child: Text(studentData.course.toString()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
