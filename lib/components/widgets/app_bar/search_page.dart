import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/mushroom_view_model.dart';
import '../../../view/products_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = "";
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MushroomsViewModel>(context, listen: false);

    final List results = query.isEmpty
        ? []
        : vm.allMushrooms.where((m) {
            final q = query.toLowerCase();
            return m.name.toLowerCase().contains(q) ||
                m.commonname.toLowerCase().contains(q);
          }).toList();

    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = keyboardHeight > 0;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),

                      Expanded(
                        child: TextField(
                          focusNode: _focus,
                          autofocus: true,
                          onChanged: (text) {
                            setState(() {
                              query = text;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Search Psylethia.com...",
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: query.isEmpty
                      ? const Center(
                          child: Text(
                            "Tape un nom pour chercher ton champignon favoris...",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.only(bottom: 150),
                          itemCount: results.length,
                          itemBuilder: (context, index) {
                            final m = results[index];

                            return ListTile(
                              leading: const Icon(Icons.search),
                              title: Text(m.name),
                              trailing: const Icon(Icons.north_west),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProductsPage(mushroom: m),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            ),

            if (isKeyboardOpen)
              Positioned(
                left: 0,
                right: 0,
                bottom: keyboardHeight - 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Search with photo",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Search with camera",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
