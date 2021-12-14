require "language/go"

class Reg < Formula
    desc " Docker registry v2 command line client and repo listing generator with security checks. "
    homepage "https://github.com/genuinetools/reg"
    # head "https://github.com/genuinetools/reg", branch: "master"
    url "https://github.com/genuinetools/reg/archive/v0.16.1.tar.gz"
    sha256 "b65787bff71bff21f21adc933799e70aa9b868d19b1e64f8fd24ebdc19058430"    

    depends_on "go" => :build
  
    def install
      ENV["GOPATH"] = buildpath
      (buildpath/"build/src").mkpath
      ln_s buildpath, buildpath/"build/src/github.com"
      system "GOPATH=$PWD/build go get github.com/genuinetools/reg"
      bin.install "build/bin/reg"
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/reg version 2>&1")
    end
  end