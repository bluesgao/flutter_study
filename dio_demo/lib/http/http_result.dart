class BaseResult<T> {
  final int code;
  final String msg;
  final T? data;

  BaseResult({required this.code, required this.msg, this.data});

  // 从 JSON 解析
  factory BaseResult.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return BaseResult(
      code: json["code"],
      msg: json["msg"],
      data: json["data"] != null ? fromJsonT(json["data"]) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {"code": code, "msg": msg, "data": data};
  }
}
