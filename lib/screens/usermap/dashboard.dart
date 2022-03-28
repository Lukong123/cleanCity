import 'package:cleancity/screens/usermap/map_trash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Locate TrashCans"),
        centerTitle: true,
        backgroundColor: HexColor("#1565C0"),
      ),
      body:Column(
        children: [
          Container(
            height: 120,
            child: PageView.builder(
              itemBuilder: (_, index){
                return Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0,5),
                      )
                    ]),
                  child: Column(
                    children:<Widget> [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text("Go To Trash_01",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          ),
                          ElevatedButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                              return  MapTrash();
                            })
                            );
                          }, child: Text("Map")
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],

                  ),

                );
              }
            ),
          ),
          Container(
            height: 120,
            child: PageView.builder(
                itemBuilder: (_, index){
                  return Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0,5),
                          )
                        ]),
                    child: Column(
                      children:<Widget> [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text("Go To Trash_02",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            ElevatedButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                return  MapTrash();
                              })
                              );
                            }, child: Text("Map")
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],

                    ),

                  );
                }
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Map",
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return  MapTrash();
          })
          );
        },
        child: Text("Map"),
        backgroundColor: HexColor("#1565C0"),
      ),
    );
  }
}
/*
Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:const <Widget> [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Welcome to clean City",
            style: TextStyle(
              fontSize: 20,
            ),),
          ),
        ],
      )

      /
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return  MapTrash();
                    })
                    );
                  }, child: Text("Trash Map"))
                ],
              ),
            ),
          ),
        ],
      ),

 */