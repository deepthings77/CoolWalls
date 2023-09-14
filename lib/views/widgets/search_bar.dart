// import 'package:flutter/material.dart';
// import 'package:my_new/views/Screen/search.dart';

// class SearchBarThing extends StatelessWidget {
//   SearchBarThing({super.key});

//   final TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//             color: const Color.fromARGB(66, 80, 80, 80),
//             border: Border.all(color: const Color.fromARGB(32, 0, 0, 0)),
//             borderRadius: BorderRadius.circular(25)),
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: _searchController,
//                 decoration: const InputDecoration(
//                   hintText: "Search Wallpapers",
//                   errorBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   focusedErrorBorder: InputBorder.none,
//                   disabledBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               SearchScreen(query: _searchController.text)));
//                 },
//                 child: const Icon(Icons.search))
//           ],
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_new/views/Screen/search.dart';

class SearchBarThing extends StatelessWidget {
  SearchBarThing({super.key});

  final TextEditingController _searchController = TextEditingController();

  void _performSearch(BuildContext context) {
    final query = _searchController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(query: query),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(66, 80, 80, 80),
        border: Border.all(color: const Color.fromARGB(32, 0, 0, 0)),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              onSubmitted: (_) {
                // Trigger search when "Enter" key is pressed
                _performSearch(context);
              },
              decoration: const InputDecoration(
                hintText: "Search Wallpapers",
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Trigger search when search icon is tapped
              _performSearch(context);
            },
            child: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}