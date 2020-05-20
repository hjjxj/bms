var interval;
window.onload = function() {
	interval = window.setInterval("changeSecond()", 1000);
};
function changeSecond() {
	var second = document.getElementById("second");
	var svalue = second.innerHTML;
	svalue = svalue - 1;
	if (svalue == 0) {
		window.clearInterval(interval);

		var pathName = window.location.pathname.substring(1);
		var webName = pathName == '' ? '' : pathName.substring(0, pathName
				.indexOf('/'));

		location.href = window.location.protocol + '//' + window.location.host
				+ '/' + webName + '/index.jsp';
		return;
	}
	second.innerHTML = svalue;
}
