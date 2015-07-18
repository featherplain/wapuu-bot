#Description:
#  Get Wiki Url
#
#Commands:
#  hubot wapuu -- Get url of Wiki
#
#Author:
#  funteractive

class Wiki
  url: 'https://github.com/featherplain/wct2015/wiki'
  getUrl: () ->
    return ':open_book:Wikiだぷー♪ ' + this.url


module.exports = (robot) ->
  wiki = new Wiki

  robot.respond /wiki/i, (msg) ->
    msg.send wiki.getUrl()
