import 'package:flutter/cupertino.dart';

const String productTable='productinfo';

class ProductFields{
  static final List<String>values=[
    id,
    name,
    mbno,
    MerchantID,
    BTname,
    BTadd,
    mode,
  ];

  static const id='id';
  static const name='name';
  static const mbno='mbno';
  static const MerchantID='MerchantID';
  static const BTname='BTname';
  static const BTadd='BTadd';
  static const mode='mode';
}

@immutable
class Product{
 final int? id;
 final String name;
 final String mbno;
 final String MerchantID;
 final String BTname;
 final String BTadd;
 final bool mode;

 const Product({
   this.id,
   required this.name,
   required this.mbno,
   required this.MerchantID,
   required this.BTname,
   required this.BTadd,
   required this.mode,
});

 Product copy({
   int? id,
   String? name,
   String? mbno,
   String? MerchantID,
   String? BTname,
   String? BTadd,
   bool? mode,
 })=>
     Product(
         id: id ?? this.id,
         name: name ?? this.name,
         mbno: mbno ?? this.mbno,
         MerchantID: MerchantID ?? this.MerchantID,
         BTname: BTname ?? this.BTname,
         BTadd: BTadd?? this.BTadd,
         mode: mode?? this.mode,
     );

  Map<String,dynamic>toMap(){
    return <String,dynamic>{
      ProductFields.id:id,
      ProductFields.name:name,
      ProductFields.mbno:mbno,
      ProductFields.MerchantID:MerchantID,
      ProductFields.BTname:BTname,
      ProductFields.BTadd:BTadd,
      ProductFields.mode:mode?1:0,
    };
  }
 factory Product.fromMap(Map<String,dynamic>map){
    return Product(
      id: map[ProductFields.id]!=null? map[ProductFields.id] as int:null,
      name: map[ProductFields.name]as String,
      mbno: map[ProductFields.mbno]as String,
      MerchantID: map[ProductFields.MerchantID]as String,
      BTname: map[ProductFields.BTname]as String,
      BTadd: map[ProductFields.BTadd]as String,
      mode: map[ProductFields.mode]==1,
    );
 }
}