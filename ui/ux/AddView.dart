
import 'package:flutter/material.dart';


class AddView extends StatefulWidget {
  AddView({Key key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins=["bitcoin","tether","dogecoin"];
  String dropdownvalue="bitcoin";
  TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(children: [
         DropdownButton(value: dropdownvalue, //DropDown Button 
         onChanged: (String value){
           setState(() {
                        dropdownvalue = value;
                      });
         },
         items: coins.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
         ),
         Container(width: MediaQuery.of(context).size.width/1.3,child: TextFormField(controller: _amountController,
            decoration: InputDecoration(labelText:"Coin Amount",labelStyle:TextStyle(color: Colors.blue)),
              keyboardType: TextInputType.text, ),
              
            ), Container(
               width: MediaQuery.of(context).size.width/1.4,
               height: 42,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color:Colors.white,),
               child: MaterialButton(onPressed: ()async{
                    Navigator.of(context).pop();    //Firestor method for adding
               },
               child: Text("Add"),),

             )
       ],),
    );
  }
}
