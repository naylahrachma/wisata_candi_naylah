import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  // TODO: 1 Deklarasikan variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

 String _errorText = '';
 bool _isSignedIn = false;
 bool _obscurePassword = true;

 void signIn() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();

   String savedUsername = prefs.getString('username') ?? '';
   String savedPassword = prefs.getString('password') ?? '';
   String enteredUsername = _usernameController.text.trim();
   String enteredPassword = _passwordController.text.trim();

   if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
     setState(() {
       _errorText = 'Nama pengguna dan kata sandi harus diisi';
     });
     return;
   }

   if(savedUsername.isEmpty || savedPassword.isEmpty) {
     setState(() {
       _errorText = 'Pengguna belum terdaftar. Silahkan daftar terlebih dahulu.';
     });
     return;
   }

   if(enteredUsername == savedUsername && enteredPassword == savedPassword){
     setState(() {
       _errorText = '';
       _isSignedIn = true;
       prefs.setString('isSignedIn', true);
     });
     WidgetsBinding.instance.addPostFrameCallback((..) {
       Navigator.pushReplacementNamed(context, routeName)
     });
   }
 }

 @override
 Widget build(BuildContext context){
   return Scaffold(
     // TODO: 2 Pasang AppBar
     appBar: AppBar(title: Text('Sign In'),),
     // TODO: 3 Pasang body
     body: Center(
       child: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(16),
           child: Form(
             child: Column(
               // TODO: 4 Atur mainAxisAligment dan crossAligment
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 // TODO: 5 Pasang TextFormField Nama Pengguna
                 TextFormField(
                   controller: _usernameController,
                   decoration: InputDecoration(
                     labelText: "Nama Pengguna",
                     border: OutlineInputBorder(),
                   ),
                 ),
                 // TODO: 6 Pasang TextFormField Kata Sandi
                 SizedBox(height: 20),
                 TextFormField(
                   controller: _passwordController,
                   decoration: InputDecoration(
                     labelText: "Kata Sandi",
                     errorText: _errorText.isNotEmpty ? _errorText : null,
                     border: OutlineInputBorder(),
                     suffixIcon: IconButton(
                       onPressed: (){
                         setState(() {
                           _obscurePassword = !_obscurePassword;
                         });
                       },
                       icon: Icon(
                         _obscurePassword ? Icons.visibility_off
                             : Icons.visibility,
                       ),),
                   ),
                   obscureText: _obscurePassword,
                 ),
                 // TODO: Pasang ElevatedButton Sign In
                 SizedBox(height: 20),
                 ElevatedButton(
                     onPressed: (){},
                     child: Text('Sign In')),
                 // TODO: 8 Pasang TextButton sign Up
                 SizedBox(height: 10),
                 // TextButton(
                 //     onPressed: (){},
                 //     child: Text('Belum punya akun? Daftar di sini.')),
                 RichText(
                     text: TextSpan(
                       text: 'Belum punya akun? ',
                       style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                       children: <TextSpan>[
                         TextSpan(
                           text: 'Daftar di sini.',
                           style: TextStyle(
                             color: Colors.blue, // warna untuk teks yang bisa ditekan
                             decoration: TextDecoration.underline,
                             fontSize: 16
                           ),
                           recognizer: TapAndPanGestureRecognizer()
                             ..onTap = () {
                             Navigator.pushNamed(context, '/sign_up'):
                             },
                         ),
                       ],
                     ),),
               ],
             ),
           ),
         ),
       ),
     ),
   );
 }

  void setState(Null Function() param0) {}


}