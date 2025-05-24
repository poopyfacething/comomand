class LcamtufDownload < BeEF::Core::Command
  def self.options
    return [
      {
        'name' => 'malicious_file_uri',
        'description' => 'Enter the file URL to download in the victim browser.',
        'ui_label' => 'Malicious File URL',
        'type' => 'text',  # Use 'text' instead of 'textarea' for single-line
        'value' => '',
        'width' => '400px'
      }
    ]
  end

  def post_execute
    content = {}
    content['result'] = @datastore['result']
    save content
  end
end
