class Lcamtuf_download < BeEF::Core::Command
  def self.options
    [
      {
        'name' => 'malicious_file_uri',
        'description' => 'Enter the file URL you want to force download in the victim browser.',
        'ui_label' => 'Malicious File URL',
        'value' => '',
        'type' => 'textarea',
        'width' => '400px',
        'height' => '100px'
      }
    ]
  end

  def post_execute
    content = {}
    content['result'] = @datastore['result']
    save content
  end
end
