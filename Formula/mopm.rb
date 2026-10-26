class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.72/mopm-0.0.72-macos-arm64.tar.gz"
      sha256 "5848c13e37e7fdd28ca633649f2cb06e856a8c0db40034defa31d69499fefba1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.72/mopm-0.0.72-linux-aarch64.tar.gz"
      sha256 "7d8d6a72cc7411aca1fe331c89f2b663dc2261330fcbcd4d560f0f06e867256b"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.72/mopm-0.0.72-linux-x86_64.tar.gz"
      sha256 "484fd7fcc49286d0059ff20ecbad086db5a958269c1bd8a36a7770329349f0ad"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
