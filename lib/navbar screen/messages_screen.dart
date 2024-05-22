import 'package:flutter/material.dart';
import 'package:virtual_swaahth/screens/chat_screen.dart';


class MessagesScreen extends StatelessWidget {

  List imgs = [
      "download4.jpg",
      "doctor2.jpg",
      "doctor3.jpg",
      "doctor4.jpg",
      "download1.jpg",
      "download2.jpg",
      "download3.jpg",
    ];
    @override
    Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Message",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,

          ),
          ),
          ),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                ),
                const Icon(Icons.search,
                color: Colors.deepPurpleAccent,
                ),
              ],
            ),
          ),
          ),
          const SizedBox(height: 20), // for the bubble image circle
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // for managing in horizontally text
            child: Text(
              "Active Now",
            style:TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ) ,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: 7,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  width: 65,
                  height: 65,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Stack(
                    textDirection: TextDirection.rtl,
                    children: [
                      Center(child: Container(
                        height: 65,
                        width: 65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.asset("images/${imgs[index]}"),
                        ),
                      ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(4),  // margin position of small green dot
                        padding: const EdgeInsets.all(3),
                        height: 20,   // size of Available online circle
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                );

              }

          ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // for managing in horizontally text
            child: Text(
              "Recent Chat",
              style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ) ,
            ),
          ),
          const SizedBox(height: 10), // for below Active now size
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
          itemCount: 7,
          shrinkWrap: true,
          itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10), // padding between the chat feild of doctor
                  child: ListTile(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatScreen(),  // call ChatScreen from here////////////////////////////////////////////////////////////////
                          ));
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        "images/${imgs[index]}",
                      ),
                    ),
                    title: const Text(
                      "Dr Mohit Rathod",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      "Hello, Doctor are you there?",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    trailing: const Text("12:30",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),),
                  ),
                );
          },),


        ],
      ),
    );
  }
}