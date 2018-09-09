class Dashing.Hotness extends Dashing.Widget

  @accessor 'value', Dashing.AnimatedValue
  @accessor 'value2', Dashing.AnimatedValue

  constructor: ->
    super
    @observe 'value2', (value) ->
      $(@node).find(".meter").val(value).trigger('change')
  
  updateData: (data) ->
    node = $(@node)
    value = parseInt data.value

    cool = parseInt node.data "cool"
    warm = parseInt node.data "warm"
    level = switch
      when value == cool then 0
      when value == warm then 1
      when value > warm then 2
      when value < cool then 3


    backgroundClass = "hotness#{level}"
    lastClass = @get "lastClass"
    node.toggleClass "#{lastClass} #{backgroundClass}"
    @set "lastClass", backgroundClass

  onData: (data) ->
    this.updateData(data)

  ready: ->
    meter = $(@node).find(".meter")
    meter.attr("data-bgcolor", meter.css("background-color"))
    meter.attr("data-fgcolor", meter.css("color"))
    meter.knob()

    @updateData({ value: @get('value') })

 
