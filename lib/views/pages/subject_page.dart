import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Wrap(
                      children: [
                        ...List.generate(
                          100,
                          (index) => Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(4),
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade50,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.cloud,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "IT & Cloud Computing",
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                LinearProgressIndicator(
                                  value: 0.7,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
