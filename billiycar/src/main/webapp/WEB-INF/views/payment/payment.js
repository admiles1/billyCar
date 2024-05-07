const IMP = window.IMP; // 아임포트 라이브러리 추출
IMP.init('your_imp_code'); // 가맹점 식별 코드

document.getElementById('pay-button').addEventListener('click', function() {
    IMP.request_pay({
        pg: 'html5_inicis', // 결제 과정에 사용될 결제사
        pay_method: 'card', // 결제 수단
        merchant_uid: 'merchant_' + new Date().getTime(), // 주문번호
        name: '렌트카 예약', // 주문 명
        amount: 10000, // 금액
        buyer_email: 'customer@example.com', // 구매자 이메일
        buyer_name: '홍길동', // 구매자 이름
        buyer_tel: '010-1234-5678', // 구매자 전화번호
        buyer_addr: '서울특별시 강남구 삼성동', // 구매자 주소
        buyer_postcode: '123-456', // 구매자 우편번호
        m_redirect_url: 'https://www.yoursite.com/payments/complete' // 모바일 결제시 리다이렉션될 URL
    }, function(rsp) {
        if (rsp.success) {
            alert('결제 성공');
            // 결제 성공 시 로직,
        } else {
            alert('결제 실패');
            // 결제 실패 시 로직,
        }
    });
});