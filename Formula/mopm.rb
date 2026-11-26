class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.145/mopm-0.0.145-macos-arm64.tar.gz"
      sha256 "a77d06d7497e6db5a3f6aee961f4e15d8f085fc376d0ebbf0cb0e186e38aec0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.145/mopm-0.0.145-linux-aarch64.tar.gz"
      sha256 "06bb3c7c0ab57e6bf24031fe1e50ab0a36f1f2b3a391a56be17a1599a28a5905"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.145/mopm-0.0.145-linux-x86_64.tar.gz"
      sha256 "c977bcd7ace8029faafcfaa21137f59b8f152d1cacf190995b464096817d71fe"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
