var game = (function() {
 var game_advanced = function(response) {
    var json = JSON.parse(response.responseText);
    $(game).trigger('game:advanced', json);
 };

 return {
  run: function () {
    var request = $.ajax('/game/run.json', { type: 'post' });
    request.complete(game_advanced);
    return request;
  }
};

})();
