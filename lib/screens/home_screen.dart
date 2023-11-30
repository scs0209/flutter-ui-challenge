import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = AppService.getTodaysToons();

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
      // FutureBuilder는 await를 자동으로 알아서 해준다 future: await webtoons
      // snapshot을 통해 데이터를 기다려준다.
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text('There is data!');
          }
          return const Text('Loading...');
        },
      ),
    );
  }
}

// FutureBuilder를 사용하면 Stateful widget을 사용할 필요가 없다.
// FutureBuilder를 사용하려면 Future를 생성하고 FutureBuilder를 사용하면 된다.
// FutureBuilder는 자기가 기다릴 Future랑 builder 함수를 받는다.
// builder 함수는 context와 snapshot를 전달받는다.
// 여기서 snapshot은 바로 Future의 상태이다. (로딩 중, 데이터가 있는지, 에러가 났는지 알 수 있다.)