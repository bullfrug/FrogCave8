<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>결제 완료 - 티니핑 토이샵</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment-complete.css">
</head>
<body>
<header>
  <!-- 헤더 내용은 common.js에서 동적으로 삽입 -->
</header>

<main class="payment-complete-main">
  <div class="container">
    <div id="bankTransferPopup" class="popup-overlay" style="display: none;">
      <div class="popup-content">
        <h2>무통장 입금 안내</h2>
        <p>입금 계좌: 신한은행 123-456-789012</p>
        <p>예금주: 티니핑토이샵</p>
        <p>입금 금액: <span id="transferAmount">${finalAmount}원</span></p>
        <button type="button" class="btn-confirm-transfer" onclick="confirmTransfer()">입금 완료</button>
      </div>
    </div>

    <div class="complete-message">
      <img src="${pageContext.request.contextPath}/img/티니핑2.jpg" alt="결제 완료" class="complete-icon">
      <h1>결제가 완료되었습니다</h1>
      <p class="order-number">주문번호: <span id="orderNumber">${orderNumber}</span></p>
    </div>

    <section class="points-coupons">
      <h2>포인트/쿠폰 정보</h2>
      <div class="info-content">
        <dl>
          <dt>사용 포인트</dt>
          <dd id="usedPoints">${usedPoints}P</dd>

          <dt>잔여 포인트</dt>
          <dd id="remainingPoints">${remainingPoints}P</dd>

          <dt>사용 쿠폰</dt>
          <dd id="usedCoupon">${usedCoupon}</dd>
        </dl>
      </div>
    </section>

    <section class="order-summary_2">
      <h2>주문 내역</h2>
      <div class="order-items">
        <c:forEach items="${orderItems}" var="item">
          <div class="order-item">
            <img src="${pageContext.request.contextPath}/${item.imageUrl}" alt="상품 이미지" class="product-image">
            <div class="item-details">
              <h3 class="product-name">${item.name}</h3>
              <p class="product-option">옵션: ${item.option}</p>
              <p class="quantity">수량: ${item.quantity}개</p>
              <p class="price">${item.price}원</p>
            </div>
          </div>
        </c:forEach>
      </div>
    </section>

    <section class="delivery-info">
      <h2>배송 정보</h2>
      <div class="info-content">
        <dl>
          <dt>받는 분</dt>
          <dd id="receiverName">${receiverName}</dd>

          <dt>연락처</dt>
          <dd id="receiverPhone">${receiverPhone}</dd>

          <dt>배송지</dt>
          <dd id="deliveryAddress">${deliveryAddress}</dd>

          <dt>배송 요청사항</dt>
          <dd id="deliveryRequest">${deliveryRequest}</dd>
        </dl>
      </div>
    </section>

    <section class="payment-info">
      <h2>결제 정보</h2>
      <div class="info-content">
        <dl>
          <dt>상품 금액</dt>
          <dd class="original-price">${originalPrice}원</dd>

          <dt>배송비</dt>
          <dd class="shipping-fee">${shippingFee}원</dd>

          <dt>포인트 사용</dt>
          <dd class="points-used">-${usedPoints}원</dd>

          <dt>쿠폰 할인</dt>
          <dd class="coupon-discount">-${couponDiscount}원</dd>

          <dt class="total">총 결제 금액</dt>
          <dd class="total total-price">${finalAmount}원</dd>

          <dt>결제 수단</dt>
          <dd class="payment-method">${paymentMethod}</dd>
        </dl>
      </div>
    </section>

    <div class="button-group">
      <button type="button" class="btn-order-detail" onclick="location.href='${pageContext.request.contextPath}/mypage'">주문 상세보기</button>
      <button type="button" class="btn-continue-shopping" onclick="location.href='${pageContext.request.contextPath}/index'">쇼핑 계속하기</button>
    </div>
  </div>
</main>

<footer>
  <!-- 푸터 내용은 common.js에서 동적으로 삽입 -->
</footer>

<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/payment-complete.js"></script>
</body>
</html>
