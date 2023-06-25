import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE6E4E0),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text(
                  'BOOK\nNEW\nFLIGHTS',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0x99262724),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        foregroundImage: Image.network(
                          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
                        ).image,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Row(
                      children: <Widget>[
                        Text(
                          'Surabaya',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 4.0),
                        Icon(
                          Icons.airplanemode_active_rounded,
                          color: Color(0xff262724),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            const FlightButton(
              title: 'Jakarta, Indonesia',
              shortTitle: 'JKT',
            ),
            const SizedBox(height: 8.0),
            const FlightButton(
              title: 'Surabaya, Indonesia',
              shortTitle: 'SUB',
              isDeparture: true,
            ),
            const SizedBox(height: 8.0),
            const Material(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
                bottom: Radius.circular(4.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TileText(
                      title: 'Return',
                      tileName: 'One Way',
                    ),
                    TileText(
                      title: 'Class',
                      tileName: 'BUSINESS',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 1.0),
            const Material(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TileText(
                      title: 'Date',
                      tileName: 'JUL 26, 2023',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 1.0),
            Material(
              color: const Color(0xffFFFFFF),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16.0),
                top: Radius.circular(4.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TileText(
                      title: 'Persons',
                      tileName: '0$counter',
                      showDropdownArrow: false,
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: const Color(0xffE6E4E0),
                      elevation: 0.0,
                      key: const Key('decrement'),
                      onPressed: () {
                        setState(() {
                          if (counter == 1) return;
                          counter--;
                        });
                      },
                      child: const Icon(
                        Icons.remove_rounded,
                        color: Color(0xff262724),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    FloatingActionButton(
                      backgroundColor: const Color(0xffE6E4E0),
                      elevation: 0.0,
                      key: const Key('increment'),
                      onPressed: () {
                        setState(() {
                          if (counter == 9) return;
                          counter++;
                        });
                      },
                      child: const Icon(
                        Icons.add_rounded,
                        color: Color(0xff262724),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xffF3BD54),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'SEARCH FLIGHTS',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff262724),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0xff262724),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TileText extends StatelessWidget {
  const TileText({
    super.key,
    required this.tileName,
    required this.title,
    this.showDropdownArrow = true,
  });

  final String title;
  final String tileName;
  final bool showDropdownArrow;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: <Widget>[
            Text(
              tileName,
              style: const TextStyle(
                color: Color(0xff262724),
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            if (showDropdownArrow) ...const <Widget>[
              SizedBox(width: 4.0),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xff262724),
                size: 24.0,
              ),
            ]
          ],
        ),
      ],
    );
  }
}

class FlightButton extends StatelessWidget {
  const FlightButton({
    super.key,
    required this.shortTitle,
    required this.title,
    this.isDeparture = false,
  });

  final String title;
  final String shortTitle;
  final bool isDeparture;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff262724),
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xffE6E4E0),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    shortTitle,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffE6E4E0),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    isDeparture
                        ? Icons.luggage_rounded
                        : Icons.airplanemode_active_rounded,
                    color: const Color(0xffE6E4E0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
