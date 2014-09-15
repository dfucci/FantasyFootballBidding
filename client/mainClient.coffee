@Players = new Meteor.Collection "Players"
@Current = new Meteor.Collection "Current"
Template.hello.events ={
  'click .drawButton' : (e)->
    e.preventDefault()
    role =document.getElementsByClassName("active")[0].getElementsByTagName("input")[0].value
    Meteor.call "draw", role, (err, player)->


 'click #roles label' : (e,t) ->
   e.preventDefault()
}


Template.hello.active = ->
  @active?"active":""

Template.access.events ={
  'click button.login' : (e)->
    console.log 'click'
    e.preventDefault()
    Session.set("access", true) if document.getElementById("pass").value is "geronimo"
}
Template.hello.player = ->
  Current.find().fetch()[0]

Template.hello.access = ->
  Session.get "access"

