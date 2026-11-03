class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.106/mopm-0.0.106-macos-arm64.tar.gz"
      sha256 "6d9467e00527622c0a3c648e0393e849c41329a810c275260281da2ce7152b36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.106/mopm-0.0.106-linux-aarch64.tar.gz"
      sha256 "961b95b24933fdf0aa27fdfc50ce2280e5404a4f142abbd1d7e8a7fc929ed58c"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.106/mopm-0.0.106-linux-x86_64.tar.gz"
      sha256 "84708e19bec60c3b6c11e8b43f8530721dbf65ca0d421c2152b38a348b99870d"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
