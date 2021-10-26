import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ('Never Gonna Give You Up Lyrics'),
      theme: ThemeData.light(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Never Gonna Give You Up Lyrics'),
        ),
        elevation: 0,
      ),
      body: const BodyContent(),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SongVideo(),
        Expanded(
          child: SongLyrics(),
        ),
      ],
    );
  }
}

class SongVideo extends StatefulWidget {
  const SongVideo({Key? key}) : super(key: key);

  @override
  _SongVideoState createState() => _SongVideoState();
}

class _SongVideoState extends State<SongVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'dQw4w9WgXcQ',
      params: const YoutubePlayerParams(
        showFullscreenButton: false,
        autoPlay: false,
        loop: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: YoutubePlayerControllerProvider(
          controller: _controller,
          child: const YoutubePlayerIFrame(),
        ),
      ),
    );
  }
}

class SongLyrics extends StatelessWidget {
  const SongLyrics({Key? key}) : super(key: key);

  final lyrics = '''
  We’re no strangers to love
  You know the rules and so do I
  A full commitment’s what I’m thinking of
  You wouldn’t get this from any other guy

  I just wanna tell you how I’m feeling
  Gotta make you understand

  Never gonna give you up
  Never gonna let you down
  Never gonna run around and desert you
  Never gonna make you cry
  Never gonna say goodbye
  Never gonna tell a lie and hurt you

  We’ve known each other for so long
  Your heart’s been aching but you’re too shy to say it
  Inside we both know what’s been going on
  We know the game and we’re gonna play it

  And if you ask me how I’m feeling
  Don’t tell me you’re too blind to see

  Never gonna give you up
  Never gonna let you down
  Never gonna run around and desert you
  Never gonna make you cry
  Never gonna say goodbye
  Never gonna tell a lie and hurt you
  ''';

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      interactive: true,
      child: SingleChildScrollView(
        child: Container(
          // padding: const EdgeInsets.only(),
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Text(
            lyrics,
            textAlign: TextAlign.center,
            textScaleFactor: 1.2,
            style: const TextStyle(
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
