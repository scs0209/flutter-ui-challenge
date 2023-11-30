import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = AppService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Today\'s Toons',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                print(index);
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// ListView.builder도 리스트를 build 하지만 그냥 ListView보다 훨씬 최적화되어 있다. 왜냐하면, 사용자가 볼 수 없는 아이템은 build하지 않기 때문이다. 즉, 화면에 보이는 부분만 build를 하고 스크롤링 할 때마다 build를 해준다.
// ListView.builder는 모든 아이템을 한 번에 만드는 대신 만들려는 아이템에 itemBuilder 함수를 실행한다.
// 그러면 build 되는 아이템의 인덱스에 접근할 수 있다.

// separatorBuilder는 widget을 리턴하는 함수, 그리고 그 widget은 리스트 아이템 사이에 렌더된다. 아이템을 구분하기 위해