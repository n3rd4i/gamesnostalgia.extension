var page = require("webpage").create();
var system = require('system');

page.onCallback = function (data) {
  if (data.type === "exit") {
    phantom.exit();
  }
};

page.onConsoleMessage = function (msg) {
  console.log(msg);
};

page.open(system.args[1], function (status) {
  if (status == "success") {
    page.evaluate(function () {
      $("#downloadbutton").click();
      setTimeout(function () {
        try {
          url = document.querySelector("#downloadsection > p > a").href;
          console.log(url);
        } catch (error) {
          console.error("URL not found");
        }
        window.callPhantom({
          type: "exit"
        });
      }, 4000);
    });
  } else {
    phantom.exit();
  }
});