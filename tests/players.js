var assert = require('assert');

suite('Players', function() {
  test('in the server', function(done, server) {
    server.eval(function() {
      Players.insert({name: 'Totti', role: 'A', Squadra: 'Rome', Quota:'87'});
      var docs = Players.find().fetch();
      emit('docs', docs);
    });

    server.once('docs', function(docs) {
      assert.equal(docs.length, 1);
      done();
    });
  });

  test('using both client and the server', function(done, server, client) {
  server.eval(function() {
    Current.find().observe({
      added: addedNewCurrentPlayer
    });

    function addedNewCurrentPlayer(player) {
      emit('player', player);
    }
  }).once('player', function(player) {
    assert.equal(player.name, 'Totti');
    done();
  });

  client.eval(function() {
    Current.insert({name: 'Totti'});

  });
});
});
