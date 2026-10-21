class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "file:///tmp/dist/mopm-1.2.3-macos-arm64.tar.gz"
      sha256 "cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc"
    end
  end

  on_linux do
    on_arm do
      url "file:///tmp/dist/mopm-1.2.3-linux-aarch64.tar.gz"
      sha256 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    end
    on_intel do
      url "file:///tmp/dist/mopm-1.2.3-linux-x86_64.tar.gz"
      sha256 "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
