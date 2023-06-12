import 'package:educational_app/constants/asset_image.dart';
import 'package:educational_app/views/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controllers/exploration_controller.dart';
import '../widgets/explore_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    super.key,
  });

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    final myDataProvider =
        Provider.of<ExplorationFactProvider>(context, listen: false);
    myDataProvider.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myDataProvider = Provider.of<ExplorationFactProvider>(context);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: RefreshIndicator(
          onRefresh: () async {
            //TODO:DO WHILE ASKING REFRESH
          },
          child: SafeArea(
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Feed",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Trending",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      if (myDataProvider.isFactsloading)
                        const LoadingIndicator(),
                      ...List.generate(
                        myDataProvider.data.length,
                        (index) => ExplorationCard(
                          title: myDataProvider.data[index].title,
                          desc: myDataProvider.data[index].desc,
                          imgUrl: myDataProvider.data[index].imgUrl?.first,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 160,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...List.generate(
                              4,
                              (index) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.teal,
                                ),
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 160,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...List.generate(
                              4,
                              (index) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.teal,
                                ),
                                height: 100,
                                width: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    AppAsset.networkImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 160,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...List.generate(
                              4,
                              (index) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.teal,
                                ),
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
