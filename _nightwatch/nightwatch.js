module.exports = {
  src_folders: ["_nightwatch"],
  output_folder: '/dev/null',
  custom_commands_path: "",
  custom_assertions_path: "",
  page_objects_path: "",
  globals_path: "",
  test_settings: {
    default: {
      launch_url: "http://localhost:9292",
      selenium_port: 4444,
      selenium_host: "localhost",
      silent: true,
      screenshots: {
        enabled: false,
        path: ""
      },
      desiredCapabilities: {
        browserName: "chrome"
      }
    }
  }
}
