import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:foot/core/theming/colors.dart';

class CongratulationsView extends StatefulWidget {
  final VoidCallback onNextLevel; // Callback to handle going to the next level

  const CongratulationsView({super.key, required this.onNextLevel});

  @override
  State<CongratulationsView> createState() => _CongratulationsViewState();
}

class _CongratulationsViewState extends State<CongratulationsView> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container
        (
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Confetti Effect
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              colors: [Colors.red, Colors.green, Colors.blue, Colors.yellow],
            ),

            // Main Content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "🎉 Congratulations! 🎉",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "You've completed this level.\nAre you ready for the next challenge?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: widget.onNextLevel,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    backgroundColor: ColorsManager.mainBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Next Level",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
