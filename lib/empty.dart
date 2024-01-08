// Widget build(BuildContext context) {
//   double height = MediaQuery.of(context).size.height;
//   return bg(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             // crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 40,),
//                     appLogo(),
//                     SizedBox(height: 80,),
//                     Card(
//                         elevation: 3.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.0), // Adjust the value as needed
//                         ),
//                         color: Colors.white,
//                         child: Padding(
//                           padding: const EdgeInsets.all(20),
//                           child: Column(
//                             children: [
//                               TextFormField(
//                                 controller: _emailController,
//                                 focusNode: _focusNode,
//                                 decoration: InputDecoration(
//                                   labelText: 'Email',
//                                   suffixIcon: const Icon(Icons.person),
//                                   labelStyle: TextStyle(
//                                     color: _isFocused ? redColor : Colors.grey, // Change label text color
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(color: redColor, width: 2.0),
//                                     borderRadius: BorderRadius.circular(8.0), // Adjust the border radius
//                                   ), // Change label text color here
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(color: Colors.black, width: 1.0),
//                                     borderRadius: BorderRadius.circular(8.0), // Adjust the border radius
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 10.0),
//                               TextFormField(
//                                 controller: _passwordController,
//                                 obscureText: !_isPasswordVisible,
//                                 decoration: InputDecoration(
//                                     labelText: 'Password',
//                                     suffixIcon: IconButton(
//                                       onPressed: _togglePasswordVisibility,
//                                       icon: Icon(
//                                         _isPasswordVisible
//                                             ? Icons.visibility
//                                             : Icons.visibility_off,
//                                       ),
//                                     ),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(10.0))),
//                               ),
//                               const SizedBox(height: 2.0),
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: const Align(
//                                   alignment: Alignment.centerRight,
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//                                     child: Text(
//                                       'Forgot Password?',
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 14.0,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 5.0),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   _signInWithEmailAndPassword(
//                                       _emailController.text,
//                                       _passwordController.text
//                                   );
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.green,
//                                   foregroundColor: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10.0)),
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 20),
//                                   textStyle: const TextStyle(
//                                       fontSize: 20, fontWeight: FontWeight.bold),
//                                 ),
//                                 child: const Text('Log in'),
//                               ),
//                               const SizedBox(height: 10.0),
//                               const Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Expanded(
//                                       child: Divider(
//                                         thickness: 1,
//                                         color: Colors.grey,
//                                       )),
//                                   Padding(
//                                     padding: EdgeInsets.all(5.0),
//                                     child: Text('or'),
//                                   ),
//                                   Expanded(
//                                       child: Divider(
//                                         thickness: 1,
//                                         color: Colors.grey,
//                                       )),
//                                 ],
//                               ),
//                               const SizedBox(height: 10.0),
//                               ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.black,
//                                     foregroundColor: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10.0)),
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10, vertical: 20),
//                                   ),
//                                   child: const Text(
//                                     'Sign in With Google',
//                                     style:
//                                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                                   )),
//                               const SizedBox(height: 10.0),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   const Text(
//                                     "Don't have an account? ",
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.grey,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => const SignUpScreen()),
//                                       );
//                                     },
//                                     child: const Text(
//                                       'Sign Up',
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           color: Colors.green,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//   );
// }