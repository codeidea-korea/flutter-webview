import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* 아임포트 결제 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_payment.dart';
/* 아임포트 결제 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:http/http.dart' as http;

import '../controller/webview_controller.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WebViewGetController controller = Get.find();
    return IamportPayment(
      // appBar: new AppBar(
      //   title: new Text('아임포트 결제'),
      // ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/iamport-logo.png'),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: '',
      /* [필수입력] 결제 데이터 */
      data: PaymentData(
        pg: 'html5_inicis', // PG사
        payMethod: 'card', // 결제수단
        name: '', // 주문명
        merchantUid: '', // 주문번호
        amount: 0, // // 결제금액
        buyerName: '', // 구매자 이름
        buyerTel: '', // 구매자 연락처
        buyerEmail: '', // 구매자 이메일
        buyerAddr: '', // 구매자 주소
        buyerPostcode: '', // 구매자 우편번호
        appScheme: 'codeIdea', // 앱 URL scheme
        // cardQuota: [2, 3] //결제창 UI 내 할부개월수 제한
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) async {
        print('$result');
        ///결제 실패
        if (result['imp_success'] == 'false') {
          Get.back();
        }

        Get.back();
      },
    );
  }
}
