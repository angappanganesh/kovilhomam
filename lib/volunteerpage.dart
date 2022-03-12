import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_database/firebase_database.dart';

class VolunteerPage extends StatelessWidget {
  final imgPath;

  VolunteerPage({Key? key, this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 12),
          FloatingActionButton.extended(
            heroTag: null,
            onPressed: () {
              Navigator.pop(context);
              /*
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UnderConstructionScreen(),
                ),
              );
              */
            },
            icon: Icon(Icons.send),
            label: Text('SUBMIT'),
          ),
        ],
      ),
      */
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imgPath), fit: BoxFit.cover)),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: new Row(
                children: <Widget>[
                  new IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('images/avnsm.png'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 15)
                ],
              ),
            ),
            /*
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                //color: Color.fromRGBO(31, 58, 47, 1.0),
                color: Colors.orange
              ),
              child: HomamForm(imgPath: imgPath),
            ),
            */
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.96), BlendMode.dstIn),
              child: Container(
                height: 1000,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    //color: Color.fromRGBO(31, 58, 47, 1.0),
                    color: Colors.white
                  //color: Colors.blueGrey
                ),
                child: VolunteerForm(imgPath: imgPath),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Card(
      //   elevation: 3,
      //   margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      //   child: FeaturesTheme(),
      // ),
    );
  }
}

class VolunteerForm extends StatefulWidget {
  final imgPath;

  const VolunteerForm({Key? key, this.imgPath}) : super(key: key);

  @override
  _VolunteerFormState createState() => _VolunteerFormState();
}

class _VolunteerFormState extends State<VolunteerForm> {

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameTextController = TextEditingController();
  bool nameError_ = false;
  final contactNoController = TextEditingController();
  bool contactNoError_ = false;
  final addressController = TextEditingController();
  bool addressError_ = false;
  final pincodeController = TextEditingController();
  bool pinCodeError_ = false;
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameTextController.dispose();
    contactNoController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            listItemStats('images/volunteer3.png',"4000+ volunteers across the world. Whether it comes to Homam or any other activity to withhold Dharma, our volunteers not only play a major role but infuse so much spirit and energy.".tr(), true),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Divider(color: Color.fromRGBO(31, 58, 47, 1.0),)
        ),
        const SizedBox(height: 7),
        //const Divider(indent: 20),
        /*
        DropDownField(
          value: _gender,
          icon: Icon(Icons.transgender),
          required: true,
          strict: false,
          items: choices.genders,
          labelText: 'Gender'.tr(),
          setter: (dynamic newValue) {
            _gender = newValue;
          },
        ),
        */
        //const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: TextField(
              style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
              controller: nameTextController,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color.fromRGBO(31, 58, 47, 1.0)),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Name'.tr(),
                labelStyle: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
                prefixIcon: const Icon(Icons.person, color: Color.fromRGBO(31, 58, 47, 1.0),),
                errorText: nameError_ ? 'Please enter valid name'.tr() : null,
                //prefixText: getGenderPrefix(),
                //suffixText: 'USD',
                //suffixStyle: const TextStyle(color: Colors.green)
              ),
            )
        ),
        const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: TextField(
              style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
              controller: addressController,
              keyboardType: TextInputType.streetAddress,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color.fromRGBO(31, 58, 47, 1.0)),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Address'.tr(),
                labelStyle: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
                prefixIcon: const Icon(Icons.home, color: Color.fromRGBO(31, 58, 47, 1.0),),
                errorText: addressError_ ? 'Please enter valid address'.tr() : null,
                //prefixText: getGenderPrefix(),
                //suffixText: 'USD',
                //suffixStyle: const TextStyle(color: Colors.green)
              ),
            )
        ),
        const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: TextField(
              style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
              controller: pincodeController,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color.fromRGBO(31, 58, 47, 1.0)),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Pin Code'.tr(),
                labelStyle: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
                prefixIcon: const Icon(Icons.location_pin, color: Color.fromRGBO(31, 58, 47, 1.0),),
                errorText: pinCodeError_ ? 'Please enter valid pin code'.tr() : null,
                //prefixText: getGenderPrefix(),
                //suffixText: 'USD',
                //suffixStyle: const TextStyle(color: Colors.green)
              ),
            )
        ),
        const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
            child: TextField(
              controller: contactNoController,
              style: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color.fromRGBO(31, 58, 47, 1.0)),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Contact Number'.tr(),
                labelStyle: TextStyle(color: Color.fromRGBO(31, 58, 47, 1.0)),
                prefixIcon: const Icon(Icons.local_phone, color: Color.fromRGBO(31, 58, 47, 1.0),),
                errorText: contactNoError_ ? 'Please enter valid contact no'.tr() : null,
                //prefixText: getGenderPrefix(),
                //suffixText: 'USD',
                //suffixStyle: const TextStyle(color: Colors.green)
              ),
            )
        ),
        //const Divider(indent: 20),
        // Removing this as date of joining is the current date
        /*
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date of Joining"),
              SizedBox(width: 20.0,),
              Text("${dateOfBirth.toLocal()}".split(' ')[0]),
              SizedBox(width: 20.0,),
              IconButton(
                onPressed: () => _selectDate(context),
                icon: const Icon(Icons.calendar_today),
              ),
            ],
          ),
        ),
        */
        /*
        const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: TextField(
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Name of School',
                prefixIcon: const Icon(Icons.school, color: Colors.teal,),
                //prefixText: getGenderPrefix(),
                //suffixText: 'USD',
                //suffixStyle: const TextStyle(color: Colors.green)
              ),
            )
        ),
        const Divider(indent: 20),
        Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: TextField(
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)
                ),
                //hintText: '',
                //helperText: 'If more than one trainer, separate with semicolon ;',
                labelText: 'Type of School',
                //prefixIcon: const Icon(Icons.person, color: Colors.blue,),
                //prefixText: getGenderPrefix(),
                //suffixText: 'USD',
                //suffixStyle: const TextStyle(color: Colors.green)
              ),
            )
        ),
        */
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 15.0),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.white,
                foregroundColor: Color.fromRGBO(75, 97, 88, 1.0),
                heroTag: null,
                onPressed: () async {
                  if(nameTextController.value.text.isEmpty) {
                    setState(() => nameError_ = true);
                  }
                  else {
                    setState(() => nameError_ = false);
                  }
                  if(addressController.value.text.isEmpty) {
                    setState(() => addressError_ = true);
                  }
                  else {
                    setState(() => addressError_ = false);
                  }
                  if(!RegExp(r'^[0-9]+$').hasMatch(pincodeController.value.text) || pincodeController.value.text.length > 6 || pincodeController.value.text.length < 4) {
                    setState(() => pinCodeError_ = true);
                  }
                  else {
                    setState(() => pinCodeError_ = false);
                  }
                  if(!RegExp(r'^[0-9]+$').hasMatch(contactNoController.value.text) || contactNoController.value.text.length != 10) {
                    setState(() => contactNoError_ = true);
                  }
                  else {
                    setState(() => contactNoError_ = false);
                  }
                  if(nameError_ || addressError_ || pinCodeError_ || contactNoError_)
                    return;

                  DatabaseReference ref = FirebaseDatabase.instance.ref("volunteers").push();

                  await ref.set({
                    "recorddate": dateFormat.format(DateTime.now()),
                    "name": nameTextController.value.text,
                    "address": addressController.value.text,
                    "pincode": pincodeController.value.text,
                    "contactNo": contactNoController.value.text
                  });
                  showDialog(context: context,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text('Submitted'.tr()),
                        content: new Text('We welcome you! Our volunteers will contact you soon.'.tr()),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'.tr()),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )
                  );
                },
                icon: Icon(Icons.send),
                label: Text('Submit'.tr()),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget listItemStats(String imgpath, String name, bool value){
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(31, 58, 47, 1.0)),
          borderRadius: BorderRadius.circular(25),
          //color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Image(image: AssetImage(imgpath),width: 45,height: 45),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 4.0, 6.0, 4.0),
            child: Text(name, style: TextStyle(fontSize: 13, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}