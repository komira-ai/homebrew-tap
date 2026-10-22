class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.22/buildrules-cli-0.0.22-macos-arm64.tar.gz"
      sha256 "03114bc861501ed7cf469ab7370f5348f53933b8256abcb57e607b9ac2e6f5bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.22/buildrules-cli-0.0.22-linux-aarch64.tar.gz"
      sha256 "9a1f6ed6d29e3358931594251ffba1a514fb8f5ed0a38171645f16ce47ea3cd6"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.22/buildrules-cli-0.0.22-linux-x86_64.tar.gz"
      sha256 "0fe2b4e2bd2ad15aa47c2f1b2bdfa525375d727e23dd7711cb45cd7b2cf8b89e"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
