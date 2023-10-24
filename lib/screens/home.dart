import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryFilterProvider = StateProvider<String?>((ref) => null);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => HomeScreenState();
}

// Replace with your actual API key

class HomeScreenState extends ConsumerState<HomeScreen> {
  List<String> categories = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology'
  ];

  @override
  Widget build(BuildContext context) {
    // getNews() async {
    //   final newsUrl = Uri.parse(
    //       'https://newsapi.org/v2/sources?q=bitcoin&from=2023-10-10&sortBy=popularity&apiKey=$apiKey');

    //   try {
    //     final response = await http.get(newsUrl);
    //     // print(response.toString());
    //     Map<String, dynamic> responseData = json.decode(response.body);

    //     // print(responseData);

    //     final sourcesData =
    //         responseData['sources'].map((e) => e['category']).toList();
    //     print(sourcesData);
    //   } catch (e) {
    //     print(e);
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: Column(
        children: [
          // Search bar and notifications
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications),
                  ),
                ),
              ],
            ),
          ),
          // Latest News
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest news',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Image(
                      image: AssetImage(
                        './assets/images/breaking.jpg',
                      ),
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Show text here',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    )),
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ChoiceChip(
                      label: Text(category),
                      selected:
                          false, // You can set the selected state as needed
                      onSelected: (bool selected) {
                        ref.read(categoryFilterProvider)?.state = category;
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
