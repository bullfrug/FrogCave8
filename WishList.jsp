<!-- cart.jsp -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
</head>
<body>
<h1>장바구니</h1>

<c:if test="${empty cart}">
    <p>장바구니에 상품이 없습니다.</p>
</c:if>

<c:forEach var="product" items="${cart}">
    <p>${product}</p>  <!-- 상품 이름을 표시 -->
    <!-- 삭제 버튼 추가 -->
    <form action="/emotioncastle/CatchTinniping/removeFromCart" method="post">
        <input type="hidden" name="product" value="${product}">
        <button type="submit">삭제</button>
    </form>
</c:forEach>

<a href="/emotioncastle/CatchTinniping/payment">결제하기</a>
</body>
</html>