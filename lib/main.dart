import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unitask/app/router/app_router.dart';
import 'package:unitask/app/theme/app_theme.dart';

void main() {
  runApp(ProviderScope(child: const UniTaskApp()));
}

class UniTaskApp extends StatelessWidget {
  const UniTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: .system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: true, // 디버그 배너 제거 true하면 다시 생김
      // 화면에 성능 오버레이 표시 (프레임 렌더링 시간, GPU 사용량 등)
      // showPerformanceOverlay: true,
    );
  }
}
