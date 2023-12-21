// id를 수정 후 다시 고쳤는지 확인
function inputIdChk(){
	frm.idBtnCheck.value="idUnCheck"; // form안에 있는
}

function idCheck(id){
	frm.idBtnCheck.value="idCheck";
	if(id==""){ // 사용자가 넣은 값이 없으면
		alert("아이디를 입력하세요");
		frm.id.focus();
		return;
	}
	// 기존에 똑같은 아이디가 있는지 확인 필요
	url = "idCheck.jsp?id="+id; // 내가 받은 아이디 값을 같이 넘겨줌
	window.open(url,"IDCehck", "width=300, height=150");
}

function inputCheck(){ // 필수입력값들 지정
	if(frm.id.value == "") {
		alert("아이디를 입력해 주세요");
		frm.id.focus();
		return;
	}
	if(frm.idBtnCheck.value != "idCheck") {
		alert("아이디 중복체크를 해주세요");
		return;
	}
	if(frm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요");
		frm.pwd.focus();
		return;
	}
	if(frm.repwd.value == "") {
		alert("비밀번호를 한번더 입력해 주세요");
		frm.repwd.focus();
		return;
	}
	if(frm.pwd.value != frm.repwd.value) {
		alert("비밀번호가 다릅니다");
		frm.repwd.focus();
		return;
	}
	if(frm.name.value == "") {
		alert("이름을 입력해 주세요");
		frm.name.focus();
		return;
	}
		frm.submit();
}