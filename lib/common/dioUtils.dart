import 'package:dio/dio.dart';
import 'package:my_flutter1/common/toast_util.dart';

import 'constants.dart';

class DioHttpUtil {
  static DioHttpUtil instance;
  Dio dio;
  BaseOptions options;

  CancelToken cancelToken = CancelToken();

  static DioHttpUtil getInstance() {
    if (null == instance) instance = DioHttpUtil();
    return instance;
  }

  /*
   * config it and create
   */
  DioHttpUtil() {
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = BaseOptions(
      //请求基地址,可以包含子路径
      baseUrl: Constants.BASE_URL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //Http请求头.
      headers: {
        //do something
        "version": "1.0.0"
      },
      //请求的Content-Type，默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      contentType: Headers.formUrlEncodedContentType,
      //表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.plain,
    );

    dio = Dio(options);

    //添加日志请求拦截 显示日志

    dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true)); //开启请求日志

    //Cookie管理 这个暂时不清楚
    //dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      //print("请求之前");
      // Do something before request is sent
      return options; //continue
    }, onResponse: (Response response) {
      // print("响应之前");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      // print("错误之前");
      // Do something with response error
      return e; //continue
    }));
  }

  /*
   * get请求
   * options:单个请求自定义配置
   * data：query  ?后的数据
   *
   */
  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      // print('get success---------${response.statusCode}');
      // print('get success---------${response.data}');

//      response.data; 响应体
//      response.headers; 响应头
//      response.request; 请求体
//      response.statusCode; 状态码

    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return response;
  }

  /*
   * post请求
   *
   * formData：POST传递form表单
   */
  post(url, {queryData, formData, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(url,
          data: formData,
          queryParameters: queryData,
          options: options,
          cancelToken: cancelToken);
      print('post success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return response;
  }

  /*
   * 下载文件
   */
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
      print('downloadFile success---------${response.data}');
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formatError(e);
    }
    return response.data;
  }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      ToastUtils.showToastCenter("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      ToastUtils.showToastCenter("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      ToastUtils.showToastCenter("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      ToastUtils.showToastCenter("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      ToastUtils.showToastCenter("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      ToastUtils.showToastCenter("未知错误");
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
