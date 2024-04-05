import 'package:dairy/Admin_pannel/Items.dart';
import 'package:dairy/Admin_pannel/ProductForm.dart';
import 'package:dairy/Room_Database/Database.dart';
import 'package:dairy/Room_Database/product.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final double width;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.keyboardType,
    this.width = 40.0,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            "${widget.label} :",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: widget.width),
        Flexible(
          child: TextFormField(
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Colors.black45,
                fontSize: 18,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(width: 100),
      ],
    );
  }
}

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  _AdminViewState createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  late final TextEditingController _nameController;

  @override
  void initState(){
    _nameController =TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    _nameController.dispose();
    super.dispose();
  }

  Future<void>addData()async{
    final data=Product(
        name: _nameController.text,
        mbno: "mbno",
        MerchantID: "MerchantID",
        BTname: "BTname",
        BTadd: "BTadd",
        mode: true,
    );
    await RoomDatabase.instance.createProduct(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20,left: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellowAccent,
                        border: Border.all(color: Colors.black54, width: 1)),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal:25),
                    child: Text(
                      "Payment Mode",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0,left: 10),
                  child: Text("SET UP YOUR MACHINE",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Image.asset("assets/images/logo.jpg",
                    height: 100,width: 100,),
                )
              ],
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'title',
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'please name';
                }
                return null;
              },
            ),
            CustomTextField(
              label: "Name",
              hintText: "Enter Name",
              keyboardType: TextInputType.text,
              width: 170.0,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: "Mobile Number",
              hintText: "Enter Mobile number",
              keyboardType: TextInputType.phone,
              width: 60.0, // Custom width
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: "City",
              hintText: "Enter City",
              keyboardType: TextInputType.text,
              width: 190.0, // Custom width
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: "BT Name",
              hintText: "Enter BT Name",
              keyboardType: TextInputType.text,
              width: 130.0,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: "BT Address",
              hintText: "Enter BT Address",
              keyboardType: TextInputType.text,
              width: 100.0,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: "Merchant ID",
              hintText: "Enter Merchant ID",
              keyboardType: TextInputType.text,
              width: 90.0,
            ),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: addData,
                child: Text("Save"),
            ),
            Container(
                color: Colors.red,
                width:MediaQuery.of(context).size.width,
                height:500,
                child: item_()),
            SizedBox(height: 100,),

          ],
        ),
      ),
    );
  }
}
