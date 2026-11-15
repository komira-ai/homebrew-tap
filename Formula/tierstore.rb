class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.110/tierstore-0.3.110-macos-arm64.tar.gz"
      sha256 "6c02eb630d58faff8adf727327585ddd6c58de7f6459830cd071510ba4c0db97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.110/tierstore-0.3.110-linux-aarch64.tar.gz"
      sha256 "b9c1d58846cea965c5677927eebf2d30214217ee733b9ee63190e82b4981db0b"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.110/tierstore-0.3.110-linux-x86_64.tar.gz"
      sha256 "5f79b553e40455db22f458cb87a9b697eb46df65566a31c6b8784a3169cdb975"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
