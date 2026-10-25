class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.44/buildrules-cli-0.0.44-macos-arm64.tar.gz"
      sha256 "7c388b2ddb17dc64c6773213067b478444a774f5632f5bff3c1b6664d6705ce4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.44/buildrules-cli-0.0.44-linux-aarch64.tar.gz"
      sha256 "6c99049dbd53ed748f03f5e36f9165308ae998b4b638b1c409ee7f8a35dd25d4"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.44/buildrules-cli-0.0.44-linux-x86_64.tar.gz"
      sha256 "0f03f190345ba0623a0ea694a33148071521188e422cd638a195782161bfa2be"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
