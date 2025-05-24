class Lcamtuf_download < BeEF::Core::Command
  def self.options
    [
      {
        'name' => 'malicious_file_uri',
        'description' => 'Enter the file URL to force download in the victim browser.',
        'ui_label' => 'Malicious File URL',
        'type' => 'textarea',  # This is important for multi-line input
        'value' => '',
        'width' => '400px',
        'height' => '80px'
      }
    ]
  end

  def post_execute
    content = {}
    content['result'] = @datastore['result']
    save content
  end
end
