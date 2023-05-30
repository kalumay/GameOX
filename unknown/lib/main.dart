// ignore_for_file: no_leading_underscores_for_local_identifiers, empty_statements, prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Tik-Tac-Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

  

class _MyHomePageState extends State<MyHomePage> {
 bool oTurn= true;
 List<String> displayXO=['','','','','','','','','',];
 String resultDeclaration='';
 int oScore= 0;
 int xScore= 0;
 int filledBoxes= 0;
 bool winnerFound=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 215, 215),
      // appBar: AppBar(

      //   title: Text(widget.title),
      // ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
             Expanded(flex: 1,
              child: 
                Container(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Player O', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 253, 98, 52)),),
                        Text(oScore.toString(), style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 253, 98, 52)),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Player X', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 253, 98, 52)),),
                        Text(xScore.toString(), style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 253, 98, 52)),)
                      ],
                    ),
                  )]
                ),)
            ),
             Expanded(flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                itemBuilder:(BuildContext context, int index)
                 {
                  if(index>=0 && index< displayXO.length){
                      return GestureDetector(
                  onTap:(){
                   
                    if(!winnerFound && displayXO[index]=='')
                    { _tapped(index);  }
                  },
                  child: Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all (width: 5, color: Colors.orange), color: Colors.orangeAccent
                  ),
                  child: Center(
                    child: Text(displayXO[index],style: const TextStyle(color: Color.fromARGB(255, 244, 115, 76), fontStyle: FontStyle.normal, fontSize: 50, fontWeight: FontWeight.bold),),
                  ),),
                 );
                  }
                  return null;
                
                 }
                 ),
              ),
                       ),
             Expanded(flex: 1,
              child: 
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        resultDeclaration,
                        style: const TextStyle(fontSize: 30, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 253, 98, 52)),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ElevatedButton(style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16)), onPressed: _clearBoard, child: Text('Next Round')),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: ElevatedButton(style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16)) ,onPressed: _newGame, child: Text('New Game')),
                        ),
                        ],
                      )
                    ],
                  ),
                ),
            ),
           
            
          ],
        ),
      ),

    );
  }
  void _tapped(int index) {
  setState((){
if (oTurn && displayXO[index] == '' && index >= 0 && index < displayXO.length) {
  displayXO[index]='O';
  filledBoxes++;
}
else if(!oTurn && displayXO[index]==''){
  displayXO[index]='X';
  filledBoxes++;
}
oTurn= !oTurn;
_checkWinner();
_finalWinner();
  });
}

  void _checkWinner() {
    //first row
     if(displayXO[0]==displayXO[1] && displayXO[0]==displayXO[2] && displayXO[0]!='')
     {
      setState(() {
        resultDeclaration='Player '+ displayXO[0] +' Wins!';
        _updateScore(displayXO[0]);
    
      });
     }
     //2nd row
     if(displayXO[3]==displayXO[4] && displayXO[3]==displayXO[5] && displayXO[3]!='')
     {
      setState(() {
        resultDeclaration='Player '+ displayXO[3] +' Wins!';
        _updateScore(displayXO[3]);
    
      });
     }
     //3rd row
     if(displayXO[6]==displayXO[7] && displayXO[6]==displayXO[8] && displayXO[6]!='')
     {
      setState(() {
        resultDeclaration='Player '+ displayXO[6] +' Wins!';
        _updateScore(displayXO[6]);
    
      });
     }
     //1st column
     if(displayXO[0]==displayXO[3] && displayXO[0]==displayXO[6] && displayXO[0]!='')
     {
      setState(() {
        resultDeclaration='Player '+ displayXO[0] +' Wins!';
        _updateScore(displayXO[0]);
    
      });
     }
     //2nd column
     if(displayXO[1]==displayXO[4] && displayXO[1]==displayXO[7] && displayXO[1]!='')
     {
      setState(() {
        resultDeclaration='Player '+ displayXO[1] +' Wins!';
        _updateScore(displayXO[1]);
    
      });
     }
     //3rd column
     if(displayXO[2]==displayXO[5] && displayXO[2]==displayXO[8] && displayXO[2]!='')
     {
      setState(() {
        resultDeclaration='Player '+ displayXO[2] +' Wins!';
        _updateScore(displayXO[2]);
    
      });
     }
     //left diagonal
     if(displayXO[0]==displayXO[4] && displayXO[0]==displayXO[8] && displayXO[0]!='')
     {
      setState(() {
        resultDeclaration='Player '+ displayXO[0] +' Wins!';
        _updateScore(displayXO[0]);
    
      });
     }
     //right diagonal
     if(displayXO[2]==displayXO[4] && displayXO[2]==displayXO[6] && displayXO[2]!='')
     {
      setState(() {
        resultDeclaration='Player '+ displayXO[2] +' Wins!';
        _updateScore(displayXO[2]);
    
      });
     }
else if(filledBoxes==9 && winnerFound != true){
setState(() {
  resultDeclaration='Nobody Wins!';
});
  }
  }
  
  void _updateScore(String winner)
{
  if(winner== 'O'){
    oScore++;
  }
  else if(winner=='X'){
    xScore++;
  }
  winnerFound= true;
}


  void _clearBoard() {
    setState(() {
      for(int i=0; i<9; i++){
        displayXO[i]='';
      }
      resultDeclaration='';
    });
    filledBoxes=0;
    winnerFound=false;
  }

  void _newGame() {
    setState(() {
      oScore=0;
      xScore=0;
    });
    _clearBoard();
    winnerFound=false;
  }
  void _finalWinner(){
    setState(() {
      if(xScore==5){
        resultDeclaration='Player X is the Final Winner';
      }
     else if(oScore==5){
        resultDeclaration='Player O is the Final Winner';
      }
      if(oScore==5 || xScore==5){
        _newGame();
      }
    });
  }
  
  // _stop() {
  //   setState(() {
  //     for(int i=0;i<9;i++)
  //     {
  //     if ((displayXO[i]!='O'||displayXO[i]!='X')&& !winnerFound)
  //     {
  //       displayXO[i]='';

  //     }
  //     }
  //   });
  // }
}

