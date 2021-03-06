<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Respets :: 이메일 확인</title>
</head>

    <body class="authentication-bg">

        <div class="account-pages mt-5 mb-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card" style="margin-top:6rem;">
                            <!-- Logo -->
                            <div class="card-header pt-4 pb-4 text-center bg-success">
                                <a href="index.html">
                                    <span><img src="resources/dist/assets/images/logo-white.png" alt="" height="30"></span>
                                </a>
                            </div>

                            <div class="card-body p-4">
                                <div class="text-center m-auto">
                                    <img src="resources/dist/assets/images/mail_sent.svg" alt="mail sent image" height="64" />
                                    <h4 class="text-dark-50 text-center mt-4 font-weight-bold">이메일을 확인해주세요!</h4>
                                    <p class="text-muted mb-4" id="emailConfirmOfferLogin">
                                        이메일 인증을 해주세요.<br />
                                        <b>${email}</b>로 인증 링크를 전송했습니다.
                                    </p>
                                    <p class="text-muted mb-4" id="emailConfirmOfferJoin">
                                        이메일 미인증 회원입니다.<br />
                                        <b>${mb.per_email}</b>로 인증 링크를 전송했습니다.
                                    </p>
                                    
                                </div>

                                <form action="./">
                                    <div class="form-group mb-0 text-center">
                                        <button class="btn btn-success" type="submit"><i class="mdi mdi-home mr-1"></i> 홈으로 가기</button>
                                    </div>
                                </form>

                            </div> <!-- end card-body-->
                        </div>
                        <!-- end card-->
                        
                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->

    </body>
<body>
<script>
if('${email}' !=null || '${email}' != "") {
	$('#emailConfirmOfferLogin').show();
	$('#emailConfirmOfferJoin').hide();
}else if('${mb.per_email}' != null || '${mb.per_email}' != "" ) {
	$('#emailConfirmOfferLogin').hide();
	$('#emailConfirmOfferJoin').show();
} 
</script>
</html>