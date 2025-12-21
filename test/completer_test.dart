import 'dart:async'; // Completer 在这个库中

// 这是一个模拟的、基于回调的异步函数
void fetchDataFromLegacyApi(String query, Function(String) onSuccess, Function(Exception) onError) {
  print("开始查询: $query");

  // 模拟网络延迟
  Future.delayed(Duration(seconds: 1), () {
    if (query == "error") {
      // 模拟一个错误情况
      onError(Exception("无效的查询参数"));
    } else {
      // 模拟成功返回数据
      onSuccess("查询 '$query' 的结果：找到了 42 条数据。");
    }
  });
}

// 使用 Completer 包装后的函数，返回 Future<String>
Future<String> fetchData(String query) {
  // 1. 创建一个 Completer 实例
  final completer = Completer<String>();

  // 2. 调用旧的回调式 API
  fetchDataFromLegacyApi(
      query,
          (result) {
        // 3a. 当操作成功时，使用 completer.complete(value) 来完成 Future
        // 这会使得返回的 future 进入完成状态，并将 result 传递给 await 的地方
        if (!completer.isCompleted) { // 安全检查，防止重复完成
          completer.complete(result);
        }
      },
          (error) {
        // 3b. 当操作失败时，使用 completer.completeError(error) 来完成 Future
        // 这会使得返回的 future 进入错误状态
        if (!completer.isCompleted) {
          completer.completeError(error);
        }
      },
  );

  // 4. 立即返回 completer 内部的 future
  return completer.future;
}

Future<void> main() async {
  // success
  var data = await fetchData('evolve');
  print('查询结果: $data');

  // error
  try {
    var data = await fetchData('error');
    print('查询结果: $data');
  } catch (e) {
    print('查询失败: $e');
  }

}