import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routePath = '/home';
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 237, 237),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    '406, Skyline Park Date, MM Road...',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.green,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  'https://media.gettyimages.com/id/1704221597/vector/green-energy-banner-design-vector-illustration-environment-renewable-energy-clean-energy.jpg?s=612x612&w=gi&k=20&c=rWUhYIUQfsvOgNLCZr55gMtcmDx2MZ3OH-8bwsepugo=',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                    8), // Adjust the border radius to make the container rounded
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Adjust shadow color and opacity
                    spreadRadius: 1, // Adjust spread radius
                    blurRadius: 2, // Adjust blur radius
                    offset: const Offset(
                        0, 1), // Adjust shadow position [horizontal, vertical]
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for a service',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 174, 175, 175)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          const Color.fromARGB(255, 1, 124, 5).withOpacity(0.8),
                          const Color.fromARGB(255, 0, 255, 8),
                        ],
                      ),
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Available Service'),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // for (int i = 0; i < 4; i++)
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('assets/images/leaf.png'),
                        ),
                        const SizedBox(height: 5),
                        Text('cleaning')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
