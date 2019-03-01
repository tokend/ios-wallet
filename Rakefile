require 'bundler'
Bundler.setup()
require 'pry'

namespace :xdr do

  task :update => [:generate]

  task :generate do
    require "pathname"
    require "xdrgen"
    require 'fileutils'

    paths = Pathname.glob("xdr/*.x").sort
    compilation = Xdrgen::Compilation.new(
      paths,
      output_dir: "./Sources/TokenDWallet/Xdr",
      namespace:  "org.stellar.sdk.xdr",
      language:   :swift
    )
    compilation.compile
  end
end
