import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController idCon = TextEditingController();
  TextEditingController nameCon = TextEditingController();
  TextEditingController bdCon = TextEditingController();
  TextEditingController courseCon = TextEditingController();
  TextEditingController secCon = TextEditingController();
  var genderVal = '';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Add Student', style: TextStyle(fontSize: 25),),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              TextFormField(
                controller: idCon,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'ex: 2020300845',
                    labelText: 'Enter your id number'
                ),
                validator: (idValue){
                  if (idValue!.isEmpty ||
                      !RegExp(r'^[0-9]{10,11}').hasMatch(idValue)) {
                    return 'Please enter correct id number';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: nameCon,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    hintText: 'ex: Mark Louie N. Bontia',
                    labelText: 'Enter your full name'
                ),
                validator: (nameValue){
                  if (nameValue!.isEmpty ||
                      !RegExp(r'^[a-z A-Z.]+$').hasMatch(nameValue)) {
                    return 'Please enter correct id number';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: bdCon,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'ex: 03/11/2002',
                    labelText: 'Enter your birthdate'
                ),
                validator: (bdValue){
                  if (bdValue!.isEmpty ||
                      !RegExp(r'^[0-9]+/[0-9]').hasMatch(bdValue)) {
                    return 'Please enter correct birthdate';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: courseCon,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    hintText: 'ex: BSIT',
                    labelText: 'Enter your course'
                ),
                validator: (courseValue){
                  if (courseValue!.isEmpty ||
                      !RegExp(r'^[a-z A-Z-.]').hasMatch(courseValue)) {
                    return 'Please enter correct course';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: secCon,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'ex: 3R1',
                    labelText: 'Enter your section'
                ),
                validator: (sectionValue){
                  if (sectionValue!.isEmpty ||
                      !RegExp(r'^[a-z A-Z.0-9]+$').hasMatch(sectionValue)) {
                    return 'Please enter correct section';
                  } else {
                    return null;
                  }
                },
              ),
              DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                    DropdownMenuItem(
                      value: 'Other',
                      child: Text('Other'),
                    ),
                  ],
                  onChanged: (value) {
                    genderVal = value.toString();
                  }),
              const SizedBox(height: 40,),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                    onPressed: (){
                      if (formKey.currentState!.validate()) {
                        List inputDetails = [
                          idCon.text,
                          nameCon.text,
                          bdCon.text,
                          genderVal,
                          secCon.text,
                          courseCon.text
                        ];
                        Navigator.pop(context, inputDetails);
                      }
                    },
                    child: const Text('Submit',
                        style: TextStyle(fontSize: 20))
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
