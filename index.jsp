<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 티니핑 토이샵</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="register-container">
    <div class="register-box">
        <div class="register-header">
            <a href="${pageContext.request.contextPath}/" class="logo">
                <h1>티니핑 토이샵</h1>
            </a>
            <p>회원가입</p>
        </div>
        <form class="register-form" action="${pageContext.request.contextPath}/register" method="post">
            <div class="input-group">
                <label>아이디</label>
                <div class="input-with-button">
                    <input type="text" name="memberId" placeholder="아이디를 입력하세요" required>
                    <button type="button" class="check-button" onclick="idCheck()">중복확인</button>
                </div>
                <p class="input-hint">영문, 숫자 조합 6-12자</p>
                <p id="username-message"></p>
            </div>

            <div class="input-group">
                <label>비밀번호</label>
                <input type="password" name="password" placeholder="비밀번호를 입력하세요" required>
                <p class="input-hint">영문, 숫자, 특수문자 조합 8-16자</p>
            </div>

            <div class="input-group">
                <label>비밀번호 확인</label>
                <input type="password" name="confirmPassword" placeholder="비밀번호를 다시 입력하세요" required>
            </div>

            <div class="input-group">
                <label>이름</label>
                <input type="text" name="name" placeholder="이름을 입력하세요" required pattern="[가-힣]+" title="한글만 입력 가능합니다">
            </div>

            <div class="input-group">
                <label>이메일</label>
                <div class="email-input-group">
                    <input type="text" id="emailId" name="emailId" placeholder="이메일" required>
                    <span>@</span>
                    <select id="emailDomain" name="emailDomain">
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="direct">직접입력</option>
                    </select>
                    <input type="text" id="emailDomainDirect" name="emailDomainDirect" placeholder="도메인 입력" style="display: none;">
                </div>
            </div>

            <div class="input-group">
                <label>휴대폰 번호</label>
                <div class="phone-input-group">
                    <input type="text" name="phone1" id="phone1" maxlength="3" required>
                    <span>-</span>
                    <input type="text" name="phone2" id="phone2" maxlength="4" required>
                    <span>-</span>
                    <input type="text" name="phone3" id="phone3" maxlength="4" required>
                </div>
            </div>

            <div class="agreement-group">
                <div class="agreement-all">
                    <label>
                        <input type="checkbox" id="agreeAll">
                        <span>전체 동의</span>
                    </label>
                </div>
                <div class="agreement-items">
                    <label>
                        <input type="checkbox" name="terms" required>
                        <span>이용약관 동의 (필수)</span>
                    </label>
                    <label>
                        <input type="checkbox" name="privacy" required>
                        <span>개인정보 수집 및 이용 동의 (필수)</span>
                    </label>
                    <label>
                        <input type="checkbox" name="marketing">
                        <span>마케팅 정보 수신 동의 (선택)</span>
                    </label>
                </div>
            </div>

            <button type="submit" class="register-button">가입하기</button>
            <a href="${pageContext.request.contextPath}/login" class="login-link">이미 계정이 있으신가요? 로그인</a>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/register.js"></script>
</body>
</html>