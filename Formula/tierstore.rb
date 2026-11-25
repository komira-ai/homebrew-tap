class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.184/tierstore-0.3.184-macos-arm64.tar.gz"
      sha256 "85084262ceb18868f8932929506728d78c01d79e70a43ebdee1a02276306cb1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.184/tierstore-0.3.184-linux-aarch64.tar.gz"
      sha256 "c933a3c3e19355d9028f6199d4e95aa7dcddc44c50d3a7ab7d9c82e21cbb2665"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.184/tierstore-0.3.184-linux-x86_64.tar.gz"
      sha256 "7ddf5013d49ec157f028d894c2498cbc961a0a01d06f7e8d5f010f538fc298cd"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
