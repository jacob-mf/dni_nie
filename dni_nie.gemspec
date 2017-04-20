Gem::Specification.new do |s|
  s.name        = 'dni_nie'
  s.version     = '0.3.3'
  s.date        = '2017-03-22'
  s.summary     = "Utilidades para documentos oficiales DNI-NIE | Spanish official Id. tools"
  s.description = "Una gema para la verficación de documentos DNI/NIE | A gem to handle Spanish Identity Documents"
  s.authors     = ["L. Jacob Mariscal Fernández"]
  s.email       = 'l.jacob.m.f@gmail.com'
  s.files       = ["lib/dni_nie.rb"]
  s.homepage    = 'http://rubygems.org/gems/dni_nie'
  s.licenses    = ['LGPL-3.0']
  s.post_install_message = "Gracias por probar la gema dni_nie | Thanks for installing dni_nie gem"
  s.executables << 'dni_nie'
  s.add_development_dependency 'minitest', '~> 5.3'
end
