(function(){
  "use strict";

  function ClockUpdater(){
    this.updatedEl = document.getElementById('updated-at');
    window.setInterval(this.get.bind(this), 10e3);

    this.resetEl = document.getElementById('reset');
    this.resetEl.addEventListener('click', this.reset.bind(this), false);
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
    },
    reset: function(e){
      e.preventDefault();
      var request = new XMLHttpRequest(),
          callback = this.get.bind(this);

      request.onreadystatechange = function () {
        if (this.readyState === 4){
          callback();
        }
      };
      request.open('PUT', '/reset.json', true);
      request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      request.send('authenticity_token=' + this.authToken());
    },
    authToken: function(){
      var inputs = document.getElementsByTagName('input'), input;
      for(input in inputs){
        if(inputs[input].getAttribute('name') === 'authenticity_token'){
          return inputs[input].getAttribute('value');
        }
      }
    }
  };

  window.clockUpdater = new ClockUpdater();
}());
