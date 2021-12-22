class Kink < Formula
    desc "KinK is a helper CLI that facilitates to manage KinD clusters as Kubernetes pods. Designed to ease clusters up for fast testing with batteries included in mind."
    homepage "https://github.com/trendyol"
    version "0.1.1"
    license "MIT"
    bottle :unneeded
    head "https://github.com/Trendyol/kink.git", branch: "main"

    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/Trendyol/kink/releases/download/v0.1.1/kink_0.1.1_Darwin-x86_64.tar.gz"
        sha256 "5ca5bd0f6e25d29277c65f61be015c399fe75490f27473b7b6941697802d4097"
      end
    end
  
    on_linux do
      if Hardware::CPU.intel?
        url "https://github.com/Trendyol/kink/releases/download/v0.1.1/kink_0.1.1_Linux-x86_64.tar.gz"
        sha256 "954ff7b257bf40339906b8054f41de1d2b9bf9fb47e44d40f25e632f2eb04484"
      end
    end
  
    depends_on "go" => :optional
    depends_on "git"

    head do
        depends_on "go" => :build
    end
  
    def install
      if build.head?
        project = "github.com/Trendyol/kink"
        ldflags = %W[
          -s -w
          -X #{project}/cmd.GitVersion=#{Utils.git_branch}
          -X #{project}/cmd.gitCommit=#{Utils.git_short_head}
          -X #{project}/cmd.gitTreeState=clean
          -X #{project}/cmd.buildDate=#{Time.now.utc.iso8601}
        ]
        system "go", "build", *std_go_args(output: "kink", ldflags: ldflags.join(" ")), "main.go"
        system "./scripts/completions.sh"
      end
      bin.install "kink"
      bash_completion.install "completions/kink.bash" => "kink"
      zsh_completion.install "completions/kink.zsh" => "_kink"
      fish_completion.install "completions/kink.fish"
    end
  
    test do
      system "#{bin}/kink version"
    end
  end