import 'package:bontia_pacuit_act4/models/student_model.dart';
import 'package:flutter/material.dart';
import 'add_student.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List studentData;
  late List dataReceiver;
  late List id;
  late List names;
  late List birthday;
  late List gender;
  late List sections;
  late List courses;
  int  count = 0;
  late List details;


  @override
  void initState() {
    count = 0;
    id = [];
    names= [];
    birthday = [];
    gender = [];
    sections = [];
    courses = [];
    studentData = [];
    details = List.generate(count, (index)
    => StudentModel(
        id[index],
        names[index],
        birthday[index],
        gender[index],
        sections[index],
        courses[index]
    )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Activity #4', style: TextStyle(fontSize: 25),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: details.length,
                  itemBuilder: (context, index){
                    return Card(
                      elevation: 15.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Dismissible(
                          direction: DismissDirection.endToStart,
                          key: UniqueKey(),
                          background: Container(
                            color: Colors.green,
                            child: const Icon(Icons.cancel),
                          ),
                          secondaryBackground: const Icon(Icons.delete,
                            color: Colors.red,
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.account_circle,
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 20, right: 20),
                            title: Text(names[index]),
                            subtitle: Text('${courses[index]} - ${sections[index]}'),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsPage(studentData: details[index],)
                                  )
                              );
                            },
                          ),
                          onDismissed: (direction) => setState(() {
                            details.removeAt(index);
                            id.removeAt(index);
                            names.removeAt(index);
                            birthday.removeAt(index);
                            gender.removeAt(index);
                            sections.removeAt(index);
                            courses.removeAt(index);
                            --count;
                          })
                      ),
                    );
                  }
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            dataReceiver = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddStudent()
                )
            );
            setState(() {
              ++count;
              studentData = dataReceiver;
              id.add(studentData[0]);
              names.add(studentData[1]);
              birthday.add(studentData[2]);
              gender.add(studentData[3]);
              sections.add(studentData[4]);
              courses.add(studentData[5]);
              details = List.generate(count, (index)
              => StudentModel(
                  id[index],
                  names[index],
                  birthday[index],
                  gender[index],
                  sections[index],
                  courses[index]
              )
              );
            });
          }),
    );
  }
}
