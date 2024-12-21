<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>main</title>
</head>
<style>






</style>
<body>



<!-- 헤더 -->
<header>
  <div class="header-top">
    <div class="container">
      <div class="logo">
        <h1>티니핑 토이샵</h1>
      </div>
      <div class="search-bar">
        <input type="text" placeholder="검색어를 입력하세요">
        <button type="submit"><i class="fas fa-search"></i></button>
      </div>
      <nav class="main-nav">
        <ul>
          <li>
            <a href="pages/new-products.html">NEW</a>
            <span class="badge-new">NEW</span>
          </li>
          <li><a href="pages/best-products.html">BEST</a></li>
          <li><a href="pages/catch-tinyfing.html">캐치 티니핑</a></li>
          <li><a href="pages/tinyfing-world.html">티니핑 월드</a></li>
          <li><a href="pages/tinyfing-clothes.html">티니핑 의류</a></li>
          <li><a href="pages/tinyfing-goods.html">티니핑 굿즈</a></li>
          <li>
            <a href="pages/events.html">EVENT</a>
            <span class="badge-event">EVENT</span>
          </li>
        </ul>
      </nav>
      <div class="user-menu">
        <a href="pages/login.html">로그인</a>
        <a href="pages/register.html">회원가입</a>
        <div class="mypage-dropdown">
          <a href="#" class="mypage-btn">마이페이지</a>
          <div class="dropdown-content">
            <a href="pages/cart.html"><i class="fas fa-shopping-cart"></i> 장바구니</a>
            <a href="pages/board.html"><i class="fas fa-comments"></i> 1:1 게시판</a>
            <a href="pages/wishlist.html"><i class="fas fa-heart"></i> 찜 목록</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>

<!-- 메인 콘텐츠 영역 -->
<main style="margin-top: 80px;">
  <!-- 3D 이미지 슬라이더 섹션 -->
  <section class="slider-section py-5">
    <div class="container">
      <div class="swiper mainSwiper">
        <div class="swiper-wrapper">
          <!-- 슬라이드 1 -->
          <div class="swiper-slide">
            <div class="slide-content">
              <img src="images/slider/티니핑_배너사진.PNG" alt="신상품 소개">
              <div class="slide-caption">
                <h5>신상품 출시!</h5>
                <p>티니핑의 새로운 컬렉션을 만나보세요</p>
                <a href="#" class="btn btn-primary">자세히 보기</a>
              </div>
            </div>
          </div>
          <!-- 슬라이드 2 -->
          <div class="swiper-slide">
            <div class="slide-content">
              <img src="images/slider/티니핑_배너사진2.PNG" alt="할인 이벤트">
              <div class="slide-caption">
                <h5>여름 특별 할인</h5>
                <p>최대 50% 할인된 가격으로 만나보세요</p>
                <a href="#" class="btn btn-primary">할인상품 보기</a>
              </div>
            </div>
          </div>
          <!-- 슬라이드 3 -->
          <div class="swiper-slide">
            <div class="slide-content">
              <img src="images/slider/티니핑_배너사진3.PNG" alt="신규회원 혜택">
              <div class="slide-caption">
                <h5>신규회원 특별 혜택</h5>
                <p>가입 즉시 사용 가능한 1만원 쿠폰 증정</p>
                <a href="#" class="btn btn-primary">회원가입하기</a>
              </div>
            </div>
          </div>
        </div>
        <!-- 네비게이션 버튼 -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <!-- 페이지네이션 -->
        <div class="swiper-pagination"></div>
      </div>
    </div>
  </section>

  <!-- 선물 고민 해결 섹션 -->
  <section class="gift-suggestion-section py-5">
    <div class="container">
      <h2 class="text-center mb-4">선물 고민 해결</h2>
      <div class="row">
        <!-- 왼쪽 리스트 영역 -->
        <div class="col-md-6">
          <div class="section-list-wrapper">
            <ul class="section-list" id="sectionList"></ul>
            <div class="pagination-controls">
              <button id="prevPage" class="btn btn-secondary">이전</button>
              <span id="pageIndicator">1/2</span>
              <button id="nextPage" class="btn btn-secondary">다음</button>
            </div>
          </div>
        </div>
        <!-- 오른쪽 이미지 영역 -->
        <div class="col-md-6">
          <div class="section-image-wrapper">
            <img src="images/gift-suggestion.jpg" alt="선물 추천" class="section-image">
            <div class="image-overlay">
              <h3>특별한 선물을 찾으시나요?</h3>
              <p>티니핑이 도와드릴게요!</p>
              <button class="btn btn-primary">더 많은 선물 보기</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 브랜드 픽 섹션 -->
  <section class="brand-picks-section py-5">
    <div class="container">
      <h2 class="text-center mb-4">브랜드 픽</h2>
      <div class="row">
        <div class="col-md-3 mb-4">
          <div class="brand-card">
            <img src="images/brands/brand1.jpg" alt="레고" class="brand-image">
            <div class="brand-info">
              <h4>레고</h4>
              <p>상상력을 현실로 만드는 블록</p>
              <span class="brand-discount">최대 30% 할인</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="brand-card">
            <img src="images/brands/brand2.jpg" alt="실바니안" class="brand-image">
            <div class="brand-info">
              <h4>실바니안</h4>
              <p>아이들의 꿈을 키우는 친구들</p>
              <span class="brand-discount">신상품 10% 할인</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="brand-card">
            <img src="images/brands/brand3.jpg" alt="플레이모빌" class="brand-image">
            <div class="brand-info">
              <h4>플레이모빌</h4>
              <p>창의적인 역할놀이의 시작</p>
              <span class="brand-discount">기획세트 20% 할인</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="brand-card">
            <img src="images/brands/brand4.jpg" alt="반다이" class="brand-image">
            <div class="brand-info">
              <h4>반다이</h4>
              <p>인기 캐릭터 피규어의 세계</p>
              <span class="brand-discount">한정판 특가</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 베스트셀러 섹션 -->
  <section class="bestsellers-section py-5 bg-light">
    <div class="container">
      <h2 class="text-center mb-4">베스트셀러</h2>
      <div class="row">
        <div class="col-md-3 mb-4">
          <div class="product-card">
            <div class="product-badge">1</div>
            <img src="images/products/best1.jpg" alt="베스트상품1" class="product-image">
            <div class="product-info">
              <h5>레고 시티 경찰서</h5>
              <p class="product-price">89,900원</p>
              <div class="product-rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <span>(128)</span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="product-card">
            <div class="product-badge">2</div>
            <img src="images/products/best2.jpg" alt="베스트상품2" class="product-image">
            <div class="product-info">
              <h5>실바니안 패밀리 하우스</h5>
              <p class="product-price">65,000원</p>
              <div class="product-rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
                <span>(96)</span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="product-card">
            <div class="product-badge">3</div>
            <img src="images/products/best3.jpg" alt="베스트상품3" class="product-image">
            <div class="product-info">
              <h5>플레이모빌 우주선</h5>
              <p class="product-price">79,900원</p>
              <div class="product-rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <span>(156)</span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="product-card">
            <div class="product-badge">4</div>
            <img src="images/products/best4.jpg" alt="베스트상품4" class="product-image">
            <div class="product-info">
              <h5>반다이 건담 모델키트</h5>
              <p class="product-price">45,000원</p>
              <div class="product-rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
                <span>(82)</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 베스트 리뷰 섹션 -->
  <section class="best-reviews-section py-5">
    <div class="container">
      <h2 class="text-center mb-4">베스트 리뷰</h2>
      <div class="row">
        <div class="col-md-6 mb-4">
          <div class="review-card">
            <div class="review-header">
              <img src="images/reviews/user1.jpg" alt="사용자1" class="reviewer-image">
              <div class="reviewer-info">
                <h5>행복한엄마</h5>
                <div class="review-rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                </div>
              </div>
            </div>
            <div class="review-content">
              <p>아이가 정말 좋아해요! 조립하면서 창의력도 키우고 집중력도 향상되는 것 같아요.</p>
              <div class="review-images">
                <img src="images/reviews/review1-1.jpg" alt="리뷰이미지1">
                <img src="images/reviews/review1-2.jpg" alt="리뷰이미지2">
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6 mb-4">
          <div class="review-card">
            <div class="review-header">
              <img src="images/reviews/user2.jpg" alt="사용자2" class="reviewer-image">
              <div class="reviewer-info">
                <h5>장난감매니아</h5>
                <div class="review-rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star-half-alt"></i>
                </div>
              </div>
            </div>
            <div class="review-content">
              <p>퀄리티가 정말 좋아요. 가격대비 만족도가 매우 높습니다!</p>
              <div class="review-images">
                <img src="images/reviews/review2-1.jpg" alt="리뷰이미지3">
                <img src="images/reviews/review2-2.jpg" alt="리뷰이미지4">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-dark text-light py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h5>고객센터</h5>
          <p>1234-5678</p>
          <p>평일 09:00 - 18:00</p>
        </div>
        <div class="col-md-4">
          <h5>회사 정보</h5>
          <p>주소: 서울시 강남구 테헤란로</p>
          <p>이메일: info@tinyfing.com</p>
        </div>
        <div class="col-md-4">
          <h5>팔로우</h5>
          <div class="social-links">
            <!-- Social media links here -->
          </div>
        </div>
      </div>
    </div>
  </footer>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var swiper = new Swiper(".mainSwiper", {
      effect: "coverflow",
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: "auto",
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows: true,
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      autoplay: {
        delay: 3000,
        disableOnInteraction: false,
      },
    });
  });

  document.addEventListener('DOMContentLoaded', function() {
    // 선물 고민 해결 섹션 초기화
    const sections = [
      { id: 1, prefix: '[시즌한정팝업]', title: '무비 벌스 팝콘 프리실라 인형 미듐(M)' },
      { id: 2, prefix: '[시즌한정팝업]', title: '무비 벌스 팝콘 프리실라 인형 미듐(M)' },
      { id: 3, prefix: '[시즌한정팝업]', title: '무비 벌스 팝콘 프리실라 인형 미듐(M)' },
      { id: 4, prefix: '[시즌한정팝업]', title: '무비 벌스 팝콘 프리실라 인형 미듐(M)' },
      { id: 5, prefix: '[시즌한정팝업]', title: '무비 벌스 팝콘 프리실라 인형 미듐(M)' },
      { id: 6, prefix: '[시즌한정팝업]', title: '장아지와 고양이 필름 출력' },
      { id: 7, prefix: '[시즌한정팝업즈]', title: '무비 벌스 팝콘 프리실라 인형 미듐(M)'},
      { id: 8, prefix: '[보쉬토이_공식]', title: '보쉬 공구놀이 원톡세트' },
      { id: 9, prefix: '[시즌한정팝업]', title: '알파벳 샤르트퍼즐_NEW' },
      { id: 10, prefix: '[시즌한정팝업]', title: '곰 월드 스티커세트' }
    ];

    let currentPage = 1;
    let currentIndex = 0;
    const itemsPerPage = 5;
    let autoHighlightInterval;

    function createSectionItems() {
      const sectionList = document.getElementById('sectionList');
      const mainImage = document.querySelector('.section-image');
      const imageOverlay = document.querySelector('.image-overlay');

      sections.forEach((section, index) => {
        const li = document.createElement('li');
        li.className = 'section-item';
        if (Math.floor(index / itemsPerPage) + 1 === currentPage) {
          li.classList.add('visible');
        }

        let html = `
                    <div>
                        <span class="section-number">${section.id}</span>
                        <span class="section-prefix">${section.prefix}</span>
                        <span>${section.title}</span>
                    </div>
                `;

        if (section.hasImage) {
          html += `
                        <div class="product-info">
                            <div class="product-image-container">
                                <img src="images/products/product${section.id}.jpg" alt="${section.title}" class="product-image">
                                <div class="product-price">${section.price}</div>
                            </div>
                            <svg class="chevron-right" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M9 18l6-6-6-6" />
                            </svg>
                        </div>
                    `;
        }

        li.innerHTML = html;

        // Add click event listener
        li.addEventListener('click', () => {
          highlightItem(index);
        });

        sectionList.appendChild(li);
      });

      // Add pagination controls
      document.getElementById('prevPage').addEventListener('click', () => {
        if (currentPage > 1) {
          currentPage--;
          updatePageDisplay();
        }
      });

      document.getElementById('nextPage').addEventListener('click', () => {
        if (currentPage < 2) {
          currentPage++;
          updatePageDisplay();
        }
      });

      // Start auto-highlighting
      startAutoHighlight();
    }

    function updatePageDisplay() {
      document.querySelectorAll('.section-item').forEach((item, index) => {
        const itemPage = Math.floor(index / itemsPerPage) + 1;
        item.classList.toggle('visible', itemPage === currentPage);
      });
      document.getElementById('pageIndicator').textContent = `${currentPage}/2`;
    }

    function highlightItem(index) {
      const mainImage = document.querySelector('.section-image');
      const imageOverlay = document.querySelector('.image-overlay');
      const section = sections[index];

      // Update current index
      currentIndex = index;

      // Update page if necessary
      const itemPage = Math.floor(index / itemsPerPage) + 1;
      if (itemPage !== currentPage) {
        currentPage = itemPage;
        updatePageDisplay();
      }

      // Update image and overlay
      if (section.hasImage) {
        mainImage.src = `images/products/product${section.id}.jpg`;
        mainImage.alt = section.title;

        imageOverlay.innerHTML = `
                    <h3>${section.title}</h3>
                    <p>${section.price}</p>
                    <button class="btn btn-primary">자세히 보기</button>
                `;
      }

      // Update active state
      document.querySelectorAll('.section-item').forEach(item => {
        item.classList.remove('active');
      });
      document.querySelectorAll('.section-item')[index].classList.add('active');
    }

    function startAutoHighlight() {
      if (autoHighlightInterval) {
        clearInterval(autoHighlightInterval);
      }

      autoHighlightInterval = setInterval(() => {
        currentIndex++;
        if (currentIndex >= sections.length) {
          currentIndex = 0;
          currentPage = 1;
          updatePageDisplay();
        }
        highlightItem(currentIndex);
      }, 3000);
    }

    // Initialize the section items
    createSectionItems();
  });
</script>
</body>
</html>