class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.72/buildrules-cli-0.0.72-macos-arm64.tar.gz"
      sha256 "98cef9999e1e56ae14ce25c1170ac0a06a027fa3367e9684484bbcd0b50f540d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.72/buildrules-cli-0.0.72-linux-aarch64.tar.gz"
      sha256 "8dee94c1eead5d8f8b66045fc200af465cba56ed880401505df674cb72031b77"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.72/buildrules-cli-0.0.72-linux-x86_64.tar.gz"
      sha256 "b548e6bdf6b821e76b69104b93c047090d57ec9b9d90d4a0f2948e44c0751046"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
