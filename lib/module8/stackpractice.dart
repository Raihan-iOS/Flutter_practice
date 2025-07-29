import 'package:flutter/material.dart';

class StackPractice extends StatefulWidget {
  const StackPractice({super.key});

  @override
  State<StackPractice> createState() => _StackPracticeState();
}

class _StackPracticeState extends State<StackPractice> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Practice'),
      ),
      body: progresbarDetails()
    );
  }


Container progresbarDetails(){
  return Container(
        color: Colors.white,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🔵 Stack with background + animated foreground
              Stack(
                children: [
                  Container(
                    height: 5,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 3),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    height: 5,
                    width: _toggled ? 400 : 0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
                const SizedBox(height: 20),
               
                const SizedBox(height: 20),
             TweenAnimationBuilder(tween: Tween(begin: 0.0, end: _toggled ? 1.0 : 0.0), duration: const Duration(seconds: 3), builder: (context, double value, _) {
             return Column(
              children: [
                LinearProgressIndicator(
                  backgroundColor:Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation(Colors.blue),
                  value: value,
                ),
                const SizedBox(height: 20),
              SizedBox(
              height: 100,
              width: 100,
               child: CircularProgressIndicator(
               
                     backgroundColor:Colors.grey[300],
                     valueColor: const AlwaysStoppedAnimation(Colors.blue),
                     value: value,
                    strokeWidth: 5,
                      ),
             )

              ],
             );
             
              
             
             }),
              const SizedBox(height: 20),

              // 🔘 Button placed separately
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _toggled = !_toggled;
                  });
                },
                child: const Text('Tap me'),
              ),
            ],
          ),
        ),
      );
}

  Stack stackDetails() {
    return Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent.shade200,
                      ),
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 20,
                    child: Container(
                        height: 30,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 12,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Hello',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 10),
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                    left: 0,
                    right: 0, 
                    bottom: 0,
                    top: 0,

                    child: Center(
                      child: Stack(
                        children: [
                          const Positioned(
                        
                          child: CircleAvatar(
                              radius: 80,
                              foregroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7oMra0QkSp_Z-gShMOcCIiDF5gc_0VKDKDg&s')),
                        
                      ),
                      Positioned(
                        right: 16,
                        top: 0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green,
                            border: Border.all(width: 4, color: Colors.white)
                          ),
                        ),
                      )
                        ],
                      ),
                    ),
                  )
                ],
              );
  }

  GridView cardGridviewBuild() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return cardForList(index);
        });
  }

  Card cardForList(int index) {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        color: Colors.red,
        shadowColor: Colors.blue,
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone_android,
              size: 50,
              color: Colors.white,
            ),
            Text(
              'Hello $index',
              style: const TextStyle(color: Colors.white),
            )
          ],
        ));
  }

  GridView cardGridVIewCount() {
    return GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(
            20,
            (index) => const Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Colors.red,
                shadowColor: Colors.blue,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      'Hello',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ))));
  }

  GridView gridWithListGenerate() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(
          20,
          (index) => Container(
                color: Colors.primaries[index % Colors.primaries.length],
              )),
    );
  }

  GridView gridCount() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.purple,
        ),
        Container(
          color: Colors.orange,
        ),
      ],
    );
  }
}
