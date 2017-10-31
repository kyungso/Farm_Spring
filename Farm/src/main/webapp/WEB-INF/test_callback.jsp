<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>

            <div id="naver_id_login" style="display: none;"></div>
         <script type="text/javascript">
    var naver_id_login = new naver_id_login("k0KYBOHkL1RTbPlvxpAF",
      "http://localhost:8090/app/test_callback");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("white", 2, 40);
    naver_id_login.setDomain("http://localhost:8090/app/loginForm");
    naver_id_login.setState(state);
   // naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();
   </script>
            <!-- // 네이버아이디로로그인 초기화 Script -->
            
            <!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
            <script type="text/javascript">
                var i = 0;
                // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
                function naverSignInCallback() {
                    if(i++ == 0){
                        location.href = "http://localhost:8090/app/session?state=".concat(naver_id_login.getAccessToken(),"&email=",naver_id_login.getProfileData('email'),"&nickname=",naver_id_login.getProfileData('nickname'),"&sns_id=",naver_id_login.getProfileData('id'));
                    }
                }
                // 네이버 사용자 프로필 조회
                naver_id_login.get_naver_userprofile("naverSignInCallback()");
            </script>
            <div></div>

  

</body>
</html>