import 'package:flutter/material.dart';

final _formKey=GlobalKey<FormState>();

class ProductForm extends StatefulWidget {
  final String id;
  final String name;
  final String price1;
  final String quantity1;
  final String price2;
  final String quantity2;
  final String price3;
  final String quantity3;

  ProductForm(this.id, this.name,this.quantity1, this.price1,this.quantity2,this.price2,this.quantity3,this.price3);
  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 500,
      // color: Colors.grey,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0,3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.id,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                           color: Colors.black,
                          ),
                          textAlign: TextAlign.center,

                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0,3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.name,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,

                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        buildQuantityOption(widget.quantity1),
                        buildQuantityOption(widget.quantity2),
                        buildQuantityOption(widget.quantity3),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        buildQuantityOption(widget.price1),
                        buildQuantityOption(widget.price2),
                        buildQuantityOption(widget.price3),
                      ],
                    ),
                    SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Enable",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(15)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Disable",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(15)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Details",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(15)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQuantityOption(String quantity) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          quantity,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
