class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.109/tierstore-0.3.109-macos-arm64.tar.gz"
      sha256 "0da567754d68b57bab3e215124a2df089f95ed1e003bc8bc2cb9813525d8dac8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.109/tierstore-0.3.109-linux-aarch64.tar.gz"
      sha256 "fead803d84a6c1affe0f40248f2410c50726a78764fb3dacccf97f6ed89ec36e"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.109/tierstore-0.3.109-linux-x86_64.tar.gz"
      sha256 "a27d1f7cfa6fc8d6a2981f640302e075c1040a038b48c81fd4eba318a5eeaa2c"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
