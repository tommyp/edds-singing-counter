(function(){
  "use strict";

  function ClockUpdater(){
    this.updatedEl = document.getElementById('updated-at');
    window.setInterval(this.get.bind(this), 1e3);
  }
  ClockUpdater.prototype = {
    get: function(){
      var request = new XMLHttpRequest(),
          callback = this.update.bind(this);
      request.onreadystatechange = function () {
        if (this.readyState === 4){
          var json = JSON.parse(request.responseText);
          callback(json);
        }
      };
      request.open('GET', 'index.json', true);
      request.send(null);
    },
    update: function(data){
      this.updatedEl.innerText = data.updated_at;
    }
  };

  window.clockUpdater = new ClockUpdater();
}());
