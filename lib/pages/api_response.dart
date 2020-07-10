class ApiResponse<T> {
  bool status;
  String message;
  T result;

  ApiResponse.alright(this.result) {
    status = true;
  }

  ApiResponse.error(this.message) {
    status = false;
  }
}
