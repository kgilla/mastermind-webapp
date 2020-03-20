module ColorsToCss
  def colors_to_css(pattern)
    pattern.map do |peg_color|
      "<font color='#{peg_color}'>&#11044</font>"
    end.join
  end
end