class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.175/tierstore-0.3.175-macos-arm64.tar.gz"
      sha256 "4af58da323e0927baf02735c8afa1b780cda78398cac884b3c38656eaf54ae17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.175/tierstore-0.3.175-linux-aarch64.tar.gz"
      sha256 "f6e6ed1ff8a6c4f7172d700d31e7d27541290a04eeeb44e386229ae43c4fef3c"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.175/tierstore-0.3.175-linux-x86_64.tar.gz"
      sha256 "02d94f863f89e6de28cf2d177f8babbae7f401b9686a7653942ea654ac4323f6"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
