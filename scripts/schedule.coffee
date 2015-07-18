#Description:
#  About schedule until WordCamp Tokyo 2015
#
#Commands:
#  hubot schedule -- Get left dates until WordCamp Tokyo 2015
#
#Author:
#  funteractive

CronJob = require('cron').CronJob

class Schedule
  dateWct2015: '2015/10/31 23:59:59'
  dateWct2015Start: '2015/10/31 10:00:00'
  dateWct2015End: '2015/11/01 23:59:59'
  getLeftDatesMessage: () ->
    nowTime = new Date().getTime()
    wctTime = new Date(this.dateWct2015).getTime()
    wctTimeStart = new Date(this.dateWct2015Start).getTime()
    wctTimeEnd = new Date(this.dateWct2015End).getTime()

    if wctTimeStart < nowTime < wctTimeEnd
      return ':wapuu: WordCamp Tokyo 2015開催中だぷー！ :wapuu:'
    else if nowTime < wctTime
      leftDates = Math.floor((wctTime - nowTime) / (1000*60*60*24))
      return ':wapuu: WordCamp Tokyo 2015まであと' + leftDates + '日！がんばるぷー♪'
    else
      return ':tada: WordCamp Tokyo 2015は無事終了しました！おつかれぷー♪ :tada:'

module.exports = (robot) ->
  schedule = new Schedule

  robot.respond /schedule/i, (msg) ->
    msg.send schedule.getLeftDatesMessage()

  new CronJob
    cronTime: '00 00 09 * * 0-6'
    onTick: ->
      message = schedule.getLeftDatesMessage()
      robot.send { room: "#general" }, message
    start: true
    timeZone: "Asia/Tokyo"
