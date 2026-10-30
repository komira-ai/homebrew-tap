class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.70/buildrules-cli-0.0.70-macos-arm64.tar.gz"
      sha256 "9feb85eed16a513e997c8ba59b5b61bcc05a32490b6ab76c6cb5c80141145652"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.70/buildrules-cli-0.0.70-linux-aarch64.tar.gz"
      sha256 "3e9a140dd862eefb922bdc2b2b9d5c585ffa804b43aea08cadd57221acca3ebc"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.70/buildrules-cli-0.0.70-linux-x86_64.tar.gz"
      sha256 "611f3fc77b5ffc0ac0563d9b00578a959c2482ee6c73cd59bbe72e95d6d4fa4c"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
