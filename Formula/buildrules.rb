class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.50/buildrules-cli-0.0.50-macos-arm64.tar.gz"
      sha256 "92fc0e8fe204156a0fb0fb01bfed4e2f07806dfe54619108fb590b24c625a114"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.50/buildrules-cli-0.0.50-linux-aarch64.tar.gz"
      sha256 "46949b07343c214a53bf6e5ce7edec979b5c7844f1a559efb85277d85c2495ac"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.50/buildrules-cli-0.0.50-linux-x86_64.tar.gz"
      sha256 "1d5c738461afe36b20dda1f180c0d1a47c163d7881b6d930fcb96ceba7151181"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
