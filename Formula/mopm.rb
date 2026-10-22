class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.30/mopm-0.0.30-macos-arm64.tar.gz"
      sha256 "19d7fc0d1e4d79cefaad7e945e65e31045922fd13c7ddde9ac7dbbd2c89b0913"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.30/mopm-0.0.30-linux-aarch64.tar.gz"
      sha256 "333d5b5e7eec11cc618f94ea08a1e6cfbd49914c1bcefb43d2fcb1beb4eba105"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.30/mopm-0.0.30-linux-x86_64.tar.gz"
      sha256 "d3899b0ef54698dfa6f3f4a3fe49a49a88cf2ec834e25f6f8957deb7d634ab20"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
