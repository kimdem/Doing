function cal_check() {
	let cal_name=document.getElementById("cal_name");
	let cal_fd=document.getElementById("cal_f");
	let cal_sd=document.getElementById("cal_s");
	let des=document.getElementById("des");
	let firstdate = document.getElementById("FD");
	let seconddate = document.getElementById("SD");
	
	
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
	let FD = new Date(firstdate.value);
	let SD = new Date(seconddate.value);
	
	if(F > S) {
		alert("데드라인이 시작날짜를 지났습니다.");
		cal_sd.focus();
		return false;
	}
	if(F < FD) {
		alert("일정이 프로젝트 시작날짜 이전입니다.");
	    cal_fd.focus();
	    return false;
	}
	if(S > SD) {
	     alert("일정이 프로젝트 데드라인 이후입니다.");
	     cal_sd.focus();
	     return false;
	}
	if (des.value.length > 100) {
		alert("설명은 100자 이하로 작성하십시오");
		des.focus();
		return false;
	}
	
	
	document.cal_add.submit()
}