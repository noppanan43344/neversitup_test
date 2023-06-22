import 'package:flutter/material.dart';

class LogicViewModel {
  late BuildContext _context;
  final textController = TextEditingController();
  String? result;

  LogicViewModel(BuildContext context) {
    _context = context;
  }
  logic1() {
    if (textController.text.length == 6) {
      result = 'true';
    } else {
      result = 'false';
    }
  }

  logic2() {
    if (textController.text.length == 6) {
      for (var i = 0; i < 6; i++) {
        if (i == 0) {
          if (int.parse(textController.text[0]) == int.parse(textController.text[1]) &&
              int.parse(textController.text[0]) == int.parse(textController.text[2])) {
            result = 'false';
            break;
          } else {
            result = 'true';
          }
        } else if (i == 1) {
          if (int.parse(textController.text[1]) == int.parse(textController.text[0]) &&
              int.parse(textController.text[1]) == int.parse(textController.text[2])) {
            result = 'false';
            break;
          } else {
            result = 'true';
          }
        } else if (i == 4) {
          if (int.parse(textController.text[4]) == int.parse(textController.text[3]) &&
              int.parse(textController.text[4]) == int.parse(textController.text[5])) {
            result = 'false';
            break;
          } else {
            result = 'true';
          }
        } else if (i == 5) {
          if (int.parse(textController.text[5]) == int.parse(textController.text[4]) &&
              int.parse(textController.text[5]) == int.parse(textController.text[3])) {
            result = 'false';
            break;
          } else {
            result = 'true';
          }
        } else if ((int.parse(textController.text[i]) == int.parse(textController.text[i + 1]) &&
                int.parse(textController.text[i]) == int.parse(textController.text[i + 2])) ||
            (int.parse(textController.text[i]) == int.parse(textController.text[i - 1]) &&
                int.parse(textController.text[i]) == int.parse(textController.text[i - 2]))) {
          result = 'false';
          break;
        } else {
          result = 'true';
        }
      }
    } else {
      result = 'false';
    }
  }

  logic3() {
    if (textController.text.length == 6) {
      for (var i = 0; i < 6; i++) {
        if (i == 0) {
          if ((int.parse(textController.text[1]) - int.parse(textController.text[0]) == -1 &&
                  int.parse(textController.text[2]) - int.parse(textController.text[0]) == -2) ||
              (int.parse(textController.text[1]) - int.parse(textController.text[0]) == 1 &&
                  int.parse(textController.text[2]) - int.parse(textController.text[0]) == 2)) {
            result = 'false';
            break;
          } else {
            result = 'true';
          }
        } else if (i == 5) {
          if ((int.parse(textController.text[4]) - int.parse(textController.text[5]) == 1 &&
                  int.parse(textController.text[3]) - int.parse(textController.text[5]) == 2) ||
              (int.parse(textController.text[4]) - int.parse(textController.text[5]) == -1 &&
                  int.parse(textController.text[3]) - int.parse(textController.text[5]) == -2)) {
            result = 'false';

            break;
          } else {
            result = 'true';
          }
        } else if ((int.parse(textController.text[i - 1]) - int.parse(textController.text[i]) == -1 &&
                int.parse(textController.text[i]) - int.parse(textController.text[i + 1]) == -1) ||
            (int.parse(textController.text[i - 1]) - int.parse(textController.text[i]) == 1 &&
                int.parse(textController.text[i]) - int.parse(textController.text[i + 1]) == 1)) {
          result = 'false';

          break;
        } else {
          result = 'true';
        }
      }
    } else {
      result = 'false';
    }
  }

  logic4() {
    int count = 0;
    if (textController.text.length == 6) {
      for (var i = 0; i < 6; i++) {
        if (i != 5) {
          if (int.parse(textController.text[i]) == int.parse(textController.text[i + 1])) {
            count++;
            i = i + 2;
            if (i == 5 && int.parse(textController.text[3]) != int.parse(textController.text[4])) {
              if (int.parse(textController.text[5]) == int.parse(textController.text[4])) {
                count++;
              }
            }
          }
        }
      }
      if (count > 2) {
        result = 'false';
      } else {
        result = 'true';
      }
    } else {
      result = 'false';
    }
  }
}
