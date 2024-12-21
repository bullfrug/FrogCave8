<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제하기 - 티니핑 토이샵</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/payment.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .payment-main .container {
            display: grid;
            grid-template-columns: 1fr 380px;
            gap: 2rem;
            align-items: start;
        }

        .payment-content {
            grid-column: 1;
        }

        .payment-sidebar {
            grid-column: 2;
            position: sticky;
            top: 100px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
        }

        .payment-amount {
            margin-bottom: 1.5rem;
        }

        .btn-payment {
            width: 100%;
        }

        @media (max-width: 992px) {
            .payment-main .container {
                grid-template-columns: 1fr;
            }

            .payment-sidebar {
                position: relative;
                top: 0;
                grid-column: 1;
            }
        }

        .delivery-info .address-input input {
            width: 100%;
        }

        .point-inputs {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .btn-use-all {
            padding: 12px 20px;
            background-color: white;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
            border-radius: 8px;
            cursor: pointer;
            white-space: nowrap;
        }

        .available-points {
            margin-top: 8px;
            font-size: 14px;
            color: #666;
        }

        .available-points span {
            color: var(--accent-color);
            font-weight: 700;
        }

        .btn-confirm-transfer {
            width: 100%;
            padding: 15px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-confirm-transfer:hover {
            background-color: var(--accent-color);
        }
    </style>
</head>
<body>
<main class="payment-main">
    <div class="container">
        <div class="payment-content">
            <h1 class="page-title">결제하기</h1>

            <!-- 주문 상품 -->
            <section class="order-products">
                <h2>주문 상품</h2>
                <div class="product-list">
                    <c:forEach items="${orderProducts}" var="product">
                        <div class="product-item">
                            <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}">
                            <div class="product-info">
                                <h3>${product.name}</h3>
                                <p class="product-option">옵션: ${product.option}</p>
                                <p class="product-price">${product.price}원 (${product.quantity}개)</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>

            <!-- 배송 정보 -->
            <section class="delivery-info">
                <h2>배송 정보</h2>
                <div class="info-form">
                    <div class="form-group">
                        <label>받는 사람</label>
                        <input type="text" name="recipientName" placeholder="이름">
                    </div>
                    <div class="form-group">
                        <label>연락처</label>
                        <input type="tel" name="recipientPhone" placeholder="010-1234-5678">
                    </div>
                    <div class="form-group">
                        <label>배송지</label>
                        <div class="address-input">
                            <input type="text" name="address" placeholder="서울특별시 강남구 테헤란로 123">
                        </div>
                        <input type="text" name="addressDetail" placeholder="456호">
                    </div>
                    <div class="form-group">
                        <label>배송 요청사항</label>
                        <select name="deliveryRequest">
                            <option>배송 시 요청사항을 선택해주세요</option>
                            <option>부재 시 경비실에 맡겨주세요</option>
                            <option>현관문 앞에 놓아주세요</option>
                            <option>배송 전 연락 부탁드립니다</option>
                            <option>직접 입력</option>
                        </select>
                    </div>
                </div>
            </section>

            <!-- 포인트/쿠폰 -->
            <section class="points-coupons">
                <h2>포인트/쿠폰</h2>
                <div class="info-form">
                    <div class="form-group">
                        <label>포인트 사용</label>
                        <div class="point-inputs">
                            <input type="number" name="usePoints" placeholder="0" min="0" max="${availablePoints}">
                            <button type="button" class="btn-use-all">모두 사용</button>
                        </div>
                        <p class="available-points">사용 가능 포인트: <span>${availablePoints}P</span></p>
                    </div>
                    <div class="form-group">
                        <label>쿠폰 적용</label>
                        <select name="coupon">
                            <c:forEach items="${coupons}" var="coupon">
                                <option value="${coupon.id}">${coupon.name} (${coupon.discount}원)</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </section>

            <!-- 결제 수단 -->
            <section class="payment-method">
                <h2>결제 수단</h2>
                <div class="payment-options">
                    <label class="payment-option">
                        <input type="radio" name="paymentMethod" value="card" checked>
                        <span class="option-text">신용카드</span>
                    </label>
                    <label class="payment-option">
                        <input type="radio" name="paymentMethod" value="bank">
                        <span class="option-text">무통장입금</span>
                    </label>
                </div>
            </section>
        </div>

        <!-- 결제 금액 -->
        <div class="payment-sidebar">
            <section class="payment-amount">
                <h2>결제 금액</h2>
                <div class="amount-details">
                    <div class="amount-row">
                        <span>상품 금액</span>
                        <span>${totalAmount}원</span>
                    </div>
                    <div class="amount-row">
                        <span>배송비</span>
                        <span>${deliveryFee}원</span>
                    </div>
                    <div class="amount-row total">
                        <span>최종 결제 금액</span>
                        <span>${finalAmount}원</span>
                    </div>
                </div>
            </section>
            <button type="button" class="btn-payment">${finalAmount}원 결제하기</button>
        </div>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/payment.js"></script>
</body>
</html>
