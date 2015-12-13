(function() {
  var GitHubRedAlert;

  GitHubRedAlert = (function() {
    var token;

    token = "";

    GitHubRedAlert.prototype.update = function() {
      return $.ajax({
        url: 'https://api.github.com/notifications?participating=true&access_token=' + token,
        cache: false,
        success: (function(_this) {
          return function(data) {
            var participating_count;
            participating_count = data.length;
            console.debug('GitHub Red Alert: You have ' + participating_count + ' participating notifications');
            $('.notification-indicator .mail-status').toggleClass('red-alert', participating_count > 0);
            return $('a.notification-indicator').attr('href', participating_count > 0 ? '/notifications/participating' : '/notifications');
          };
        })(this)
      });
    };

    function GitHubRedAlert() {
      chrome.storage.sync.get({
        token: "",
        interval: 5
      }, (function(_this) {
        return function(items) {
          var interval;
          token = items["token"];
          interval = items["interval"];
          if (_this.token === "") {
            return console.warn("GitHub Red Alert: Please specify a personal access token via the options page.");
          } else {
            _this.update();
            console.debug("GitHub Red Alert: Using a " + interval + " second refresh interval");
            return setInterval(_this.update, interval * 1000);
          }
        };
      })(this));
    }

    return GitHubRedAlert;

  })();

  $(function() {
    return new GitHubRedAlert();
  });

}).call(this);

//# sourceMappingURL=script.js.map
