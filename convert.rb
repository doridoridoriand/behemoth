require 'rmagick'
require 'pry'

background = Magick::Image.read('./bg.png').first
gradation =  Magick::Image.read('./grd.png').first
portrait =   Magick::Image.read('./act.jpg').first

# 取得したアイコン画像をリサイズ
new_portrait = portrait.resize(portrait.columns * (background.rows / portrait.rows),
                               background.rows)

draw = Draw.new

draw.font = '../yumincho/yumin.ttf'

pre = background.composite!(new_portrait, Magick::WestGravity, Magick::OverCompositeOp)
pre.composite!(gradation, Magick::WestGravity, Magick::OverCompositeOp)


#draw.annotate(pre, 0, 0, 50, 100, text) do
#  self.font = '../yumincho/yumin.ttf'
#  self.fill = "#FFFFFF"
#  self.align = Magick::LeftAlign
#
#  self;stroke
#end

pre.write('./unko2.png')

