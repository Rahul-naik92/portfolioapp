import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  myAchieve(num, type) {
    return Row(
      children: [
        Text(
          num,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(type),
        )
      ],
    );
  }

  mySpec(icon, tech) {
    return Row(
      children: [
        Container(
          width: 105,
          height: 115,
          child: Card(
            margin: const EdgeInsets.all(0),
            color: const Color(0xff252525),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    tech,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: PopupMenuButton(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          icon: const Icon(Icons.menu),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: TextButton(
                child: const Text(
                  'Projects',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/project');
                },
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: TextButton(
                child: const Text(
                  'About Me',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
            )
          ],
        ),
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.38, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 35),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/myphoto.jpg',
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.49),
                child: Column(
                  children: const [
                    Text(
                      'Rahul Naik',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Flutter App Developer',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myAchieve("2", "Projects"),
                    myAchieve("2", "Cients"),
                    myAchieve("20", "Messages"),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Specialized In",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(FontAwesomeIcons.android, "Flutter"),
                        mySpec(FontAwesomeIcons.aws, "AWS"),
                        // mySpec(Icons.android, "Android"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(FontAwesomeIcons.linux, "Linux"),
                        mySpec(FontAwesomeIcons.docker, "Android"),
                        // mySpec(Icons.android, "Android"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(FontAwesomeIcons.subscript, "Scripting"),
                        mySpec(FontAwesomeIcons.linux, "Linux"),
                        // mySpec(Icons.android, "Android"),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
