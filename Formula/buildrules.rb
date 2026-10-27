class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.52/buildrules-cli-0.0.52-macos-arm64.tar.gz"
      sha256 "6ea8cb4027f0ea5a780ae7f6415e6707edd108ce46f7dc9a9f9c02d494a83196"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.52/buildrules-cli-0.0.52-linux-aarch64.tar.gz"
      sha256 "0b6111c24ab98a025bb1da2aabe866236ffd8ed56437dbb8606fe9aff011e504"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.52/buildrules-cli-0.0.52-linux-x86_64.tar.gz"
      sha256 "d5b307417293718486ebaedcc836e298e1160a2072ae7cd46ce5b4cdf08ffdb6"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
