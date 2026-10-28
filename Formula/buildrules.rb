class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.63/buildrules-cli-0.0.63-macos-arm64.tar.gz"
      sha256 "8514329f7482312cf07ed918d36f2048345ed30b9a4d50000db652978cdbd570"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.63/buildrules-cli-0.0.63-linux-aarch64.tar.gz"
      sha256 "4417c67e2d21028de361768af788251528aa1a551b01df752519d83b73e7b3ca"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.63/buildrules-cli-0.0.63-linux-x86_64.tar.gz"
      sha256 "7d5faf75af2d1c05f152cb970a9f330a955d9e0c923a7b4f5f6968ff3a86f065"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
