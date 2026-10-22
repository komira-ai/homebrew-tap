class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.23/buildrules-cli-0.0.23-macos-arm64.tar.gz"
      sha256 "f4f94a6e4f2ec3b3656d93f2fd87ac1ad7c5f48f4c73660084f623ccec38f87b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.23/buildrules-cli-0.0.23-linux-aarch64.tar.gz"
      sha256 "0a18635108dc7b7003a8f4ccce7015a5ed49a061ae6be64ac82e9762373629a7"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.23/buildrules-cli-0.0.23-linux-x86_64.tar.gz"
      sha256 "c8000af02401ec03f00428c025d2a3c6e9c8e30bad4c8972275bf2359c6c9fd5"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
