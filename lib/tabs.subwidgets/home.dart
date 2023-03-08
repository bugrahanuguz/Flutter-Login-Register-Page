import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.teal, title: const Text("Ana Sayfa")),
      body: Column(
        children: [
          Container(
              height: 60,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(8)),
              child: const Center(
                  child: Text(
                "Haberler",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ))),
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(18 - 2)),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: ListTile(
                        tileColor: Colors.teal.shade200,
                        leading: Container(
                          height: 40,
                          width: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  isAntiAlias: true,
                                  image: NetworkImage(
                                      "https://picsum.photos/200/300"))),
                        ),
                        title: Text("Haberler $index. fotosu"),
                        subtitle: const Text("Haber subtitleı"),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
