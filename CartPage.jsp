<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 24. 12. 4.
  Time: 오전 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>장바구니 - 티니핑 토이샵</title>

</head>
<style>
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
    padding-top: 120px; /* 헤더 높이만큼 여백 추가 */
  }

  a{
    text-decoration: none;
    color: var(--text-color);
  }

  .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
  }

  /* Header Styles */
  .header-top {
    background-color: white;
    padding: 0;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
  }

  .header-top .container {
    display: flex;
    flex-direction: column;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1rem;
  }

  /* 상단 영역 (로고, 검색바, 유저메뉴) */
  .header-upper {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 1rem 0;
    border-bottom: 1px solid #eee;
  }

  .logo {
    flex: 0 0 auto;
  }

  .logo h1 {
    color: var(--primary-color, #FF69B4);
    font-size: 1.8rem;
    margin: 0;
    white-space: nowrap;
  }

  .search-container {
    position: relative;
    flex: 0 1 400px;
    margin: 0 2rem;
  }

  .search-bar {
    display: flex;
    gap: 0.5rem;
    width: 100%;
  }

  .search-bar input {
    flex: 1;
    padding: 0.8rem 1rem;
    border: 2px solid var(--primary-color);
    border-radius: 20px;
    font-size: 0.9rem;
    transition: all 0.3s ease;
  }

  .search-bar input:focus {
    outline: none;
    box-shadow: 0 0 0 3px rgba(255, 105, 180, 0.2);
  }

  .search-bar button {
    background-color: var(--primary-color);
    color: white;
    border: none;
    padding: 0.5rem 1.5rem;
    border-radius: 20px;
    cursor: pointer;
    transition: background-color 0.3s;
  }

  .search-bar button:hover {
    background-color: #ff4da6;
  }

  .search-dropdown {
    position: absolute;
    top: calc(100% + 8px);
    left: 0;
    right: 0;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    padding: 1rem;
    z-index: 1000;
    border: 1px solid #f0f0f0;
    display: none;
  }

  .search-dropdown.show {
    display: block;
  }

  .search-bar input:focus ~ .search-dropdown {
    display: block;
  }

  .popular-searches h3 {
    color: #666;
    font-size: 0.85rem;
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 1px solid #f0f0f0;
  }

  .popular-searches ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 0.8rem;
  }

  .popular-searches li {
    padding: 0.3rem 0;
  }

  .popular-searches a {
    display: flex;
    align-items: center;
    gap: 0.8rem;
    color: var(--text-color);
    text-decoration: none;
    font-size: 0.9rem;
    transition: all 0.2s;
    padding: 0.5rem;
    border-radius: 6px;
  }

  .popular-searches a:hover {
    background-color: #fff0f5;
    color: var(--primary-color);
  }

  .popular-searches .rank {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 24px;
    height: 24px;
    background-color: #fff0f5;
    color: var(--primary-color);
    border-radius: 50%;
    font-weight: bold;
    font-size: 0.8rem;
  }

  .popular-searches li:nth-child(-n+3) .rank {
    background-color: var(--primary-color);
    color: white;
  }

  .user-menu {
    display: flex;
    align-items: center;
    gap: 1.5rem;
    flex: 0 0 auto;
    white-space: nowrap;
  }

  .user-menu a {
    color: var(--text-color, #333);
    text-decoration: none;
    font-size: 0.9rem;
  }

  .user-menu a:hover {
    color: var(--primary-color, #FF69B4);
  }

  .cart-icon {
    position: relative;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 1rem;
    color: var(--text-color);
    text-decoration: none;
    font-size: 0.9rem;
  }

  .cart-icon i {
    font-size: 1.2rem;
    color: var(--primary-color);
  }

  .cart-count {
    position: absolute;
    top: 0;
    right: 0;
    background-color: var(--accent-color, #FF1493);
    color: white;
    font-size: 0.7rem;
    padding: 0.2rem 0.4rem;
    border-radius: 50%;
    min-width: 18px;
    height: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  /* 하단 영역 (메인 네비게이션) */
  .header-lower {
    padding: 1rem 0;
  }

  .main-nav {
    display: flex;
    justify-content: center;
  }

  .main-nav ul {
    display: flex;
    align-items: center;
    gap: 2.5rem;
    list-style: none;
    margin: 0;
    padding: 0;
  }

  .main-nav li {
    white-space: nowrap;
  }

  .main-nav a {
    color: var(--text-color, #333);
    text-decoration: none;
    font-weight: 500;
    position: relative;
    font-size: 1rem;
  }

  .main-nav a:hover {
    color: var(--primary-color, #FF69B4);
  }

  /* Responsive adjustments */
  @media (max-width: 992px) {
    .header-upper {
      flex-wrap: wrap;
      gap: 1rem;
    }

    .search-container {
      order: 3;
      flex: 1 1 100%;
      margin: 0;
    }

    .user-menu {
      gap: 1rem;
    }

    .main-nav ul {
      gap: 1.5rem;
      flex-wrap: wrap;
      justify-content: center;
    }
  }

  @media (max-width: 768px) {
    .main-nav ul {
      gap: 1rem;
    }

    .main-nav a {
      font-size: 0.9rem;
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

  /* 마이페이지 드롭다운 스타일 */
  .mypage-dropdown {
    position: relative;
    display: inline-block;
  }

  .mypage-btn {
    padding: 0.5rem 1rem;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  .mypage-btn::after {
    content: '▼';
    font-size: 0.8em;
    margin-left: 0.3rem;
    transition: transform 0.3s;
  }

  .mypage-dropdown:hover .mypage-btn::after {
    transform: rotate(180deg);
  }

  .dropdown-content {
    display: none;
    position: absolute;
    top: 100%;
    right: 0;
    background-color: white;
    min-width: 180px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    border-radius: 8px;
    padding: 0.5rem 0;
    z-index: 1000;
    animation: dropdownFade 0.3s ease;
  }

  @keyframes dropdownFade {
    from {
      opacity: 0;
      transform: translateY(-10px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  .mypage-dropdown:hover .dropdown-content {
    display: block;
  }

  .dropdown-content a {
    display: flex !important;
    align-items: center;
    padding: 0.7rem 1.2rem;
    color: var(--text-color);
    text-decoration: none;
    transition: all 0.2s;
  }

  .dropdown-content a i {
    margin-right: 0.8rem;
    color: var(--primary-color);
    font-size: 1rem;
    width: 20px;
    text-align: center;
  }

  .dropdown-content a:hover {
    background-color: var(--background-color);
    color: var(--primary-color);
  }

  .dropdown-content a:not(:last-child) {
    border-bottom: 1px solid #f5f5f5;
  }

  /* 아이디/비밀번호 찾기 페이지 공통 스타일 */
  .find-container {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #FFF0F5;
    padding: 20px;
  }

  .find-box {
    background: white;
    border-radius: 20px;
    padding: 40px;
    width: 100%;
    max-width: 500px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
  }

  .find-header {
    text-align: center;
    margin-bottom: 30px;
  }

  .find-header h1 {
    color: var(--primary-color);
    font-size: 28px;
    margin: 0;
  }

  .find-header p {
    color: #666;
    margin-top: 10px;
    font-size: 18px;
  }

  .find-form {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }

  /* 탭 스타일 */
  .method-tabs {
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
  }

  .method-tab {
    flex: 1;
    padding: 12px;
    border: none;
    background-color: #f5f5f5;
    color: #666;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s;
    border-radius: 10px;
  }

  .method-tab.active {
    background-color: var(--primary-color);
    color: white;
  }

  /* 입력 필드 스타일 */
  .method-content {
    display: none;
  }

  .method-content.active {
    display: block;
  }

  .input-group {
    display: flex;
    flex-direction: column;
    gap: 8px;
    margin-bottom: 15px;
  }

  .input-group label {
    font-size: 14px;
    font-weight: 500;
    color: #333;
  }

  .input-with-button {
    display: flex;
    gap: 10px;
  }

  .input-with-button input {
    flex: 1;
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

  .verify-button {
    padding: 0 20px;
    background-color: white;
    border: 2px solid var(--primary-color);
    border-radius: 25px;
    color: var(--primary-color);
    font-size: 14px;
    cursor: pointer;
    transition: all 0.3s;
    white-space: nowrap;
  }

  .verify-button:hover {
    background-color: var(--primary-color);
    color: white;
  }

  /* 찾기 버튼 */
  .find-button {
    width: 100%;
    padding: 15px;
    background-color: var(--primary-color);
    color: white;
    border: none;
    border-radius: 25px;
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-top: 10px;
  }

  .find-button:hover {
    background-color: var(--accent-color);
  }

  /* 추가 링크 */
  .additional-links {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-top: 20px;
  }

  .additional-links a {
    color: #666;
    text-decoration: none;
    font-size: 14px;
  }

  .additional-links span {
    color: #ccc;
  }

  .additional-links a:hover {
    color: var(--primary-color);
  }

  /* 아이디/비밀번호 찾기 반응형 디자인 */
  @media (max-width: 480px) {
    .find-box {
      padding: 30px 20px;
    }

    .input-with-button {
      flex-direction: column;
    }

    .verify-button {
      width: 100%;
      padding: 12px;
    }

    .method-tabs {
      flex-direction: column;
    }
  }

  /* 결제 완료 페이지 스타일 */
  .payment-complete-main {
    padding: 40px 0;
    background-color: #FFF0F5;
    min-height: calc(100vh - 200px);
  }

  /* 완료 메시지 */
  .complete-message {
    text-align: center;
    margin-bottom: 40px;
    padding: 40px;
    background-color: white;
    border-radius: 15px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  }

  .complete-icon {
    width: 80px;
    height: 80px;
    margin-bottom: 20px;
  }

  .complete-message h1 {
    font-size: 28px;
    color: var(--primary-color);
    margin-bottom: 15px;
  }

  .order-number {
    font-size: 16px;
    color: #666;
  }

  .order-number span {
    font-weight: 700;
    color: #333;
  }

  /* 주문 내역 */
  .order-item {
    display: flex;
    gap: 20px;
    padding: 20px;
    background-color: #FFF0F5;
    border-radius: 10px;
  }

  .product-image {
    width: 100px;
    height: 100px;
    object-fit: cover;
    border-radius: 8px;
  }

  .item-details h3 {
    font-size: 18px;
    margin-bottom: 10px;
  }

  .item-details p {
    color: #666;
    margin: 5px 0;
  }

  .item-details .price {
    font-weight: 700;
    color: var(--accent-color);
  }

  /* 배송 정보 & 결제 정보 */
  .info-content dl {
    display: grid;
    grid-template-columns: 120px 1fr;
    gap: 15px;
  }

  .info-content dt {
    color: #666;
    font-weight: 500;
  }

  .info-content dd {
    color: #333;
  }

  .info-content .total {
    font-size: 18px;
    font-weight: 700;
    color: var(--accent-color);
    margin-top: 15px;
    padding-top: 15px;
    border-top: 2px solid #FFE4E1;
  }

  /* 버튼 그룹 */
  .button-group {
    display: flex;
    gap: 15px;
    justify-content: center;
    margin-top: 40px;
  }

  .button-group button {
    padding: 15px 30px;
    font-size: 16px;
    font-weight: 700;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s;
  }

  .btn-order-detail {
    background-color: white;
    border: 2px solid var(--primary-color);
    color: var(--primary-color);
  }

  .btn-continue-shopping {
    background-color: var(--primary-color);
    border: none;
    color: white;
  }

  .btn-order-detail:hover {
    background-color: var(--primary-color);
    color: white;
  }

  .btn-continue-shopping:hover {
    background-color: var(--accent-color);
  }

  /* 결제 완료 페이지 반응형 디자인 */
  @media (max-width: 768px) {
    .payment-complete-main {
      padding: 20px 0;
    }

    .complete-message {
      padding: 30px 20px;
    }

    .complete-icon {
      width: 60px;
      height: 60px;
    }

    .complete-message h1 {
      font-size: 24px;
    }

    .info-content dl {
      grid-template-columns: 100px 1fr;
      gap: 10px;
    }

    .button-group {
      flex-direction: column;
    }

    .button-group button {
      width: 100%;
    }
  }

  @media (max-width: 480px) {
    .order-item {
      flex-direction: column;
      align-items: center;
      text-align: center;
    }

    .product-image {
      margin-bottom: 15px;
    }
  }

  /* 장바구니 페이지 스타일 */
  .cart-main {
    padding: 40px 0;
    background-color: #FFF0F5;
    min-height: calc(100vh - 200px);
  }

  /* 장바구니 콘텐츠 레이아웃 */
  .cart-content {
    display: grid;
    grid-template-columns: 1fr 300px;
    gap: 20px;
    margin-bottom: 40px;
  }

  /* 장바구니 상품 목록 */
  .cart-items {
    background: white;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  }

  .select-all {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
    border-bottom: 2px solid #FFE4E1;
    margin-bottom: 20px;
  }

  .select-all label {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
  }

  .btn-delete-selected {
    padding: 8px 15px;
    background-color: white;
    border: 1px solid #FFB6C1;
    color: #FF69B4;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s;
  }

  .btn-delete-selected:hover {
    background-color: #FFB6C1;
    color: white;
  }

  /* 장바구니 아이템 */
  .cart-item {
    display: grid;
    grid-template-columns: auto auto 1fr auto;
    gap: 20px;
    padding: 20px;
    border-bottom: 1px solid #FFE4E1;
    align-items: center;
  }

  .cart-item:last-child {
    border-bottom: none;
  }

  .item-checkbox {
    display: flex;
    align-items: center;
  }

  .item-image img {
    width: 100px;
    height: 100px;
    object-fit: cover;
    border-radius: 8px;
  }

  .item-info {
    display: flex;
    flex-direction: column;
    gap: 8px;
  }

  .product-name {
    font-size: 18px;
    font-weight: 500;
  }

  .product-option {
    color: #666;
    font-size: 14px;
  }

  .quantity-control {
    display: flex;
    align-items: center;
    gap: 8px;
    margin: 10px 0;
  }

  .quantity-control button {
    width: 30px;
    height: 30px;
    border: 1px solid #FFB6C1;
    background-color: white;
    color: #FF69B4;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s;
  }

  .quantity-control button:hover {
    background-color: #FFB6C1;
    color: white;
  }

  .quantity-input {
    width: 50px;
    height: 30px;
    text-align: center;
    border: 1px solid #FFB6C1;
    border-radius: 5px;
  }

  .btn-remove {
    background: none;
    border: none;
    color: #999;
    font-size: 24px;
    cursor: pointer;
    padding: 5px;
  }

  .btn-remove:hover {
    color: var(--accent-color);
  }

  /* 주문 요약 */
  .order-summary {
    background: white;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    position: sticky;
    top: 20px;
  }

  .order-summary h2 {
    font-size: 20px;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #FFE4E1;
  }

  .summary-content dl {
    display: grid;
    grid-template-columns: 1fr auto;
    gap: 15px;
    margin-bottom: 20px;
  }

  .summary-content dt {
    color: #666;
  }

  .summary-content dd {
    text-align: right;
    font-weight: 500;
  }

  .total-label, .total-price {
    font-size: 18px;
    font-weight: 700;
    color: var(--accent-color);
    margin-top: 15px;
    padding-top: 15px;

  }

  .btn-order {
    width: 100%;
    padding: 15px;
    background-color: var(--primary-color);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s;
  }

  .btn-order:hover {
    background-color: var(--accent-color);
  }

  /* 추천 상품 섹션 */
  .recommended-products {
    background: white;
    border-radius: 15px;
    padding: 30px;
    margin-top: 40px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  }

  .recommended-products h2 {
    font-size: 24px;
    color: var(--primary-color);
    margin-bottom: 20px;
    text-align: center;
  }

  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 20px;
  }

  /* 장바구니 반응형 디자인 */
  @media (max-width: 992px) {
    .cart-content {
      grid-template-columns: 1fr;
    }

    .order-summary {
      position: static;
    }
  }

  @media (max-width: 768px) {
    .cart-item {
      grid-template-columns: auto 1fr;
      gap: 15px;
    }

    .item-checkbox {
      grid-column: 1;
      grid-row: 1;
    }

    .item-image {
      grid-column: 2;
      grid-row: 1;
    }

    .item-info {
      grid-column: 1 / -1;
      grid-row: 2;
    }

    .btn-remove {
      position: absolute;
      top: 10px;
      right: 10px;
    }

    .product-grid {
      grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
    }
  }

  @media (max-width: 480px) {
    .cart-main {
      padding: 20px 0;
    }

    .page-title {
      font-size: 24px;
    }

    .cart-items {
      padding: 15px;
    }

    .cart-item {
      padding: 15px;
    }

    .item-image img {
      width: 80px;
      height: 80px;
    }

    .product-name {
      font-size: 16px;
    }
  }

  /* 이벤트 페이지 스타일 */
  .events-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
  }

  /* 이벤트 탭 스타일 */
  .event-tabs {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-bottom: 40px;
  }

  .event-tab {
    padding: 12px 24px;
    border: none;
    background: #f0f0f0;
    border-radius: 25px;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s;
  }

  .event-tab.active {
    background: var(--primary-color);
    color: white;
  }

  /* 메인 이벤트 스타일 */
  .featured-event {
    margin-bottom: 50px;
    background: white;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
  }

  .featured-event-image {
    position: relative;
    width: 100%;
    height: 400px;
  }

  .featured-event-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .event-badge {
    position: absolute;
    top: 20px;
    left: 20px;
    background: var(--primary-color);
    color: white;
    padding: 8px 16px;
    border-radius: 20px;
    font-weight: bold;
  }

  .event-period {
    position: absolute;
    bottom: 20px;
    right: 20px;
    background: rgba(0,0,0,0.7);
    color: white;
    padding: 8px 16px;
    border-radius: 20px;
    font-size: 14px;
  }

  .featured-event-info {
    padding: 30px;
  }

  .featured-event-info h2 {
    font-size: 24px;
    margin-bottom: 15px;
    color: #333;
  }

  .event-description {
    color: #666;
    margin-bottom: 20px;
    line-height: 1.6;
  }

  .view-details {
    background: var(--primary-color);
    color: white;
    border: none;
    padding: 12px 24px;
    border-radius: 25px;
    cursor: pointer;
    transition: background-color 0.3s;
  }

  .view-details:hover {
    background: var(--accent-color);
  }

  /* 이벤트 그리드 스타일 */
  .event-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 30px;
    margin-bottom: 40px;
  }

  .event-item {
    background: white;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    transition: transform 0.3s;
  }

  .event-item:hover {
    transform: translateY(-5px);
  }

  .event-item-image {
    position: relative;
    width: 100%;
    padding-top: 60%;
  }

  .event-item-image img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .event-item-info {
    padding: 20px;
  }

  .event-item-info h3 {
    font-size: 18px;
    margin-bottom: 10px;
    color: #333;
  }

  .event-date {
    color: #666;
    font-size: 14px;
    margin-bottom: 15px;
  }

  /* 이벤트 모달 스타일 */
  .event-modal {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0,0,0,0.5);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 1000;
  }

  .modal-content {
    background: white;
    width: 90%;
    max-width: 800px;
    max-height: 90vh;
    overflow-y: auto;
    border-radius: 15px;
    padding: 30px;
    position: relative;
  }

  .close-modal {
    position: absolute;
    top: 15px;
    right: 15px;
    background: none;
    border: none;
    font-size: 24px;
    cursor: pointer;
    color: #666;
  }

  .event-details img {
    width: 100%;
    border-radius: 10px;
    margin-bottom: 20px;
  }

  /* 이벤트 페이지 반응형 디자인 */
  @media (max-width: 768px) {
    .event-tabs {
      flex-direction: column;
      align-items: center;
    }

    .event-tab {
      width: 100%;
      max-width: 300px;
      text-align: center;
    }

    .featured-event-image {
      height: 300px;
    }

    .event-grid {
      grid-template-columns: 1fr;
    }
  }

  @media (max-width: 480px) {
    .events-container {
      padding: 10px;
    }

    .page-title {
      font-size: 24px;
      margin-bottom: 20px;
    }

    .featured-event-image {
      height: 200px;
    }

    .featured-event-info {
      padding: 20px;
    }

    .featured-event-info h2 {
      font-size: 20px;
    }

    .event-badge,
    .event-period {
      font-size: 12px;
      padding: 6px 12px;
    }
  }

</style>
<body>
<form action="/emotioncastle/CatchTinniping/CartPage" method="post">
<header>
  <div class="header-top">
    <div class="container">
      <div class="header-upper">
        <div class="logo">
          <h1>티니핑 토이샵</h1>
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
          <a href="pages/login.html">로그인</a>
          <a href="pages/register.html">회원가입</a>
          <a href="pages/cart.html" class="cart-icon">
            <i class="fas fa-shopping-cart"></i>
            <span class="cart-count">0</span>
          </a>
          <div class="mypage-dropdown">
            <a href="mypage.html" class="mypage-btn">마이페이지 <i class="fas fa-user"></i></a>
            <div class="dropdown-content">
              <a href="pages/orders.html"><i class="fas fa-box"></i>주문내역</a>
              <a href="pages/wishlist.html"><i class="fas fa-heart"></i>찜 목록</a>
              <a href="pages/board.html"><i class="fas fa-comments"></i>1:1 문의</a>
              <a href="pages/profile.html"><i class="fas fa-user-cog"></i>회원정보</a>
            </div>
          </div>
        </div>
      </div>
      <div class="header-lower">
        <nav class="main-nav">
          <ul>
            <li>
              <a href="pages/new-products.html">NEW</a>
            </li>
            <li><a href="pages/best-products.html">BEST</a></li>
            <li><a href="pages/catch-tinyfing.html">캐치 티니핑</a></li>
            <li><a href="pages/tinyfing-world.html">티니핑 월드</a></li>
            <li><a href="pages/tinyfing-clothes.html">티니핑 의류</a></li>
            <li><a href="pages/tinyfing-goods.html">티니핑 굿즈</a></li>
            <li>
              <a href="pages/events.html">EVENT</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</header>
<main class="cart-main">
  <div class="container">
    <h1 class="page-title">장바구니</h1>

    <div class="cart-content">
      <!-- 장바구니 상품 목록 -->
      <section class="cart-items">
        <div class="select-all">
          <label>
            <input type="checkbox" id="select-all-items">
            <span>전체선택</span>
          </label>
          <button type="button" class="btn-delete-selected">선택삭제</button>
        </div>

        <div class="item-list">
          <!-- 장바구니 아이템 -->
          <div class="cart-item" data-item-id="1">
            <div class="item-checkbox">
              <input type="checkbox" class="item-select" checked>
            </div>
            <div class="item-image">
              <img src="../images/product-sample.jpg" alt="상품 이미지">
            </div>
            <div class="item-info">
              <h3 class="product-name">핑크 테디베어 인형</h3>
              <p class="product-option">옵션: 대형 / 라이트 핑크</p>
              <div class="quantity-control">
                <button type="button" class="btn-decrease">-</button>
                <input type="number" value="1" min="1" max="99" class="quantity-input">
                <button type="button" class="btn-increase">+</button>
              </div>
              <p class="price">50,000원</p>
            </div>
            <button type="button" class="btn-remove">×</button>
          </div>

          <div class="cart-item" data-item-id="2">
            <div class="item-checkbox">
              <input type="checkbox" class="item-select" checked>
            </div>
            <div class="item-image">
              <img src="../images/product-sample2.jpg" alt="상품 이미지">
            </div>
            <div class="item-info">
              <h3 class="product-name">핑크 토끼 인형</h3>
              <p class="product-option">옵션: 중형 / 딥 핑크</p>
              <div class="quantity-control">
                <button type="button" class="btn-decrease">-</button>
                <input type="number" value="2" min="1" max="99" class="quantity-input">
                <button type="button" class="btn-increase">+</button>
              </div>
              <p class="price">35,000원</p>
            </div>
            <button type="button" class="btn-remove">×</button>
          </div>
        </div>
      </section>

      <!-- 주문 요약 -->
      <section class="order-summary">
        <h2>주문 요약</h2>
        <div class="summary-content">
          <dl>
            <dt>상품금액</dt>
            <dd class="subtotal">120,000원</dd>

            <dt>할인예상금액</dt>
            <dd class="discount">-5,000원</dd>

            <dt class="total-label">결제예상금액</dt>
            <dd class="total-price">118,000원</dd>
          </dl>

          <button type="button" class="btn-order">
            <span class="selected-count">2</span>개 상품 주문하기
          </button>
        </div>

        <div class="point-info">
          <p>주문 시 <span class="earning-points">1,180</span>P 적립예정</p>
        </div>
      </section>
    </div>
  </div>
</main>

<footer>
  <!-- 푸터 내용은 common.js에서 동적으로 삽입될테야 -->
</footer>

<script src="../js/common.js"></script>
  <script>
  document.addEventListener('DOMContentLoaded', function() {
  // 장바구니 아이템 데이터 (실제로는 서버나 로컬 스토리지에서 가져올 데이터)
  let cartItems = [
  {
  id: 1,
  name: '핑크 테디베어 인형',
  option: '대형 / 라이트 핑크',
  price: 50000,
  quantity: 1,
  image: '../images/product-sample.jpg',
  selected: true
  },
  {
  id: 2,
  name: '핑크 토끼 인형',
  option: '중형 / 딥 핑크',
  price: 35000,
  quantity: 2,
  image: '../images/product-sample2.jpg',
  selected: true
  }
  ];

  // 전체 선택 체크박스 처리
  const selectAllCheckbox = document.getElementById('select-all-items');
  const itemCheckboxes = document.querySelectorAll('.item-select');

  selectAllCheckbox.addEventListener('change', function() {
  itemCheckboxes.forEach(checkbox => {
  checkbox.checked = this.checked;
  const itemId = parseInt(checkbox.closest('.cart-item').dataset.itemId);
  updateItemSelection(itemId, this.checked);
  });
  updateOrderSummary();
  });

  itemCheckboxes.forEach(checkbox => {
  checkbox.addEventListener('change', function() {
  const allChecked = Array.from(itemCheckboxes).every(cb => cb.checked);
  selectAllCheckbox.checked = allChecked;

  const itemId = parseInt(this.closest('.cart-item').dataset.itemId);
  updateItemSelection(itemId, this.checked);
  updateOrderSummary();
  });
  });

  // 수량 조절 버튼 처리
  const quantityControls = document.querySelectorAll('.quantity-control');
  quantityControls.forEach(control => {
  const decreaseBtn = control.querySelector('.btn-decrease');
  const increaseBtn = control.querySelector('.btn-increase');
  const quantityInput = control.querySelector('.quantity-input');
  const itemId = parseInt(control.closest('.cart-item').dataset.itemId);

  decreaseBtn.addEventListener('click', () => {
  if (quantityInput.value > 1) {
  quantityInput.value = parseInt(quantityInput.value) - 1;
  updateItemQuantity(itemId, parseInt(quantityInput.value));
  }
  });

  increaseBtn.addEventListener('click', () => {
  if (quantityInput.value < 99) {
  quantityInput.value = parseInt(quantityInput.value) + 1;
  updateItemQuantity(itemId, parseInt(quantityInput.value));
  }
  });

  quantityInput.addEventListener('change', () => {
  let value = parseInt(quantityInput.value);
  if (isNaN(value) || value < 1) value = 1;
  if (value > 99) value = 99;
  quantityInput.value = value;
  updateItemQuantity(itemId, value);
  });
  });

  // 삭제 버튼 처리
  const removeButtons = document.querySelectorAll('.btn-remove');
  removeButtons.forEach(button => {
  button.addEventListener('click', function() {
  const cartItem = this.closest('.cart-item');
  const itemId = parseInt(cartItem.dataset.itemId);
  const productName = cartItem.querySelector('.product-name').textContent;

  if (confirm(`'${productName}' 상품을 장바구니에서 삭제하시겠습니까?`)) {
  // DOM에서 요소 제거
  cartItem.remove();

  // cartItems 배열에서도 제거
  cartItems = cartItems.filter(item => item.id !== itemId);

  // 장바구니가 비었는지 확인
  const remainingItems = document.querySelectorAll('.cart-item');
  if (remainingItems.length === 0) {
  const itemList = document.querySelector('.item-list');
  itemList.innerHTML = `
  <div class="empty-cart">
    <p>장바구니가 비어있습니다.</p>
  </div>
  `;
  }

  // 주문 요약 정보 업데이트
  updateOrderSummary();
  }
  });
  });

  // 선택 삭제 버튼 처리
  const deleteSelectedBtn = document.querySelector('.btn-delete-selected');
  deleteSelectedBtn.addEventListener('click', function() {
  const selectedItems = Array.from(itemCheckboxes)
  .filter(checkbox => checkbox.checked)
  .map(checkbox => parseInt(checkbox.closest('.cart-item').dataset.itemId));

  if (selectedItems.length === 0) {
  alert('삭제할 상품을 선택해주세요.');
  return;
  }

  if (confirm('선택한 상품을 삭제하시겠습니까?')) {
  selectedItems.forEach(itemId => removeCartItem(itemId));
  }
  });

  // 주문하기 버튼 처리
  const orderButton = document.querySelector('.btn-order');
  orderButton.addEventListener('click', function() {
  const selectedItems = cartItems.filter(item => item.selected);

  if (selectedItems.length === 0) {
  alert('주문할 상품을 선택해주세요.');
  return;
  }

  // 선택된 상품 정보를 URL 파라미터로 전달
  const orderData = encodeURIComponent(JSON.stringify(selectedItems));
  window.location.href = `payment.html?items=${orderData}`;
  });

  // 아이템 선택 상태 업데이트
  function updateItemSelection(itemId, selected) {
  const item = cartItems.find(item => item.id === itemId);
  if (item) {
  item.selected = selected;
  }
  }

  // 아이템 수량 업데이트
  function updateItemQuantity(itemId, quantity) {
  const item = cartItems.find(item => item.id === itemId);
  if (item) {
  item.quantity = quantity;
  updateOrderSummary();
  }
  }

  // 장바구니 아이템 삭제
  function removeCartItem(itemId) {
  cartItems = cartItems.filter(item => item.id !== itemId);
  const itemElement = document.querySelector(`.cart-item[data-item-id="${itemId}"]`);
  if (itemElement) {
  itemElement.remove();

  // 장바구니가 비었을 때 메시지 표시
  if (cartItems.length === 0) {
  const itemList = document.querySelector('.item-list');
  itemList.innerHTML = `
  <div class="empty-cart">
    <p>장바구니가 비어있습니다.</p>
  </div>
  `;
  }
  }
  updateOrderSummary();
  }

  // 주문 요약 정보 업데이트
  function updateOrderSummary() {
  const selectedItems = cartItems.filter(item => item.selected);
  const subtotal = selectedItems.reduce((sum, item) => sum + (item.price * item.quantity), 0);
  const discount = calculateDiscount(subtotal); // 할인 계산 함수 (실제로는 서버에서 계산)
  const total = subtotal - discount;

  document.querySelector('.subtotal').textContent = formatPrice(subtotal) + '원';
  document.querySelector('.discount').textContent = '-' + formatPrice(discount) + '원';
  document.querySelector('.total-price').textContent = formatPrice(total) + '원';
  document.querySelector('.selected-count').textContent = selectedItems.length;
  document.querySelector('.earning-points').textContent = Math.floor(total * 0.01).toLocaleString();
  }

  // 할인 계산 함수 (예시)
  function calculateDiscount(subtotal) {
  return Math.floor(subtotal * 0.05); // 5% 할인
  }

  // 가격 포맷팅
  function formatPrice(price) {
  return price.toLocaleString();
  }

  // 초기 주문 요약 업데이트
  updateOrderSummary();

  // 추천 상품 장바구니 담기 버튼 처리
  const addToCartButtons = document.querySelectorAll('.btn-add-cart');
  addToCartButtons.forEach(button => {
  button.addEventListener('click', function() {
  const productCard = this.closest('.product-card');
  const productName = productCard.querySelector('h3').textContent;
  alert(`${productName}이(가) 장바구니에 담겼습니다.`);
  });
  });
  });
</script>
</form>
</body>
</html>
