import 'package:annapurna/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ngo extends StatefulWidget {
    static const String id = 'ngo';
  const ngo({super.key});

  @override
  State<ngo> createState() => _ngoState();
}

class _ngoState extends State<ngo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
     
    
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 25, left: 10, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: Icon(
                  //     Icons.arrow_back_ios_new,
                  //     color: Colors.white,
                  //     size: 26,
                  //   ),
                  // ),
                   Text("NGO REGISTERATION", style: TextStyle(color: Colors.white,
                   fontSize: 24),),
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 15, 5),
                  child: Container(
                   // backgroundColor: kGrey,
                   // radius: 200,
                    child: Image.asset(
                      "assets/images/ngo.png",
                      height: MediaQuery.of(context).size.height / 2.5,
                      fit: BoxFit.cover,
                    ),
                  )),
                  //  Text(
                  //   "Join us in building a better world for all",
                  //   style: TextStyle(color: Colors.white54, fontSize: 16),
                  // ),
                   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 15, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Join us in building a better world for all",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                       
                      ],
                    ),
                  ),
      
             
                ],
              ),
              SizedBox(height: 35,),
               Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                   
                       obscureText: true,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            borderSide: BorderSide(width: 1, color: kMustard),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              borderSide: const BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: Colors.white)),
                          labelText: 'Enter Email',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email can't be empty";
                            }
            
                            return null;
                          },
                         
                    ),
                  
                  ),
                  
             SizedBox(height: 50,),
             Container(
              
              width: 200,
              height: 50,
               margin: EdgeInsets.symmetric(horizontal: 90),
             

                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(onPressed: (){},
                      child: Text("Register",
                         style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        // fontWeight: FontWeight.normal
                      ),),
                      style: ButtonStyle(backgroundColor:
                       MaterialStateProperty.resolveWith((states) {
                         if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return kMustard;
                       }
                       ),
                         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: 
                         BorderRadius.circular(30))
                      ),
                        ),)
             
          )],
          ),
        )),
      ),
    
    );
  }
}