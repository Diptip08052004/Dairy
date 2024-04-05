import 'package:dairy/Admin_pannel/Info.dart';
import 'package:dairy/Room_Database/Database.dart';
import 'package:dairy/Room_Database/product.dart';
import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool isLoading=false;
  List<Product>p=[];

  Future<void>getAllProducts()async{
    setState(() =>isLoading=true);
    p=await RoomDatabase.instance.readAllProduct();
    print(p);
    setState(() =>isLoading=false);
  }

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  @override
  void dispose(){
    RoomDatabase.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Center(child: CircularProgressIndicator(),):
          _buildList(),
    );
  }
  Widget _buildList(){
    return ListView.builder(
      itemCount: p.length,
        itemBuilder: (context,index){
        final list=p[index];
        print(Information(p:list));
        return Information(p:list);
        }
    );
  }
}