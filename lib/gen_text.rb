require "pdfkit"

html = File.open('base.html') do |f|
  f.read
end


PDFKit.configure do |config|
  config.default_options = {
    no_background:           false,
    encoding:                'UTF-8',
    page_size:               'A4',
    orientation:             'Landscape',
    margin_top:              '0in',
    margin_right:            '0in',
    margin_left:             '0in',
    margin_bottom:           '0in',
    disable_smart_shrinking: false
  }
end
kit = PDFKit.new(html)

kit.to_file('out.pdf')
