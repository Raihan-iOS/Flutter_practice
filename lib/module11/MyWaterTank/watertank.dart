import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:widget_app_structure/module11/MyWaterTank/widget/water_add_btn.dart';

class Watertank extends StatefulWidget {
  const Watertank({super.key});
  // Example current volume in liters
  // Example capacity in liters

  @override
  State<Watertank> createState() => _WatertankState();
}

class _WatertankState extends State<Watertank> {
  final int tankCapacity = 3000;
  int _currentVolume = 200;

  double convertVolumeAndNormalized(int value, {bool toNormalized = true}) {
    if (toNormalized) {
      if (value <= 0) return 0.0;
      if (value >= tankCapacity) return 1.0;
      return value / tankCapacity;
    } else {
      if (value <= 0) return 0.0;
      if (value >= 1) return tankCapacity.toDouble();
      return value * tankCapacity.toDouble();
    }
  }

  double convertVolumeToHeight(int maxHeight) {
    double volume = _currentVolume.toDouble().clamp(0, tankCapacity.toDouble());
    return (volume / tankCapacity) * maxHeight;
  }

  void updateWaterLevel(int amount) {
    setState(() {
      _currentVolume = (_currentVolume + amount).clamp(0, tankCapacity);
    });
  }

  @override
  Widget build(BuildContext context) {
    var colorBasedonWaterLabel =
        _currentVolume >= 2000
            ? const Color.fromARGB(255, 2, 116, 209)
            : (_currentVolume <= 800
                ? Colors.red
                : const Color.fromARGB(255, 49, 159, 248));

    return Scaffold(
      appBar: AppBar(title: const Text('Water Tank')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 232, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: colorBasedonWaterLabel,
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: const Offset(
                          0,
                          1,
                        ), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 300,
                  width: 300,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        height: convertVolumeToHeight(300),

                        child: ClipRect(
                          child: OverflowBox(
                            maxHeight: 300,
                            alignment: Alignment.topCenter,

                            child: SizedBox(
                              height: 300,
                              width: 300,
                              child: Lottie.asset(
                                'asset/wave.json',
                                fit: BoxFit.fill,
                                repeat: true,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //! Foreground View
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Water Level : ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 0, 36, 66),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '$_currentVolume / $tankCapacity ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 0, 36, 66),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: CircularProgressIndicator(
                                  value: convertVolumeAndNormalized(
                                    _currentVolume,
                                  ), // Example value, adjust as needed
                                  strokeWidth: 10,
                                  backgroundColor: Colors.white,
                                  color: colorBasedonWaterLabel,
                                ),
                              ),
                              Text(
                                '${(_currentVolume / tankCapacity * 100).toInt()}%',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: colorBasedonWaterLabel,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Set width to infinity
                ),
                SizedBox(height: 40),
                Slider(
                  value: _currentVolume.toDouble(),
                  min: 0,
                  max: tankCapacity.toDouble(),
                  divisions: 100,
                  label: _currentVolume.toStringAsFixed(0),
                  onChanged: (double newValue) {
                    setState(() {
                      _currentVolume = newValue.toInt();
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '0 L',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 1, 69, 129),
                      ),
                    ),
                    Text(
                      '$tankCapacity L',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 1, 69, 129),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Wrap(
                  runSpacing: 0,
                  children: [
                    waterAddButton(
                      waterAmount: 100,
                      waterIcon: Icons.water_drop,
                      onPressed: () {
                        updateWaterLevel(500);
                      },
                    ),
                    waterAddButton(
                      waterAmount: 500,
                      waterIcon: Icons.water,
                      onPressed: () {
                        updateWaterLevel(500);
                      },
                    ),
                    waterAddButton(
                      waterAmount: 1000,
                      waterIcon: Icons.water_damage,
                      onPressed: () {
                        updateWaterLevel(1000);
                      },
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          updateWaterLevel(-_currentVolume);
                        },
                        child: Text('Reset Water Level'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
