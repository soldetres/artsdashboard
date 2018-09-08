class Dashing.Hotness extends Dashing.Widget

  @accessor 'value', Dashing.AnimatedValue
  @accessor 'value2', Dashing.AnimatedValue





  constructor: ->
    super
    @observe 'value2', (value) ->
      $(@node).find(".meter").val(value).trigger('change')
  
  ready: ->
    meter = $(@node).find(".meter")
    meter.attr("data-bgcolor", meter.css("background-color"))
    meter.attr("data-fgcolor", meter.css("color"))
    meter.knob()

  onData: (data) ->
    node = $(@node)
    value = parseInt data.value
    cool = parseInt node.data "cool"
    warm = parseInt node.data "warm"
    level = switch
      when value <= cool then 500 
      when value >= warm then 1800 
      else 
        bucketSize = (warm - cool) / 3 # Total # of colours in middle
        Math.ceil (value - cool) / bucketSize
  
    backgroundClass = "hotness#{level}"
    lastClass = @get "lastClass"
    node.toggleClass "#{lastClass} #{backgroundClass}"
    @set "lastClass", backgroundClass
