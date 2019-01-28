<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<link href="${root}/resources/css/join.css" rel="stylesheet"/>
</head>
<body>
<script>
//입력값 null check
	function hasError(id, text){
		if($("#"+id).val().trim() == '') {
			$("#"+id+"ValidateNull").text(text+" 입력해 주세요");
			$("#"+id).focus();
			$("#"+id).blur(function() {
				if ($("#"+id).val() != '') {
					$("#"+id+"ValidateNull").empty();
				}
			});
			return false;
		} else {
			return true;
		}
	}
	function formCheck() {
 		if(hasError("id","아이디를") && 
 			hasError("pw", "비밀번호를") &&
			hasError("pwCheck", "비밀번호 확인을") &&
			hasError("email", "이메일을") && 
			hasError("pnum", "전화번호를")) {
 			return true;
 		} else {
 			return false;
 		}
	}

	$(function() {
		var regExp = /^[a-z0-9_]{4,20}$/;
		var regPwExp = /^(?=.*\d)(?=.*[a-z]).{6,20}$/;
		var regPnumExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		var regEmailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 

		//아이디 확인
		$('#id').blur(function() {
			if (!regExp.test($("#id").val()) && $("#id").val().trim() != '') {
				$("#idValidate").text("4~20자 영문 소문자, 숫자를 입력해 주세요.");
				$("#id").focus();
			} else {
				$.ajax({
					url : "${root}/member/idCheck",
					data : {
						"id" : $('#id').val()
					},
					type : 'POST',
					dataType : 'text',
					success : function(data) { 
						if (data == "YES") {
							if ($('#id').val() != '') {
								$("#idValidate").empty();
							}
						} else if(data == "NO"){
							if ($('#id').val() != '') {
								$("#idValidate").empty().text("중복된 아이디입니다.");
								$('#id').focus();
							}
						}
					},
					error : function(request, status, error) {
						alert("code : " + request.status + "\n" + 
								"message : " + request.responseText + "\n" + 
								"error : " + error) ;
					}
				});
			}
		});
	//비밀번호 확인
		$('#pw').blur(function() {
			if (!regPwExp.test($("#pw").val()) && $("#pw").val().trim() != '' ) {
				$("#pwValidate").text("6~20자 영문 소문자, 숫자, 특수문자를 입력해 주세요.");
				$("#pw").focus();
			} else if (/(\w)\1\1/.test($("#pw").val()) && $("#pw").val().trim() != '') {
				$("#pwValidate").text("비밀번호에 동일한 문자를 3번 이상 입력할 수 없습니다.");
				$("#pw").focus();
			} else {
				$("#pwValidate").empty();
			}
		});
		$('#pwCheck').blur(function() {
			if ($('#pw').val() != $(this).val()) {
				if ($(this).val() != '') {
					$("#pwCheckValidate").text("비밀번호가 동일하지 않습나다");
					$(this).focus();
				}
			} else {
				$("#pwCheckValidate").empty();
			}
		});
		//이메일 확인	
		$("#email").blur(function() {
			if (!regEmailExp.test($("#email").val()) && $("#email").val().trim() != '' ) {
				$("#emailValidate").text("@를 포함한 영문을 입력해 주세요.");
				$("#email").focus();
			} else {
				$("#emailValidate").empty();
			}
		});
		//전화번호 확인	
		$("#pnum").blur(function() {
			if (!regPnumExp.test($("#pnum").val()) && $("#pnum").val().trim() != '' ) {
				$("#pnumValidate").text("-를 포함한 숫자를 입력해 주세요. 입력 예 (010-1234-5678)");
				$("#pnum").focus();
			} else {
				$("#pnumValidate").empty();
			}
		});
	});
</script>

    <div class="wrapper">
        <div class="page-header" style="background-image: url('${root}/resources/img/counselling1.jpg');">
            <div class="filter"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 ml-auto mr-auto">
                            <div class="card card-register" style="max-width: 600px;">
                                <h3 class="title" style="color:white;"><i class="nc-icon nc-single-02" aria-hidden="true"></i>&nbsp;&nbsp;회원가입</h3>
                                <form class="register-form" method="post" action="${root}/member" onsubmit="return formCheck();">
                                    <span class="info">*</span><label>아이디</label><span class="validateInfo" id="idValidateNull"></span>
									<span class="validateInfo" id="idValidate"></span>
                                    <input type="text" class="form-control" placeholder="아이디를 입력해 주세요" name="mId" id="id">
                                    
                                    <span class="info">*</span><label>비밀번호</label><span class="validateInfo" id="pwValidateNull" ></span>
									<span class="validateInfo" id="pwValidate" ></span>
                                    <input type="password" class="form-control" placeholder="비밀번호를 입력해 주세요" name="mPw" id="pw">
                                    
                                    <span class="info">*</span><label>비밀번호 확인</label><span class="validateInfo" id="pwCheckValidateNull"></span>
									<span class="validateInfo" id="pwCheckValidate"></span>
                                    <input type="password" class="form-control" placeholder="비밀번호를 확인해 주세요" id="pwCheck">
                                    
                                    <span class="info">*</span><label>이메일</label><span class="validateInfo" id="emailValidateNull"></span>
									<span class="validateInfo" id="emailValidate"></span>
                                    <input type="text" class="form-control" placeholder="이메일을 입력해 주세요" name="mEmail" id="email">
                                    
                                    <span class="info">*</span><label>전화번호</label><span class="validateInfo" id="pnumValidateNull"></span>
									<span class="validateInfo" id="pnumValidate"></span>
                                    <input type="text" class="form-control" placeholder="전화번호  (입력 예: 010-1234-5678)" name="mPnum" id="pnum">
                                    
                                    <div class="row pull-right">
                                   		 <button class="btn btn-outline-danger btn-round" style="width:150px;" type="submit">회원가입</button>&nbsp;&nbsp;
                                   		 <button class="btn btn-default btn-round" style="width:90px;" onclick="location.href='${root}/member/login'">로그인</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</body>




</html>