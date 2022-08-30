import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 247, 246),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Image.asset('assets/logo.png'),
            ),
            const Text('Login',
                style: TextStyle(
                    color: Color(0xFF4b73ac),
                    fontWeight: FontWeight.bold,
                    fontSize: 36)),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            const SizedBox(height: 35),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(45)),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  if (emailController.value.text.isNotEmpty &&
                      passwordController.value.text.isNotEmpty) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SessionSelectionPage(),
                        ));
                  }
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF4b73ac))),
                child: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SessionSelectionPage extends StatefulWidget {
  const SessionSelectionPage({Key? key}) : super(key: key);

  @override
  State<SessionSelectionPage> createState() => _SessionSelectionPageState();
}

class _SessionSelectionPageState extends State<SessionSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4b73ac),
        title: const Text('Select Session'),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      ),
      body: ListView(
        children: const [
          SessionTile(FontAwesomeIcons.userGraduate, null,
              'Life after graduation', 'Mohamed Eslam', 'Mon 8/1/2022'),
          SessionTile(FontAwesomeIcons.userGraduate, null,
              'Life after graduation', 'Roaa Reda', 'Mon 8/8/2022'),
          SessionTile(null, 'assets/Background.png', 'Problem solving', 'Dana',
              'Wed 10/8/2022'),
          SessionTile(null, 'assets/Background.png', 'Problem solving',
              'Roaa Koraim', 'Sun 14/8/2022'),
          SessionTile(null, 'assets/ui-ux.png', 'UX-UI design', 'Asmaa',
              'Mon 15/8/2022'),
          SessionTile(null, 'assets/android.png', 'Mobile front-end',
              'Roaa koriam', 'Tue 16/8/2022'),
          SessionTile(null, 'assets/web.png', 'Web front-end', 'Mostafa',
              'Wed 17/8/2022'),
          SessionTile(null, 'assets/python.png', 'Backend (python)', 'Dana',
              'Sat 20/8/2022'),
          SessionTile(null, 'assets/graph.png', 'Business Analysis',
              'Roaa reda', 'Mon 22/8/2022'),
        ],
      ),
    );
  }
}

class SessionTile extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String? sessionTitle;
  final String? sessionInstructor;
  final String? sessionDate;

  const SessionTile(this.icon, this.image, this.sessionTitle,
      this.sessionInstructor, this.sessionDate,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFF4b73ac),
          child: image == null
              ? FaIcon(icon)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(image!),
                  ),
                ),
        ),
        title: Text(sessionTitle!),
        subtitle: Text(sessionInstructor!),
        trailing: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeedBackPage(
                      sessionInstructor, sessionTitle, sessionDate),
                ));
          },
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 12,
          ),
        ));
  }
}

class FeedBackPage extends StatefulWidget {
  final String? instructor;

  final String? session;

  final String? date;

  const FeedBackPage(
    this.instructor,
    this.session,
    this.date, {
    Key? key,
  }) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  String firstIndexValue = 'yes';
  String secondIndexValue = 'yes';
  String thirdIndexValue = 'yes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              color: Color(0xFF4b73ac),
            ),
            height: MediaQuery.of(context).size.height * 0.20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (() => Navigator.pop(context)),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 10,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Session',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.session!,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(widget.date!,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(widget.instructor!,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.77,
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 27),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Is the content simple?',
                      style: TextStyle(
                          color: Color(0xFF4b73ac),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                RadioListTile(
                  value: 'yes',
                  groupValue: firstIndexValue,
                  onChanged: (String? val) {
                    setState(() {
                      firstIndexValue = val.toString();
                    });
                  },
                  title: const Text('yes'),
                ),
                RadioListTile(
                  value: 'No',
                  groupValue: firstIndexValue,
                  onChanged: (String? val) {
                    setState(() {
                      firstIndexValue = val.toString();
                    });
                  },
                  title: const Text('No'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 27),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'If no, please say why?',
                      style: TextStyle(
                          color: Color(0xFF4b73ac),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 5, color: Color(0xFF4b73ac)))),
                    maxLines: 3,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 27),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Is there a practical part during the session?',
                      style: TextStyle(
                          color: Color(0xFF4b73ac),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                RadioListTile(
                  value: 'yes',
                  groupValue: secondIndexValue,
                  onChanged: (String? val) {
                    setState(() {
                      secondIndexValue = val.toString();
                    });
                  },
                  title: const Text('yes'),
                ),
                RadioListTile(
                  value: 'No',
                  groupValue: secondIndexValue,
                  onChanged: (String? val) {
                    setState(() {
                      secondIndexValue = val.toString();
                    });
                  },
                  title: const Text('No'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 27),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Have all questions been answered?',
                      style: TextStyle(
                          color: Color(0xFF4b73ac),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                RadioListTile(
                  value: 'yes',
                  groupValue: thirdIndexValue,
                  onChanged: (String? val) {
                    setState(() {
                      thirdIndexValue = val.toString();
                    });
                  },
                  title: const Text('yes'),
                ),
                RadioListTile(
                  value: 'No',
                  groupValue: thirdIndexValue,
                  onChanged: (String? val) {
                    setState(() {
                      thirdIndexValue = val.toString();
                    });
                  },
                  title: const Text('No'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 27),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'How to improve our session',
                      style: TextStyle(
                          color: Color(0xFF4b73ac),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 5, color: Color(0xFF4b73ac)))),
                    maxLines: 3,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF4b73ac))),
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
