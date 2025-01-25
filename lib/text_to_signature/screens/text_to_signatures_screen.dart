import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:test/utils.dart' as utils;

class TextToSignaturesScreen extends StatefulWidget {
  const TextToSignaturesScreen({super.key});

  @override
  State<TextToSignaturesScreen> createState() => _TextToSignaturesScreenState();
}

class _TextToSignaturesScreenState extends State<TextToSignaturesScreen> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';
  String _img = 'space';
  String _ext = '.png';
  String _path = 'assets/letters/';
  String _displaytext = 'Press the button and start writing...';
  int _state = 0;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sanket',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: new Image.asset("assets/logo/logo_icon.png"),
              onPressed: () {},
            );
          },
        ),
      ),
      body: RefreshIndicator(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Image(
                      image: AssetImage('$_path$_img$_ext'),
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      key: ValueKey<int>(_state),
                      width: MediaQuery.of(context).size.width,
                      height: (4 / 3) * MediaQuery.of(context).size.width,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: (4 / 3) * MediaQuery.of(context).size.width,
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.orange,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                  child: SingleChildScrollView(
                    reverse: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 0.04 * MediaQuery.of(context).size.height,
                      child: Text(
                        _displaytext,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.orange,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ),
          ),
        ),
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
            () {
              setState(() {
                _text = '';
                _path = 'assets/letters/';
                _img = 'space';
                _ext = '.png';
                _displaytext = 'Press the button and start speaking...';
                _state = 0;
              });
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        // endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        // repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.white.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      top: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'Enter text',
                          ),
                          controller: controller,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: utils.color,
                            fixedSize: const Size(double.infinity, 60),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              _text = controller.text;
                              controller.clear();
                            });
                            log('Final Word: $_text');
                            translation(_text);
                          },
                          child: const Text(
                            "Show Result",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(Icons.upload),
          foregroundColor: Colors.white,
          // backgroundColor: Colors.white,
          // foregroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      // setState(() {
      //   _text = '';
      //   _path = 'assets/letters/';
      //   _img = 'space';
      //   _ext = '.png';
      //   _displaytext = 'Press the button and start speaking...';
      //   _state = 0;
      // });

      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
        debugLogging: true,
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            log(val.recognizedWords.toString());
          }),
        );
        // translation(_text);
      }
    } else {
      await Future.delayed(const Duration(seconds: 3));

      log('Final Word' + _text.toString());
      setState(() => _isListening = false);
      _speech.stop();
      translation(_text);
      _state = 0;
    }
  }

  void translation(String _text) async {
    _displaytext = '';
    String speechStr = _text.toLowerCase();

    // -------- logic - detect phrases --------------------
    // List<String> subList = [];
    // List<String> strArray = filterKnownStr(speechStr, utils.phrases, subList);
    // -------- end logic - detect phrases ----------------

    // if(utils.phrases.contains(speechStr)){
    //   String file = speechStr;
    //   setState(() {
    //     _display_text += _text;
    //     _path = 'assets/ISL_Gifs/';
    //     _img = file;
    //     _ext = '.gif';
    //   });
    //   await Future.delayed(const Duration(milliseconds: 11000));
    //   // return false;
    // } else {
    List<String> strArray = speechStr.split(" ");
    for (String content in strArray) {
      // print('$content');
      // if(utils.phrases.contains(content)){
      //   String file = content;
      //   int idx = utils.phrases.indexOf(content);
      //   int _duration = int.parse(utils.phrases.elementAt(idx+1));
      //   // print('$_duration');
      //   setState(() {
      //     _state += 1;
      //     _displaytext += content;
      //     _path = 'assets/ISL_Gifs/';
      //     _img = file;
      //     _ext = '.gif';
      //   });
      //   await Future.delayed(Duration(milliseconds: _duration));
      //
      // } else
      if (utils.words.contains(content)) {
        String file = content;
        int idx = utils.words.indexOf(content);
        int _duration = int.parse(utils.words.elementAt(idx + 1));
        // print('$_duration');
        setState(() {
          _state += 1;
          _displaytext += content;
          _path = 'assets/ISL_Gifs/';
          _img = file;
          _ext = '.gif';
        });
        await Future.delayed(Duration(milliseconds: _duration));
      } else {
        String file = content;
        if (utils.hello.contains(file)) {
          file = 'hello';
          int idx = utils.words.indexOf(file);
          int _duration = int.parse(utils.words.elementAt(idx + 1));
          // print('$_duration');
          setState(() {
            _state += 1;
            _displaytext += content;
            _path = 'assets/ISL_Gifs/';
            _img = file;
            _ext = '.gif';
          });
          await Future.delayed(Duration(milliseconds: _duration));
        } else if (utils.you.contains(file)) {
          file = 'you';
          int idx = utils.words.indexOf(file);
          int _duration = int.parse(utils.words.elementAt(idx + 1));
          // print('$_duration');
          setState(() {
            _state += 1;
            _displaytext += content;
            _path = 'assets/ISL_Gifs/';
            _img = file;
            _ext = '.gif';
          });
          await Future.delayed(Duration(milliseconds: _duration));
        } else {
          for (var i = 0; i < content.length; i++) {
            if (utils.letters.contains(content[i])) {
              String char = content[i];
              // print('$alphabet');
              setState(() {
                _state += 1;
                _displaytext += char;
                _path = 'assets/letters/';
                _img = char;
                _ext = '.png';
              });
              await Future.delayed(const Duration(milliseconds: 1500));
            } else {
              String letter = content[i];
              // print('$letter');
              setState(() {
                _state += 1;
                _displaytext += letter;
                _path = 'assets/letters/';
                _img = 'space';
                _ext = '.png';
              });
              await Future.delayed(const Duration(milliseconds: 1000));
            }
          }
        }
      }
      // _display_text += ' ';
      setState(() {
        _state += 1;
        _displaytext += " ";
        _path = 'assets/letters/';
        _img = 'space';
        _ext = '.png';
      });
      await Future.delayed(const Duration(milliseconds: 1000));
    }
    setState(() {
      _text = '';
    });
  }
}
