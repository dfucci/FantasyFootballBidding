@Current = new Meteor.Collection "Current"
Template.hello.events ={
  'click .drawButton' : (e)->
    e.preventDefault()
    role =document.getElementsByClassName("active")[0].getElementsByTagName("input")[0].value
    Meteor.call "draw", role, (err, player)->


  'click #roles label':(e)->
    e.preventDefault()
    clickedButton = e.currentTarget.firstChild.nextElementSibling.id
    alreadyClicked = document.getElementsByClassName("active")[0].firstChild.nextElementSibling.id
    if clickedButton isnt alreadyClicked
      document.getElementById(alreadyClicked).parentElement.className="btn btn-primary"
}



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

