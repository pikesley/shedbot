module.exports = {
  'Take screenshots': function(browser) {
    browser
      .url('http://localhost:4000/presentation/#/')
      .waitForElementVisible('body', 1000)

      for(i = 0; i < process.env.CLICKS; i++) {
        browser.resizeWindow(1024, 768)
        .saveScreenshot('_screenshots/' + ('00'.substring(0, '00'.length - ('' + i).length) + ('' + i)) + '.png')
        .click('.navigate-right')
        .pause(1000)
      }
      browser.end()
  }
}

function pad(integer) {
  str = '' + integer
  pad = '00'
  return '00'.substring(0, '00'.length - ('' + i).length) + ('' + i)
}
