// エラーコード出すためのやつ

class Authentication_error{

  //ログイン時の日本語エラーメッセージ
  login_error_msg(String error_code) {
    String error_msg;

    if(error_code=='invalid-email'){
      error_msg='有効なメールアドレスを入力してください。';
    }else if(error_code =='user-not-found'){
      error_msg='メールアドレスがパスワードが間違っています。';
    }else if(error_code=='wrong-password') {
      error_msg='メールアドレスかパスワードが間違っています。';
    }else if(error_code =='error'){
      error_msg ='メールアドレスとパスワードを入力してください';
    }else {
        error_msg =error_code;
    }
    return error_msg;
    }


    //アカウント時の日本語エラーメッセージ
    register_error_msg(String error_code){
      String error_msg;
    if(error_code =='ERROR_INVALID_EMAIL'){
      error_msg='有効なメールアドレスを入力してください';
      }else if(error_code =='error'){
      error_msg='メールアドレスとパスワードを入力';
    }else{
      error_msg =error_code;
    }
    return error_msg;
    }
  }
