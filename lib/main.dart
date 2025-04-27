import 'package:flutter/material.dart';

void main() {
  runApp(const HabitTimerApp());
}

class HabitTimerApp extends StatelessWidget {
  const HabitTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimal Habit Timer',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: Colors.green.shade50,
      ),
      home: const HabitTimerHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HabitTimerHomePage extends StatefulWidget {
  const HabitTimerHomePage({super.key});

  @override
  State<HabitTimerHomePage> createState() => _HabitTimerHomePageState();
}

class _HabitTimerHomePageState extends State<HabitTimerHomePage> {
  List<bool> completedDays = List<bool>.filled(21, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('21 Day Habit Challenge'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Tap each day when you complete your habit!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(21, (index) {
                  final isCompleted = completedDays[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        completedDays[index] = !completedDays[index];
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: isCompleted ? Colors.green : Colors.white,
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Day ${index + 1}',
                          style: TextStyle(
                            color: isCompleted ? Colors.white : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
