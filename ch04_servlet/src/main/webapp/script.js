/*$(()=>{} 이름이 있는 function이라서 jQuery보다 js로 함*/
function inputCheck(){
	if(regForm.id.value == ""){ // regForm의 id에 들어간 값(value)
		alert("아이디를 넣어주세요");
		regForm.id.focus();
		return;
	}

	if(regForm.pw.value == ""){ // regForm의 pw에 들어간 값(value)
		alert("비밀번호를 넣어주세요");
		regForm.pw.focus();
		return;
	}

	if(regForm.pw.value != regForm.repw.value){ // regForm의 repw에 들어간 값(value)
		alert("비밀번호가 일치하지 않습니다");
		regForm.repw.focus();
		return;
	}
	
	if(regForm.name.value == ""){ // regForm의 name에 들어간 값(value)
		alert("이름을 넣어주세요");
		regForm.name.focus();
		return;
	}
	
	regForm.submit(); // button에 submit이 안들어가있으므로 regForm에 js로 넣어줌
}
/*
	return값에 대한 설명 챗 gpt
	JavaScript 함수 `inputCheck`에서의 `return`은 함수의 실행을 종료하고,
	함수를 호출한 부분으로 값을 반환하는 역할을 합니다.
	여기서 `return` 뒤에 값이 없거나 `undefined`인 경우, 함수는 호출된 곳으로 아무런 값을 반환하지 않습니다.
	
	이 구체적인 코드에서, `return;`은 `아이디를 넣어주세요`라는 경고 메시지를 표시하고,
	입력 필드에 초점을 맞추기 위해 `regForm.id.focus();`를 호출한 후 함수 실행을 종료합니다.
	즉, 아이디가 비어있을 때 함수가 종료되며, 아무 값도 반환하지 않습니다.
	이는 주로 입력 양식의 유효성 검사 등에서 사용되어, 특정 조건이 충족되지 않을 때 함수 실행을 중단하고
	사용자에게 알림을 주는 용도로 활용됩니다.
*/