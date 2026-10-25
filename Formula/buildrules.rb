class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.43/buildrules-cli-0.0.43-macos-arm64.tar.gz"
      sha256 "d21dbcdde6e3c596beb73024d56528e23f6e98c74c0906c69401f1f59d998b4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.43/buildrules-cli-0.0.43-linux-aarch64.tar.gz"
      sha256 "0513f25d4203f0f0a4bbe3edd7947bcc701470e43bf97a0fe031a57bf2f38926"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.43/buildrules-cli-0.0.43-linux-x86_64.tar.gz"
      sha256 "28238950dc6179ce5a3d25bf5101864888e094ed9eb1b993336521b979759f6a"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
