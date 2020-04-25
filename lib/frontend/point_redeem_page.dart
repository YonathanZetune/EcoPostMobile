import 'package:EcoPost/utilities/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PointRedeemPage extends StatelessWidget {
  ConfettiController _controllerCenter =
      ConfettiController(duration: const Duration(seconds: 10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.themeGreen,
        title: AutoSizeText(
          "Redeem Points",
          style: GoogleFonts.balooBhai(fontSize: 30),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                numberOfParticles: 15,
                emissionFrequency: 0.015,
                particleDrag: 0.04,
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop:
                    true, // start again as soon as the animation is finished
                colors: [
                  Colors.green,
                  Colors.greenAccent,
                  Colors.lightGreen,
                  Colors.lightGreenAccent,
                  Colors.blueGrey
                ],
              ),
            ),
            FlatButton(
                onPressed: () {
                  _controllerCenter.play();
                },
                child: Text('Reveal!', style: GoogleFonts.teko(fontSize: 50),)),
          ],
        ),
      ),
    );
  }
}
