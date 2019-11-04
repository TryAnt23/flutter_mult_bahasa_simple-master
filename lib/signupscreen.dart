import 'package:flutter/material.dart'; 
import 'package:flutter_localization/localization/app_translations.dart';
import 'globals.dart' as globals;

class SignUpUI extends StatefulWidget {
  @override
  _SignUpScreenState createState() => new _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpUI> {
  static final List<String> languagesList = globals.supportedLanguages;
  static final List<String> languageCodesList =
      globals.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };

  String label = languagesList[0];

  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final teFirstName = TextEditingController();
  final teLastName = TextEditingController();
  final teEmail = TextEditingController();
  final tePassword = TextEditingController();

  FocusNode _focusNodeFirstName = new FocusNode();
  FocusNode _focusNodeLastName = new FocusNode();
  FocusNode _focusNodeEmail = new FocusNode();
  FocusNode _focusNodePass = new FocusNode();

  @override
  void initState() {
    super.initState();
    // application.onLocaleChanged = onLocaleChange;
    onLocaleChange(Locale(languagesMap["English"]));
  }

  void onLocaleChange(Locale locale) async { 
    setState(() {
      AppTranslations.load();
    }); 
  }

  @override
  void dispose() {
    teFirstName.dispose();
    teLastName.dispose();
    teEmail.dispose();
    tePassword.dispose();
    super.dispose();
  }

  void _select(String language) {
    print("dd "+language); 
    setState(() {
      if (language == "Hindi") {
        globals.currentLang = 'hi';
        label = "हिंदी";
      } else {
        globals.currentLang = 'en';
        label = language;
      }
    });
    onLocaleChange(Locale(languagesMap[language]));
  }

  @override
  Widget build(BuildContext context) {
    var signUpForm = new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new Container(
          alignment: FractionalOffset.center,
          margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
          padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
          decoration: new BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1.0),
            border: Border.all(color: const Color(0x33A6A6A6)),
            borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
          ),
          child: new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  obscureText: false,
                  controller: teFirstName,  
                  textAlign: TextAlign.left, 
                  decoration: InputDecoration(
                    labelText: AppTranslations.of(context).text("key_first_name"),
                    hintText: AppTranslations.of(context).text("key_first_name"), 
                  ),
                  validator: (val) => val.isEmpty ? AppTranslations.of(context).text("key_enter_first_name") : null,
                  onSaved: (val) => val,
                ),
                
                new TextFormField(
                  obscureText: false,
                  controller: teLastName,  
                  textAlign: TextAlign.left, 
                  decoration: InputDecoration(
                    labelText: AppTranslations.of(context).text("key_last_name"),
                    hintText: AppTranslations.of(context).text("key_last_name"), 
                  ),
                  validator: (val) => val.isEmpty ? AppTranslations.of(context).text("key_enter_last_name") : null,
                  onSaved: (val) => val,
                ),

                new TextFormField(
                  obscureText: false,
                  controller: teEmail,  
                  textAlign: TextAlign.left, 
                  decoration: InputDecoration(
                    labelText: AppTranslations.of(context).text("key_email"),
                    hintText: AppTranslations.of(context).text("key_email"), 
                  ),
                  validator: (val) => val.isEmpty ? AppTranslations.of(context).text("key_email") : null,
                  onSaved: (val) => val,
                ),

                new TextFormField(
                  obscureText: true,
                  controller: tePassword,  
                  textAlign: TextAlign.left, 
                  decoration: InputDecoration(
                    labelText: AppTranslations.of(context).text("key_password"),
                    hintText: AppTranslations.of(context).text("key_password"), 
                  ),
                  validator: (val) => val.isEmpty ? AppTranslations.of(context).text("key_password") : null,
                  onSaved: (val) => val,
                ),
              ],
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: buttonWithColorBg(
              AppTranslations.of(context).text("key_next"),
              EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              const Color(0xFFFFD900),
              const Color(0xFF28324E)),
        ),
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F67),
        accentColor: const Color(0xFF167F67),
      ),
      home: new Scaffold(
        backgroundColor: const Color(0xFFF1F1EF),
        appBar: new AppBar(
          title: new Text(
            label,
            style: new TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              // overflow menu
              onSelected: _select,
              icon: new Icon(Icons.language, color: Colors.white),
              itemBuilder: (BuildContext context) {
                return languagesList
                    .map<PopupMenuItem<String>>((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        key: scaffoldKey,
        body: new Container(
          child: new SingleChildScrollView(
            child: new Center(
              child: signUpForm,
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonWithColorBg(
      String buttonLabel, EdgeInsets margin, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(15.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }
}
