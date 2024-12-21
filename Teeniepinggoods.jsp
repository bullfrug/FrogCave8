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
    <!-- 헤더 내용은 index.html과 동일 -->
</header>

<main class="event-main">
    <div class="container">
        <section class="search-header">
            <div class="search-info">
                <h1 class="search-term">티니핑 굿즈</h1>
            </div>

            <div class="filter-section">
                <div class="filter-buttons">
                    <div class="filter-dropdown">
                        <button id="filterToggleBtn" class="filter-button">
                            <i class="fas fa-filter"></i> 필터
                        </button>
                        <div id="filterPanel" class="filter-panel">
                            <button id="closeFilterBtn" class="close-filter">×</button>
                            <!-- 필터 내용 -->
                            <div class="filter-group">
                                <h6>혜택 정보</h6>
                                <div class="filter-options">
                                    <button class="tag-btn" data-filter="discount">할인상품</button>
                                    <button class="tag-btn" data-filter="free-shipping">무료배송</button>
                                    <button class="tag-btn" data-filter="free-return">무료교환반품</button>
                                </div>
                            </div>
                            <hr>
                            <div class="filter-group">
                                <h6>배송 유형</h6>
                                <div class="filter-options">
                                    <button class="tag-btn" data-filter="today">오늘출발</button>
                                    <button class="tag-btn" data-filter="hope-day">일반배송</button>
                                </div>
                            </div>
                            <hr>
                            <div class="filter-group">
                                <h6>가격대</h6>
                                <div class="price-range">
                                    <div class="price-inputs">
                                        <input type="text" id="minPrice" placeholder="최소 3,000" maxlength="9">
                                        <span>~</span>
                                        <input type="text" id="maxPrice" placeholder="최대 150,000" maxlength="9">
                                    </div>
                                    <button id="applyPrice" class="btn-apply">적용</button>
                                </div>
                            </div>
                            <div class="filter-actions">
                                <button id="resetAllFilters" class="btn-reset">초기화</button>
                                <button id="showFilteredProducts" class="btn-apply">적용하기</button>
                            </div>
                        </div>
                    </div>
                </div>
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
</body>
</html>
