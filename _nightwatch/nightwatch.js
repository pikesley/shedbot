module.exports = {
  src_folders: ['_nightwatch'],
  output_folder: '/tmp/nobody-cares/',
  test_settings: {
    default: {
      selenium_port: 4444,
      selenium_host: 'localhost',
      silent: true,
      desiredCapabilities: {
        browserName: 'chrome'
      }
    }
  }
}
