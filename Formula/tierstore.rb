class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.111/tierstore-0.3.111-macos-arm64.tar.gz"
      sha256 "f8ce7a94c25f5e5e19615ceb05f5bc46cb38b062a0e3ea63c045be5328782fcc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.111/tierstore-0.3.111-linux-aarch64.tar.gz"
      sha256 "ebfa45410f9ada60124146780d82d7e2fe9ad3829553dd7e81f6716837bf9671"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.111/tierstore-0.3.111-linux-x86_64.tar.gz"
      sha256 "4fb144302b3d36eacfbbdabf707459f4b67d37519caa23de9d03e233b37b99e4"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
