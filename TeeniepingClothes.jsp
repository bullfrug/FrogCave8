<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Teenieping Clothes</title>
  <script>
    function addToCart(productId) {
      fetch('/emorioncastle/tinyfing_clothes/addToCart', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: 'productId=' + productId
      }).then(response => {
        if (response.ok) alert('장바구니에 추가되었습니다!');
      });
    }

    function addToWishlist(productId) {
      fetch('/emorioncastle/tinyfing_clothes/addToWishlist', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: 'productId=' + productId
      }).then(response => {
        if (response.ok) alert('찜목록에 추가되었습니다!');
      });
    }
  </script>
</head>
<body>
<h1>Teenieping Clothes</h1>
<div>
  <c:forEach items="${products}" var="product">
    <div>
      <h2>${product.name}</h2>
      <p>Price: ${product.price}</p>
      <button onclick="addToCart(${product.id})">장바구니 담기</button>
      <button onclick="addToWishlist(${product.id})">찜하기</button>
      <a href="/emorioncastle/tinyfing_clothes/payment?productId=${product.id}">바로 구매하기</a>
    </div>
  </c:forEach>
</div>
</body>
</html>
