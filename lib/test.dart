import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task/horoscope_model.dart';

enum HoroscopePeriod {
  daily,
  monthly,
  yearly,
}

extension HoroscopePeriodExtension on HoroscopePeriod {
  String get displayName {
    switch (this) {
      case HoroscopePeriod.daily:
        return 'Daily';
      case HoroscopePeriod.monthly:
        return 'Monthly';
      case HoroscopePeriod.yearly:
        return 'Yearly';
    }
  }
}

class HoroscopeScreen extends StatefulWidget {
  const HoroscopeScreen({super.key});

  @override
  State<HoroscopeScreen> createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> {
  int _selectedHoroscopeIndex = 0;
  HoroscopePeriod _selectedPeriod = HoroscopePeriod.daily;

  final List<Horoscope> _horoscopes = [
    Horoscope(
      name: 'Mesh',
      dateRange: 'Mar 21 - Apr 19',
      imagePath: 'assets/mesh.png',
      details:
          'Lorem ipsum dolor sit amet consectetur. Augue sit molestie tellus sed ullamcorper curabitur. Laoreet accumsan eu tortor nisl pharetra. Pellentesque vivamus vitae sit turpis consectetur amet nisi ut. Vel pulvinar condimentum vel nisi ultricies. Imperdiet ut faucibus massa eu pellentesque nibh scelerisque felis. Nullam odio pretium tincidunt bibendum venenatis fringilla mauris sapien faucibus. Sed nullam velit ultrices feugiat. Blandit ipsum adipiscing viverra pulvinar dolor. Scelerisque ipsum lectus facilisis diam et at amet turpis. Ut platea proin mauris faucibus. Maecenas quisque neque dapibus libero. Ac tellus accumsan cras ac non eget bibendum dolor nulla. Dictum senectus in ullamcorper massa maecenas condimentum. Mattis egestas ornare nunc aenean placerat in adipiscing diam. Sit sed nulla risus et turpis sagittis donec et pellentesque. Egestas risus ut massa pretium nunc volutpat eget sed. Ornare morbi interdum arcu elit fringilla tincidunt accumsan feugiat. A et lectus maecenas integer feugiat lectus et neque fames. Commodo nisi et dui diam ipsum sed consectetur. A posuere vestibulum quam arcu dictum erat tempus. Sit fusce vitae platea vel egestas in dictum gravida dignissim. Scelerisque lorem consequat viverra nec libero id nulla eros. Quis m.',
    ),
    Horoscope(
      name: 'Vrish',
      dateRange: 'Apr 20 - May 20',
      imagePath: 'assets/vrish.png',
      details: 'Lorem ipsusasang elit...',
    ),
    Horoscope(
      name: 'Mithun',
      dateRange: 'May 21 - Jun 20',
      imagePath: 'assets/images/mithun.png',
      details:
          'Lorem ipsum dolor sit amet consectetur. Augue sit molestie tellus sed ullamcorper curabitur. Laoreet accumsan eu tortor nisl pharetra. Pellentesque vivamus vitae sit turpis consectetur amet nisi ut. Vel pulvinar condimentum vel nisi ultricies. Imperdiet ut faucibus massa eu pellentesque nibh scelerisque felis. Nullam odio pretium tincidunt bibendum venenatis fringilla mauris sapien faucibus. Sed nullam velit ultrices feugiat. Blandit ipsum adipiscing viverra pulvinar dolor. Scelerisque ipsum lectus facilisis diam et at amet turpis. Ut platea proin mauris faucibus. Maecenas quisque neque dapibus libero. Ac tellus accumsan cras ac non eget bibendum dolor nulla. Dictum senectus in ullamcorper massa maecenas condimentum. Mattis egestas ornare nunc aenean placerat in adipiscing diam. Sit sed nulla risus et turpis sagittis donec et pellentesque. Egestas risus ut massa pretium nunc volutpat eget sed. Ornare morbi interdum arcu elit fringilla tincidunt accumsan feugiat. A et lectus maecenas integer feugiat lectus et neque fames. Commodo nisi et dui diam ipsum sed consectetur. A posuere vestibulum quam arcu dictum erat tempus. Sit fusce vitae platea vel egestas in dictum gravida dignissim. Scelerisque lorem consequat viverra nec libero id nulla eros. Quis m',
    ),
    Horoscope(
      name: 'Mesh',
      dateRange: 'Mar 21 - Apr 19',
      imagePath: 'assets/mesh.png',
      details: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    Horoscope(
      name: 'Vrish',
      dateRange: 'Apr 20 - May 20',
      imagePath: 'assets/vrish.png',
      details: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    Horoscope(
      name: 'Mithun',
      dateRange: 'May 21 - Jun 20',
      imagePath: 'assets/images/mithun.png',
      details: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    // Add more horoscopes here
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff0D1641),
      appBar: AppBar(
        title: const Text(
          "Horoscope",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Divider(
            thickness: 0.5,
          ),
          //  .............Tab bar for Horoscope .............//
          _horoScopeTab(),
          const Divider(
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: HoroscopePeriod.values.map((period) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: _selectedPeriod == period
                          ? const Color(0xffE4A003)
                          : Colors.white54,
                      width: 1.2,
                    ),
                    backgroundColor: _selectedPeriod == period
                        ? const Color.fromARGB(255, 94, 58, 44)
                        : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedPeriod = period;
                    });
                  },
                  child: Text(
                    period.displayName,
                    style: TextStyle(
                      color: _selectedPeriod == period
                          ? Colors.white
                          : Colors.white54,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _horoScopeContent(
                _horoscopes[_selectedHoroscopeIndex], _selectedPeriod),
          ),
        ],
      ),
    );
  }

//  Horoscope Top tab bar
  Widget _horoScopeTab() {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _horoscopes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedHoroscopeIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _horoscopes[index].name,
                    style: TextStyle(
                      color: _selectedHoroscopeIndex == index
                          ? Colors.white
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    height: 2.0,
                    width: 20.0,
                    color: _selectedHoroscopeIndex == index
                        ? const Color(0xffFE4A00)
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _horoScopeContent(Horoscope horoscope, HoroscopePeriod period) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 40),
                    child: Image.asset(
                      fit: BoxFit.contain,
                      horoscope.imagePath!,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.photo);
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom:
                      -20, // Adjust this value to position the small circle correctly
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffE10000),
                            Color(0xffE4A003),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        fit: BoxFit.contain,
                        "assets/images/m1.png",
                        scale: 1.4,
                      )),
                ),
              ],
            ),
          ),
          Text(
            horoscope.name,
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const SizedBox(height: 5.0),
          Text(
            horoscope.dateRange,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                period.displayName,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const Text(
                "07/12/2024",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Divider(
            color: Color(0xffE4A003),
          ),
          Text(
            horoscope.details,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
