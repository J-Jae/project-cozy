//회원 정보 검색 이벤트
$("#searchBtn").on("click", function() {
	$("#nickname").val("");
	$("#searchedEmail").val("");
	$("#authorities").val("");
	
	var email = $("#email").val();
	var searchAuthorities = new Array();
	console.log(email);
	$.ajax({
	    url: "/member/profile"
	    , type: "post"
	    , data: {email: email}
	    , dataType: "json"
	    , success: function(member) {
	    	$("#nickname").val(member.nickname);
	    	$("#searchedEmail").val(member.email);
	    	
	    	$.each(member.authorities, function(i, authorities) {
	    		searchAuthorities.push(authorities.authority);
	    	});
	    	
    		$("#authorities").val(searchAuthorities.join(","));
		}
	    , error: function(e) {
	    	alert("조회된 결과가 없습니다.");
	    }
	});
	
});

// 회원 블라인드 처리
$("#blindBtn").on("click", function() {
	if(confirm("정말 강퇴하시겠습니까?") == false) {
		return;
	}
	
	var nickname = $("#nickname").val();
	var result = true;
	
	$.ajax({
	    url: "/member/unregister"
	    , type: "post"
	    , data: {nickname: nickname}
	    , dataType: "json"
	    , success: function(data) {
	    	console.log(data);
	    	if(data) {
	    		alert("회원이 강퇴되었습니다.");
	    	} else {
	    		alert("이미 강퇴된 회원입니다.");
	    	}
	    }
	    , error: function(e) {
	    	alert("회원 강퇴에 실패했습니다.");
	    }
	});
	
	location.reload();
});

//회원 어드민 권한 추가
$("#addAuthorityBtn").on("click", function() {
	var email = $("#searchedEmail").val();
	var result = true;
	
	$.ajax({
	    url: "/member/addAuth"
	    , type: "post"
	    , data: {email: email
	    	, authorityToAdd: "ADMIN"}
	    , dataType: "json"
	    ,success: function(data) {
	    	if(data) {
	    		alert("관리자가 되었습니다..");
	    	} else {
	    		alert("이미 관리자입니다.");
	    	}
	    }
	    , error: function(e) {
	    	alert("권한 추가에 실패했습니다.");
	    }
	});
});