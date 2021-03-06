# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class KubeProxycommand < Formula
  desc "kube-proxyCommand use Kubernetes Pod port-forward as ssh ProxyCommand"
  homepage "https://github.com/ciiiii/kube-proxyCommand"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ciiiii/kube-proxyCommand/releases/download/v0.1.0/kube-proxyCommand_0.1.0_Darwin-x86_64.tar.gz"
      sha256 "cabc224cbc354a139c257cdb927521409d71aa9eda7f6ae2177c9220bfd52dfe"

      def install
        if build.head?
          ldflags = %W[
            -s -w
          ]
          system "go", "build", *std_go_args(output: "kube-proxyCommand", ldflags: ldflags.join(" ")), "main.go"
        end
        bin.install "kube-proxyCommand"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/ciiiii/kube-proxyCommand/releases/download/v0.1.0/kube-proxyCommand_0.1.0_Darwin-arm64.tar.gz"
      sha256 "fad9acdb30f25f9acaed0d156f8f4a388381d6543962f98f393f19d5d4d7ca0f"

      def install
        if build.head?
          ldflags = %W[
            -s -w
          ]
          system "go", "build", *std_go_args(output: "kube-proxyCommand", ldflags: ldflags.join(" ")), "main.go"
        end
        bin.install "kube-proxyCommand"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ciiiii/kube-proxyCommand/releases/download/v0.1.0/kube-proxyCommand_0.1.0_Linux-x86_64.tar.gz"
      sha256 "44b841c657311c147d97c1e8aaeba01b8d227f73a12e7e21f470e88a6eb5ad18"

      def install
        if build.head?
          ldflags = %W[
            -s -w
          ]
          system "go", "build", *std_go_args(output: "kube-proxyCommand", ldflags: ldflags.join(" ")), "main.go"
        end
        bin.install "kube-proxyCommand"
      end
    end
  end

  head "https://github.com/ciiiii/kube-proxyCommand", branch: "master"
  head do
    depends_on "go" => :build
  end

  depends_on "go" => :optional
  depends_on "git"
end
