class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.200/tierstore-0.3.200-macos-arm64.tar.gz"
      sha256 "ac907645e9d1f79b5b8dbb1684d860c272d433cdae15ad512f056b45b92b5085"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.200/tierstore-0.3.200-linux-aarch64.tar.gz"
      sha256 "9e283d96bdae19f24a36154af1d89e8715de4d32890fc55f1e53fac72d2e78be"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.200/tierstore-0.3.200-linux-x86_64.tar.gz"
      sha256 "c08fc0233f6db49ef98e83310e9b1437c1b76bb3caa0e4b18780e688334914b4"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
