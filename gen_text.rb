require "pdfkit"

html = File.open('base.html') do |f|
  f.read
end


PDFKit.configure do |config|
  config.default_options = {
    no_background: false,
    page_size: 'A4',
    orientation: 'Landscape',
    disable_smart_shrinking: true
  }
end
kit = PDFKit.new(html)

kit.to_file('out.pdf')
