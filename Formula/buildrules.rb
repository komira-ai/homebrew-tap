class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.42/buildrules-cli-0.0.42-macos-arm64.tar.gz"
      sha256 "1236a06c9824bfe0cac99c3f286a74cb5abaa0a11ba000d6024775adba7b5372"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.42/buildrules-cli-0.0.42-linux-aarch64.tar.gz"
      sha256 "33c9f9d96898d05e3c5f432877e9d7d6d0ffdcc45394a47a1e2b7d652d48bffd"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.42/buildrules-cli-0.0.42-linux-x86_64.tar.gz"
      sha256 "43a3a51960f880642bae7a1fdcbaa8edaeeffe0318268dd5f6abc9f0339355c0"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
