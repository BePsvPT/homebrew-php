require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php53Propro < AbstractPhp53Extension
  init
  homepage 'http://pecl.php.net/package/propro'
  url 'http://pecl.php.net/get/propro-1.0.0.tgz'
  sha1 'f2cbcbc322e88fda55b2fc8908426106e2f18db4'

  def install
    Dir.chdir "propro-#{version}"

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/propro.so"
    write_config_file unless build.include? "without-config-file"
  end
end
