import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

void main() => runApp(const GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // 使用 Get.put() 实例化你的类，使其对当下的所有子路由可用。
    final Controller c = Get.put(Controller());

    return Scaffold(
      // 使用 Obx(()=> 每当改变计数时，就更新 Text()。
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

      // 用一个简单的 Get.to() 即可代替 Navigator.push 那 8 行，无需上下文！
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Page"),
          onPressed: () => Get.to(
            Page(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Page extends StatelessWidget {
  // 你可以让 Get 找到一个正在被其他页面使用的 Controller，并将它返回给你。
  final Controller c = Get.find();

  Page({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // 访问更新后的计数变量
    return Scaffold(
      body: Center(
        child: Text("${c.count}"),
      ),
    );
  }
}
