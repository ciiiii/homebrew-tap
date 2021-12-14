require "language/go"

class Reg < Formula
    desc " Docker registry v2 command line client and repo listing generator with security checks. "
    homepage "https://github.com/genuinetools/reg"
    head "https://github.com/genuinetools/reg", branch: "master"

    depends_on "go" => :build
  
    def install
      ENV["GOPATH"] = buildpath
      Dir.chdir buildpath/"src/github.com/genuinetools/reg" do
        system "go", "get", "./"
      end
      system "go", "build", "-o", "#{bin}/reg"
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/reg version 2>&1")
    end
  end