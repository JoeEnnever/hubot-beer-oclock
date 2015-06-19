# Description:
#   Say Hi to Hubot.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot hello - "hello!"
#   hubot orly - "yarly"
#
# Author:
#   tombell

module.exports = (robot) ->
  robot.hear /beer/, (msg) ->
    moment = require('moment-timezone')
    five_pm = moment.tz("17:00", "h:mm", "America/New_York")
    two_thirty_pm = moment.tz("14:30", "h:mm", "America/New_York")
    midnight = moment.tz("23:59", "h:mm", "America/New_York")
    month = moment.tz("America/New_York").month()
    beer_time = if (month >= 5 && month <= 8) then two_thirty_pm else five_pm
    if moment.tz("America/New_York").isBetween(beer_time, midnight)
      msg.reply "It's :beer: o'clock right now!"
    else
      msg.reply ":beer: o'clock is #{beer_time.fromNow()}"
