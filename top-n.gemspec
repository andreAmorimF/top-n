
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
    s.name = 'top-n'
    s.version = '0.1'
    s.has_rdoc = true
    s.date = Time.now.utc.strftime("%Y-%m-%d")
    s.extra_rdoc_files = ['README.md']
    s.summary = 'Top-N integers from file'
    s.description = s.summary
    s.author = 'Andre Fonseca'
    s.email = 'andre.amorimfonseca@gmail.com'
    s.executables = ['top-n']
    s.files = %w(README.md) + Dir.glob("{bin,lib,test}/**/*")
    s.require_path = "lib"
    s.bindir = "bin"

    s.add_runtime_dependency "test-unit"

end
