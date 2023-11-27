// class ProfileInfoItem extends StatelessWidget {
//   const ProfileInfoItem({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.value,
//     this.showEditIcon = false,
//     this.onEditPressed,
//     required this.iconColor,
//   });
//
//   final IconData icon;
//   final String label;
//   final String? value;
//   final bool showEditIcon;
//   final VoidCallback? onEditPressed;
//   final Color? iconColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 3,
//           child: Row(
//             children: [
//               Icon(icon, color: iconColor ?? Colors.black),
//               SizedBox(width: 8),
//               Text(
//                 label,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: Text(': ${value ?? "Tidak ada"}', style: TextStyle(fontSize: 18)),
//         ),
//         if (showEditIcon)
//           InkWell(onTap: onEditPressed, child: Icon(Icons.edit)),
//       ],
//     );
//   }
// }
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   final String userName = "Rustam";
//   final String fullName = "Rustam E I";
//   final int favoriteCandiCount = 10;
//   bool isSignedIn = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile"),
//       ),
//       body: ListView(
//         children: [
//           ProfileInfoItem(
//             icon: Icons.lock,
//             label: "Pengguna",
//             value: userName,
//             iconColor: Colors.pink,
//           ),
//           ProfileInfoItem(
//             icon: Icons.person,
//             label: "Nama",
//             value: fullName,
//             iconColor: Colors.pink,
//           ),
//           if (isSignedIn)
//             ProfileInfoItem(
//               icon: Icons.favorite,
//               label: "Favorite",
//               value: favoriteCandiCount.toString(),
//               iconColor: Colors.pink,
//             ),
//         ],
//       ),
//     );
//   }
// }