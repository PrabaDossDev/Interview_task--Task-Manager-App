import 'package:interview_task/ui/widgets/shimmer_effect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/res/colors.dart';

class LoadingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        color: AppColor.white,
        child: Column(
          children: [
            ShimmerEffect(height:150,width:double.infinity,color: AppColor.secondaryBackground,margin:EdgeInsets.all(10.0),),
            ShimmerEffect(height:150,width:double.infinity,color: AppColor.secondaryBackground,margin:EdgeInsets.all(10.0),),
            ShimmerEffect(height:150,width:double.infinity,color: AppColor.secondaryBackground,margin:EdgeInsets.all(10.0),),
            ShimmerEffect(height:150,width:double.infinity,color: AppColor.secondaryBackground,margin:EdgeInsets.all(10.0),),
            ShimmerEffect(height:150,width:double.infinity,color: AppColor.secondaryBackground,margin:EdgeInsets.all(10.0),),
          ],
        ),
      ),
    );
  }

}

class CircularLoadingWidget extends StatelessWidget {
  final String? message;
  final bool allowPop;

  CircularLoadingWidget({this.message = "", this.allowPop = false});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(allowPop),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  message!,textScaleFactor: 1,
                  style: TextStyle(fontSize: 20),
                )
              ],
            )),
      ),
    );
  }
}
