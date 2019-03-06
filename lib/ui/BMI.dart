import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BMIState();
}

class BMIState extends State<BMI> {

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();

  double _bmi = 0.0;
  double _weight = 0.0;
  double _height = 0.0;
  double _finalResult = 0.0;
  String _formattedString;
  void _calculateWeight(){

    _weight = double.parse(_weightController.text);
    _height = double.parse(_heightController.text);
    if(_weightController.text.isNotEmpty){
        _bmi = _weight / (_height * _height) ;
      }
    setState(() {
      
      _finalResult = _bmi;
      if(_finalResult <18.5){
        _formattedString = 'Underweight';
      }
      if( _finalResult >18.5 && _finalResult <24.9){
        _formattedString = 'Normal';
      }

      if( _finalResult >25 && _finalResult <29.9){
        _formattedString = 'Overweight';
      }

      if( _finalResult >30 ){
        _formattedString = 'Obese';
      }
    });
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text("BMI")),
        
        backgroundColor: Colors.pinkAccent,
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
              child: new Container(
          alignment: Alignment.center,
          child: new ListView(
            padding: const EdgeInsets.all(3.0),
            children: <Widget>[
              new Image.asset('images/bmilogo.png',
              height: 130.0,
              width: 200.0,
              ),

              new Container(
                alignment: Alignment.center,
                // color: Colors.grey,
                padding: const EdgeInsets.symmetric(
                        vertical: 15.0, 
                        horizontal: 10.0
                        ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.orange,
                      // autofocus: true,
                      decoration: new InputDecoration(
                        labelText: 'Age',
                        hintText: 'Enter your age',
                        icon: Icon(Icons.person_outline),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),

                    new TextField(
                      controller: _weightController,
                      cursorColor: Colors.orange,
                      keyboardType: TextInputType.number,
                      // autofocus: true,
                      decoration: new InputDecoration(
                        labelText: 'Weight',
                        hintText: 'Enter your weight in Kgs',
                        icon: Icon(Icons.scatter_plot),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),

                    new TextField(
                      controller: _heightController,
                      cursorColor: Colors.orange,
                      keyboardType: TextInputType.number,
                      // autofocus: true,
                      decoration: new InputDecoration(
                        labelText: 'Height',
                        hintText: 'Enter your height in meters ( 1 m = 100 cm )',
                        icon: Icon(Icons.person_outline),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),

                    RaisedButton(
                      onPressed: () {
                        _calculateWeight();
                        FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      child: new Text("Calculate"),
                      color: Colors.pinkAccent,
                    ),
                    
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),

                    new Text(
                      _ageController.text.isEmpty? "" : ' Your BMI is: ${_finalResult.toStringAsFixed(1)}' ,
                      style: new TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.lightBlue,
                      ),
                    ),

                    new Text(
                      _ageController.text.isEmpty? "" : '$_formattedString' ,
                      style: new TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}