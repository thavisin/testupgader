import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Run Shell Script',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Run Shell Script'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await runShellScript();
            },
            child: Text('Run Script'),
          ),
        ),
      ),
    );
  }

  Future<void> runShellScript() async {
    try {
      // Path to your .sh file
      String scriptPath = '/Users/thavisiny/Documents/testupgrade.sh';

      // Run the shell script
      ProcessResult result = await Process.run('sh', [scriptPath]);

      // Check if the script ran successfully
      if (result.exitCode == 0) {
        print('Script ran successfully!');
        print('Output: ${result.stdout}');
      } else {
        print('Error running script:');
        print('Exit code: ${result.exitCode}');
        print('Error message: ${result.stderr}');
      }
    } catch (e) {
      print('Exception while running script: $e');
    }
  }
}
