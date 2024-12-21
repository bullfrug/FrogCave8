<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>티니핑 굿즈 - 티니핑 토이샵</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tinyfing.css">
</head>
<body>
<header>
  <div class="header-top">
    <div class="container">
      <div class="header-upper">
        <div class="logo">
          <h1><a href="${pageContext.request.contextPath}/index.html">티니핑 토이샵</a></h1>
        </div>
        <div class="search-container">
          <div class="search-bar">
            <input type="text" placeholder="검색어를 입력하세요">
            <button type="submit"><i class="fas fa-search"></i> 검색</button>
          </div>
          <div class="search-dropdown">
            <div class="popular-searches">
              <h3>🔥 실시간 인기 검색어</h3>
              <ul>
                <li><a href="#"><span class="rank">1</span>레고 프렌즈</a></li>
                <li><a href="#"><span class="rank">2</span>바비 인형</a></li>
                <li><a href="#"><span class="rank">3</span>뽀로로</a></li>
                <li><a href="#"><span class="rank">4</span>타요 버스</a></li>
                <li><a href="#"><span class="rank">5</span>디즈니 피규어</a></li>
                <li><a href="#"><span class="rank">6</span>시크릿 쥬쥬</a></li>
                <li><a href="#"><span class="rank">7</span>콩순이</a></li>
                <li><a href="#"><span class="rank">8</span>헬로카봇</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="user-menu">
          <a href="${pageContext.request.contextPath}/pages/login.html">로그인</a>
          <a href="${pageContext.request.contextPath}/pages/register.html">회원가입</a>
          <a href="${pageContext.request.contextPath}/pages/cart.html" class="cart-icon">
            <i class="fas fa-shopping-cart"></i>
            <span class="cart-count">0</span>
          </a>
          <div class="mypage-dropdown">
            <a href="${pageContext.request.contextPath}/pages/mypage.html" class="mypage-btn">마이페이지 <i class="fas fa-user"></i></a>
            <div class="dropdown-content">
              <a href="${pageContext.request.contextPath}/pages/mypage.html#orders">주문내역</a>
              <a href="${pageContext.request.contextPath}/pages/mypage.html#wishlist">찜 목록</a>
              <a href="${pageContext.request.contextPath}/pages/inquiry.html">1:1 문의</a>
              <a href="${pageContext.request.contextPath}/pages/mypage.html#profile">회원정보</a>
            </div>
          </div>
        </div>
      </div>
      <div class="header-lower">
        <nav class="main-nav">
          <ul>
            <li><a href="${pageContext.request.contextPath}/pages/new.html">NEW</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/best.html">BEST</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/catch-tinyfing.html">캐치 티니핑</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/tinyfing-world.html">티니핑 월드</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/tinyfing-clothes.html">티니핑 의류</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/tinyfing-goods.html">티니핑 굿즈</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/event.html">EVENT</a></li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</header>

<main class="event-main" style="margin-top: 80px;">
  <div class="container">
    <section class="search-header">
      <div class="search-info">
        <h1 class="search-term">티니핑 월드</h1>
      </div>
    </section>

    <section class="event-section py-5">
      <h2 class="section-title text-center mb-4">
        <span class="highlight">티니핑 굿즈</span>
      </h2>

      <!-- 상품 목록 -->
      <div class="event-products row g-4">
        <c:forEach items="${products}" var="product">
          <div class="col-lg-3 col-md-6">
            <div class="product-card">
              <div class="product-image">
                <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}">
                <div class="hover-buttons">
                  <form action="${pageContext.request.contextPath}/addToCart" method="post" style="display:inline;">
                    <input type="hidden" name="product" value="${product.name}">
                    <button class="hover-button" data-tooltip="장바구니에 담기">
                      <i class="fas fa-shopping-cart"></i>
                    </button>
                  </form>
                  <form action="${pageContext.request.contextPath}/payment" method="get" style="display:inline;">
                    <input type="hidden" name="product" value="${product.name}">
                    <button class="hover-button" data-tooltip="바로 구매하기">
                      <i class="fas fa-bolt"></i>
                    </button>
                  </form>
                  <form action="${pageContext.request.contextPath}/addToWishlist" method="post" style="display:inline;">
                    <input type="hidden" name="product" value="${product.name}">
                    <button class="hover-button" data-tooltip="찜하기">
                      <i class="fas fa-heart"></i>
                    </button>
                  </form>
                </div>
              </div>
              <div class="product-info">
                <div class="product-info-text">
                  <h4>${product.name}</h4>
                  <div class="price">
                    <span class="discount">${product.price}원</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </section>
  </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/tinyfing.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
