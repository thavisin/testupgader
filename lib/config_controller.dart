import 'package:get/get.dart';
import 'dart:io';

class ConfigController extends GetxController {
  Future<void> executeCommands() async {
    try {
      // Command to list file permissions
      await Process.run(
          'ls', ['-l', '/Users/thavisiny/Documents/testupgrade.sh']);

      // Command to set executable permission
      await Process.run(
          'chmod', ['+x', '/Users/thavisiny/Documents/testupgrade.sh']);

      print('Commands executed successfully.');
    } catch (e) {
      print('Exception while executing commands: $e');
    }
  }

  Future<void> runShellScript() async {
    try {
      // Path to your .sh file
      String scriptPath = '/Users/thavisiny/Documents/testupgrade.sh';

      // Run the shell script
      ProcessResult result = await Process.run(scriptPath, []);

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
