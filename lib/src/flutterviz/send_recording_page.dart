import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SendRecordingPage(),
    );
  }
}

class SwitchListTileStateful extends StatefulWidget {
  @override
  _SwitchListTileStatefulState createState() => _SwitchListTileStatefulState();
}

class _SwitchListTileStatefulState extends State<SwitchListTileStateful> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
        });
      },
      activeColor: Color(0xff3a57e8),
      activeTrackColor: Color(0xff92c6ef),
      inactiveThumbColor: Color(0xff9e9e9e),
      inactiveTrackColor: Color(0xffe0e0e0),
    );
  }
}


class SendRecordingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
        ],
        backgroundColor: Color(0xffffffff),
        currentIndex: 0,
        elevation: 8,
        iconSize: 24,
        selectedItemColor: Color(0xff3a57e8),
        unselectedItemColor: Color(0xff9e9e9e),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {},
      ),
      // body: Center(
      //   child: Text("Isso é apenas um teste!"),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {},
                color: Color(0xff212435),
                iconSize: 24,
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "The whole world is going to hear you!",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Text(
              "Speaker data: Speaker name, age. From place. Speaking language. Speech context: Blablablablablablablabla blablablablablablablablablablablablablabla blablablablablablablablablablablablablabla blablablablablablablablablablablablablabla blablablablablabla.",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xff000000),
              ),
            ),
          ),
          _buildConfirmationRow(
            "I confirm that all audio in this recording is sincere and useful data for research purposes. And agree to be punished otherwise.",
          ),
          _buildConfirmationRow(
            "I confirm that all above data is true.",
          ),
          _buildConfirmationRow(
            "I confirm I am human. (Captcha)",
          ),
        
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: MaterialButton(
              onPressed: () {},
              color: Color(0xffffffff),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
              ),
              padding: EdgeInsets.all(16),
              textColor: Color(0xff000000),
              height: MediaQuery.of(context).size.height * 0.12,
              minWidth: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                "Send recording",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SwitchListTileStateful(),
                // ESSA É A PARTE QUE ESTÁ FAZENDO O CÓDIGO NÃO FUNCINAR
                // SwitchListTile(
                //   value: false,
                //   onChanged: (value) {},
                //   activeColor: Color(0xff3a57e8),
                //   activeTrackColor: Color(0xff92c6ef),
                //   inactiveThumbColor: Color(0xff9e9e9e),
                //   inactiveTrackColor: Color(0xffe0e0e0),
                // ),
                // ATÉ AQUI
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text(
                      "Keep recording file at cell phone?",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmationRow(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Checkbox(
            onChanged: (value) {},
            activeColor: Color(0xff3a57e8),
            autofocus: false,
            checkColor: Color(0xffffffff),
            hoverColor: Color(0x42000000),
            splashRadius: 20,
            value: false,
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Text(
                text,
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
