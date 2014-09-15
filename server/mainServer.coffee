@Players = new Meteor.Collection "Players"
@Current = new Meteor.Collection "Current"
Meteor.methods {
  draw: (role)->
    players = Players.find({"Ruolo" : role}).fetch()
    shuffled = _.shuffle players
    Current.remove({})
    Players.remove shuffled[0]
    count = Players.find({"Ruolo": role}).count()
    Current.insert {"Player":shuffled[0], "Remaining":count}
}


