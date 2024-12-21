<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<style>
    /* 로그인 페이지 스타일 */
    .login-container {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #FFF0F5;
        padding: 20px;
    }

    .login-box {
        background: white;
        border-radius: 20px;
        padding: 40px;
        width: 100%;
        max-width: 400px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }

    .login-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .login-header h1 {
        color: var(--primary-color);
        font-size: 28px;
        margin: 0;
    }

    .login-form {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .input-group {
        position: relative;
    }

    .input-group input {
        width: 100%;
        padding: 12px 15px;
        border: 2px solid #FFE4E1;
        border-radius: 25px;
        font-size: 14px;
        transition: border-color 0.3s;
    }

    .input-group input:focus {
        outline: none;
        border-color: var(--primary-color);
    }

    .login-options {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 14px;
    }

    .login-options label {
        display: flex;
        align-items: center;
        gap: 5px;
        color: #666;
    }

    .forgot-links {
        display: flex;
        gap: 10px;
        align-items: center;
    }

    .forgot-links a {
        color: #666;
        text-decoration: none;
        font-size: 14px;
    }

    .forgot-links span {
        color: #ccc;
    }

    .forgot-links a:hover {
        color: var(--primary-color);
    }

    .login-button,
    .register-button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 25px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .login-button {
        background-color: var(--primary-color);
        color: white;
    }

    .login-button:hover {
        background-color: var(--accent-color);
    }

    .register-button {
        background-color: white;
        color: var(--primary-color);
        border: 2px solid var(--primary-color);
        text-decoration: none;
        text-align: center;
    }

    .register-button:hover {
        background-color: var(--primary-color);
        color: white;
    }

    /* 반응형 디자인 */
    @media (max-width: 480px) {
        .login-box {
            padding: 30px 20px;
        }

        .login-options {
            flex-direction: column;
            gap: 15px;
        }

        .forgot-links {
            width: 100%;
            justify-content: center;
        }
    }
    /* 공통 스타일 */
    :root {
        --primary-color: #FF69B4;
        --secondary-color: #FFB6C1;
        --accent-color: #FF1493;
        --text-color: #333;
        --background-color: #FFF;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Noto Sans KR', sans-serif;
        color: var(--text-color);
        line-height: 1.6;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
    }

    /* 헤더 스타일 */
    header {
        background-color: var(--background-color);
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 1000;
    }

    .header-top {
        padding: 15px 0;
    }

    .header-top .container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 20px;
        flex-wrap: nowrap;
        min-width: 0;
    }

    .logo {
        flex-shrink: 0;
    }

    .logo h1 {
        color: var(--primary-color);
        font-size: 24px;
        margin: 0;
        white-space: nowrap;
    }

    .search-bar {
        flex: 0 1 300px;
        display: flex;
        gap: 10px;
        min-width: 200px;
    }

    .search-bar input {
        flex: 1;
        border: 2px solid var(--primary-color);
        padding: 8px 15px;
        border-radius: 20px;
        font-size: 14px;
        min-width: 0;
    }

    .search-bar button {
        background-color: var(--primary-color);
        color: white;
        border: none;
        border-radius: 20px;
        padding: 8px 20px;
        cursor: pointer;
        transition: background-color 0.3s;
        flex-shrink: 0;
    }

    .user-menu {
        display: flex;
        gap: 15px;
        align-items: center;
        flex-shrink: 0;
        white-space: nowrap;
    }

    .user-menu a {
        color: var(--text-color);
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s;
    }

    .user-menu a:hover {
        color: var(--primary-color);
    }

    .mypage-dropdown {
        position: relative;
    }

    .mypage-btn {
        cursor: pointer;
        padding: 5px 10px;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        top: 100%;
        right: 0;
        background-color: white;
        min-width: 150px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
        z-index: 1000;
    }

    .dropdown-content a {
        display: block;
        padding: 10px 15px;
        color: var(--text-color);
        transition: all 0.3s;
    }

    .dropdown-content a:hover {
        background-color: var(--secondary-color);
        color: white;
    }

    .mypage-dropdown:hover .dropdown-content {
        display: block;
        animation: fadeIn 0.3s ease;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* 메인 네비게이션 */
    .main-nav {
        flex: 1;
        white-space: nowrap;
        overflow-x: auto;
        -ms-overflow-style: none;
        scrollbar-width: none;
    }

    .main-nav::-webkit-scrollbar {
        display: none;
    }

    .main-nav ul {
        list-style: none;
        display: flex;
        justify-content: center;
        gap: 25px;
        margin: 0;
        padding: 0;
        flex-wrap: nowrap;
    }

    .main-nav li {
        flex-shrink: 0;
    }

    .main-nav a {
        color: var(--text-color);
        text-decoration: none;
        font-size: 15px;
        font-weight: 500;
        padding: 5px 0;
        transition: color 0.3s;
        white-space: nowrap;
    }

    .main-nav a:hover {
        color: var(--primary-color);
    }

    /* 메인 슬라이더 스타일 */
    .hero-section {
        position: relative;
        padding: 100px 0;
        background-color: var(--primary-color);
        color: white;
        text-align: center;
        overflow: hidden;
    }

    .hero-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(45deg, var(--primary-color), var(--accent-color));
        opacity: 0.8;
        z-index: 1;
    }

    .hero-section .container {
        position: relative;
        z-index: 2;
    }

    .hero-section h1 {
        font-family: 'Jua', sans-serif;
        font-size: 3.5rem;
        margin-bottom: 1.5rem;
        animation: fadeInUp 1s ease;
    }

    .hero-section p {
        font-size: 1.2rem;
        margin-bottom: 2rem;
        animation: fadeInUp 1s ease 0.2s;
    }

    /* 카테고리 카드 스타일 */
    .category-card {
        background: white;
        border-radius: 15px;
        padding: 2rem;
        text-align: center;
        transition: all 0.3s ease;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    .category-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 25px rgba(255,105,180,0.2);
    }

    .category-card h4 {
        color: var(--accent-color);
        font-family: 'Jua', sans-serif;
        margin-bottom: 1rem;
    }

    /* 상품 카드 스타일 */
    .product-card {
        background: white;
        border-radius: 15px;
        overflow: hidden;
        transition: all 0.3s ease;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        margin-bottom: 2rem;
    }

    .product-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 25px rgba(255,105,180,0.2);
    }

    .product-thumb {
        position: relative;
        overflow: hidden;
    }

    .product-thumb img {
        transition: transform 0.3s ease;
    }

    .product-card:hover .product-thumb img {
        transform: scale(1.1);
    }

    .product-info {
        padding: 1.5rem;
    }

    .product-title {
        color: var(--text-color);
        font-size: 1.1rem;
        margin-bottom: 0.5rem;
    }

    .product-price {
        color: var(--primary-color);
        font-size: 1.2rem;
        font-weight: bold;
    }

    /* 선물 고민 해결 섹션 스타일 */
    .gift-suggestion-section {
        background-color: #fff;
        padding: 40px 0;
    }

    .section-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .section-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px;
        cursor: pointer;
        transition: background-color 0.2s;
        border-bottom: 1px solid #eee;
    }

    .section-item:hover {
        background-color: #f8f9fa;
    }

    .section-number {
        color: #6c757d;
        margin-right: 8px;
    }

    .section-prefix {
        color: #FF69B4;
        margin-right: 4px;
        font-weight: 500;
    }

    .product-info {
        display: flex;
        align-items: center;
        gap: 16px;
    }

    .product-image-container {
        text-align: right;
    }

    .product-image {
        width: 64px;
        height: 64px;
        object-fit: cover;
        border-radius: 4px;
    }

    .product-price {
        margin-top: 4px;
        font-weight: 500;
        color: #1a202c;
    }

    .chevron-right {
        width: 20px;
        height: 20px;
        color: #a0aec0;
    }

    /* 선물 고민 해결 섹션 스타일 업데이트 */
    .section-list-wrapper {
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        height: 100%;
        min-height: 400px;
        overflow: hidden;
    }

    .section-image-wrapper {
        position: relative;
        height: 100%;
        min-height: 400px;
        border-radius: 10px;
        overflow: hidden;
    }

    .section-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .section-image-wrapper:hover .section-image {
        transform: scale(1.05);
    }

    .image-overlay {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        padding: 30px;
        background: linear-gradient(transparent, rgba(0,0,0,0.7));
        color: white;
        text-align: center;
    }

    .image-overlay h3 {
        font-size: 1.5rem;
        margin-bottom: 10px;
        font-weight: bold;
    }

    .image-overlay p {
        font-size: 1.1rem;
        margin-bottom: 15px;
    }

    .image-overlay .btn {
        background-color: #FF69B4;
        border: none;
        padding: 10px 20px;
        transition: background-color 0.3s ease;
    }

    .image-overlay .btn:hover {
        background-color: #FF1493;
    }

    @media (max-width: 768px) {
        .section-list-wrapper,
        .section-image-wrapper {
            min-height: 300px;
            margin-bottom: 20px;
        }
    }

    /* 푸터 스타일 */
    footer {
        background-color: #f5f5f5;
        padding: 40px 0;
        margin-top: 50px;
    }

    .footer-links a {
        color: var(--text-color);
        text-decoration: none;
        transition: color 0.3s;
    }

    .footer-links a:hover {
        color: var(--primary-color);
    }

    /* 애니메이션 */
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* 브랜드 픽 섹션 스타일 */
    .brand-picks-section {
        background-color: #fff;
    }

    .brand-card {
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        overflow: hidden;
        transition: transform 0.3s ease;
    }

    .brand-card:hover {
        transform: translateY(-5px);
    }

    .brand-image {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    .brand-info {
        padding: 15px;
    }

    .brand-info h4 {
        color: #333;
        margin-bottom: 8px;
    }

    .brand-info p {
        color: #666;
        font-size: 0.9rem;
        margin-bottom: 8px;
    }

    .brand-discount {
        display: inline-block;
        background: #FF69B4;
        color: white;
        padding: 4px 8px;
        border-radius: 4px;
        font-size: 0.8rem;
    }

    /* 베스트셀러 섹션 스타일 */
    .best-seller-card {
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        overflow: hidden;
        position: relative;
        transition: transform 0.3s ease;
    }

    .best-seller-card:hover {
        transform: translateY(-5px);
    }

    .product-badge {
        position: absolute;
        top: 10px;
        left: 10px;
        background: #FF69B4;
        color: white;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        font-size: 1.1rem;
    }

    .product-image {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    .product-info {
        padding: 15px;
    }

    .product-info h5 {
        color: #333;
        margin-bottom: 8px;
    }

    .product-price {
        color: #FF69B4;
        font-weight: bold;
        font-size: 1.1rem;
        margin-bottom: 8px;
    }

    .product-rating {
        color: #ffd700;
    }

    .product-rating span {
        color: #666;
        margin-left: 5px;
    }

    /* 베스트 리뷰 섹션 스타일 */
    .review-card {
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        padding: 20px;
        height: 100%;
    }

    .review-header {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }

    .reviewer-image {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 15px;
        object-fit: cover;
    }

    .reviewer-info h5 {
        margin: 0;
        color: #333;
    }

    .review-rating {
        color: #ffd700;
        margin-top: 5px;
    }

    .review-content p {
        color: #666;
        margin-bottom: 15px;
        font-size: 0.95rem;
        line-height: 1.6;
    }

    .review-images {
        display: flex;
        gap: 10px;
    }

    .review-images img {
        width: calc(50% - 5px);
        height: 120px;
        object-fit: cover;
        border-radius: 5px;
    }

    /* 반응형 스타일 */
    @media (max-width: 768px) {
        .brand-card, .best-seller-card, .review-card {
            margin-bottom: 20px;
        }

        .review-images img {
            height: 100px;
        }
    }

    /* Hero Section */
    .hero-section {
        background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url('../images/toys-banner.jpg');
        background-size: cover;
        background-position: center;
        height: 60vh;
        display: flex;
        align-items: center;
        color: white;
    }

    /* Product Cards */
    .product-card {
        transition: transform 0.3s;
        margin-bottom: 20px;
        border: none;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .product-card:hover {
        transform: translateY(-5px);
    }

    /* Category Cards */
    .category-card {
        border: none;
        background: #f8f9fa;
        text-align: center;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 10px;
        transition: all 0.3s;
    }

    .category-card:hover {
        background: #e9ecef;
        transform: translateY(-5px);
    }

    /* Navigation */
    .navbar-brand {
        font-size: 1.5rem;
        font-weight: bold;
        color: #ff6b6b !important;
    }

    /* Pricing */
    .price {
        color: #ff6b6b;
        font-weight: bold;
        font-size: 1.2rem;
    }

    /* Section Items */
    .section-item {
        cursor: pointer;
        transition: background-color 0.3s ease;
        padding: 15px;
        border-bottom: 1px solid #eee;
        display: none;
    }

    .section-item:hover {
        background-color: #f8f9fa;
    }

    .section-item.active {
        background-color: #e9ecef;
        border-left: 4px solid #007bff;
    }

    .section-item.visible {
        display: block;
    }

    /* Section List */
    .section-list-wrapper {
        position: relative;
        padding-bottom: 50px;
    }

    .section-list {
        height: 400px;
        overflow-y: auto;
    }

    /* Pagination Controls */
    .pagination-controls {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 15px;
        padding: 10px;
    }

    /* Badges */
    .badge-new,
    .badge-event {
        display: inline-block;
        padding: 2px 8px;
        border-radius: 12px;
        font-size: 0.8em;
        font-weight: bold;
        margin-left: 5px;
        animation: pulse 2s infinite;
    }

    .badge-new {
        background-color: #ff6b6b;
        color: white;
    }

    .badge-event {
        background-color: #339af0;
        color: white;
    }

    @keyframes pulse {
        0% {
            transform: scale(1);
        }
        50% {
            transform: scale(1.1);
        }
        100% {
            transform: scale(1);
        }
    }

</style>
<body>
<div class="login-container">
    <div class="login-box">
        <div class="login-header">
            <a href="../index.html" class="logo">
                <h1>티니핑 토이샵</h1>
            </a>
        </div>
        <form class="login-form">
            <div class="input-group">
                <input type="text" placeholder="아이디" required>
            </div>
            <div class="input-group">
                <input type="password" placeholder="비밀번호" required>
            </div>
            <div class="login-options">
                <label>
                    <input type="checkbox"> 아이디 저장
                </label>
                <div class="forgot-links">
                    <a href="find_id">아이디 찾기</a>
                    <span>|</span>
                    <a href="find-password.html">비밀번호 찾기</a>
                </div>
            </div>
            <button type="submit" class="login-button">로그인</button>
            <a href="signup.jsp" class="register-button">회원가입</a>
        </form>
    </div>
</div>
</body>
</html>