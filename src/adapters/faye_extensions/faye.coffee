class Faye extends Adapter

exports.use = (robot) ->
  new Faye robot
clientAuth = outgoing: (message, callback) ->
      # Leave non-subscribe or chat messages alone
      if (message.channel is not '/meta/subscribe' and !/chat/.test(message.channel))
        return callback message

      # Add ext field if it's not present
      message.ext ?= {}

      #Set the auth token
      message.ext.private_pub_signature = "hatersgonnahateJ2fe3SoccbV5u1l"

      #Carry on and send the message to the server
      callback message

module.exports = clientAuth
