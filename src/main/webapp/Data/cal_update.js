function cal_update() {
	let cal_name=document.getElementById("cal_name");
	let cal_fd=document.getElementById("cal_fd");
	let cal_sd=document.getElementById("cal_sd");
	let des=document.getElementById("des");
	
	
	if (cal_name.value == "") {
		alert("일정란이 공백입니다.");
		cal_name.focus();
		return false;
	}

	if (cal_fd.value == "") {
		alert("시작날짜가 공백입니다.");
		cal_fd.focus();
		return false;
	}
	
	if (cal_sd.value == "") {
		alert("데드라인이 공백입니다.");
		cal_sd.focus();
		return false;
	}
	let F = new Date(cal_fd.value);
	let S = new Date(cal_sd.value);
	
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
	
	
	document.cal_update.submit()
}