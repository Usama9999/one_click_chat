import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'configSize.dart';


class PhoneOrEmail extends StatefulWidget {
  const PhoneOrEmail({Key? key}) : super(key: key);

  @override
  _PhoneOrEmailState createState() => _PhoneOrEmailState();
}

class _PhoneOrEmailState extends State<PhoneOrEmail> {
  _launchURL(String no,String msg) async {
    var url = "https://wa.me/923$no?text=$msg";
    await launch(url);
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    final NoController = new TextEditingController();
    final MessageController = new TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 3.76*ConfigSize.heightMultiplier,horizontal:7.65*ConfigSize.paddingWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: 2.51*ConfigSize.heightMultiplier,),
                new Text("You can chat without Saving contacts.",style: Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,),
                new Text("Enter phone number and text message below",style: Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,),
                SizedBox(height: 6.28*ConfigSize.heightMultiplier,),
                new Form(
                  key: _formKey,
                    child: new Column(
                      children: [
                        Container(
                          width: 84.18 * ConfigSize.paddingWidth,
                          child: TextFormField(
                            controller: NoController,
                            maxLength:9,
                            decoration:InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:Theme.of(context).primaryColor,
                                      width: 2
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 10,bottom: 2.1),
                                  child: new Text('+923',style: TextStyle(
                                      fontSize: 16
                                  ),),
                                ),
                                prefixIconConstraints: BoxConstraints(minHeight: 0,minWidth:0),
                                // prefix: new Text('+92 ',style: TextStyle(
                                //   color: Colors.black
                                // ),),
                                isDense: false,
                                fillColor: Theme.of(context).scaffoldBackgroundColor,
                                hintText: '001234567',
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.13 * ConfigSize.heightMultiplier, horizontal: 5.10*ConfigSize.paddingWidth)),
                            validator: (value) {
                              if (value!.isEmpty || value.length >11)
                                return "invalid input";
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        Container(
                          width: 84.18 * ConfigSize.paddingWidth,
                          child: TextFormField(
                            controller: MessageController,
                            decoration:InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:Theme.of(context).primaryColor,
                                      width: 2
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                hintText: 'your message (optional)',
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.13 * ConfigSize.heightMultiplier, horizontal: 5.10*ConfigSize.paddingWidth)),
                          ),
                        ),

                      ],
                    )

                ),
                SizedBox(height: 2.51*ConfigSize.heightMultiplier,),
                GestureDetector(
                    onTap: (){
                      if(_formKey.currentState!.validate())
                        {
                          _launchURL(NoController.text,MessageController.text);
                        }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 6 * ConfigSize.heightMultiplier,
                      width: 84.18 * ConfigSize.paddingWidth,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0,2),
                                blurRadius: 2,
                                spreadRadius: 1
                            )
                          ]
                      ),
                      child: new Text(
                       'Click to Chat',
                        style: TextStyle(
                            color: Theme.of(context).selectedRowColor,
                            fontSize: 3 * ConfigSize.textMultiplier),
                      ),
                    ),
                ),
                SizedBox(height: 20,),
                new Text("Developer : Usama Shahbaz",style: Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,),
                new Text("Contact : 0322 4868688",style: Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
