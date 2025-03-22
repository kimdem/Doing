function checkform() {
	let project=document.getElementById("project");
	let people=document.getElementById("people");
	let firstdate=document.getElementById("firstdate");
	let seconddate=document.getElementById("seconddate");
	let des=document.getElementById("des");
	
	
	if (project.value == "") {
		alert("프로젝트명은 공백일 수 없습니다.");
		return false;
	}

	
	if (people.value < 0 || people.value > 100) {
		alert("참여인원은 음수이거나 100명을 초과할 수 없습니다.");
		people.focus();
		return false;
	}
	if (firstdate.value == "") {
		alert("시작날짜가 공백입니다.");
		firstdate.focus();
		return false;
	}
	
	if (seconddate.value == "") {
		alert("데드라인이 공백입니다.");
		seconddate.focus();
		return false;
	}
	let F = new Date(firstdate.value);
	let S = new Date(seconddate.value);
	
	if(F > S) {
		alert("데드라인이 시작날짜를 지났습니다.");
		seconddate.focus();
		return false;
	}
	if (des.value.length > 100) {
		alert("설명은 100자 이하로 작성하십시오");
		des.focus();
		return false;
	}
	
	
	document.addtask.submit()
}