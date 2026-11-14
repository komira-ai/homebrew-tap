class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.103/tierstore-0.3.103-macos-arm64.tar.gz"
      sha256 "0efe344f3f7de7d61d50c99aff8070946a8ffa68e175eca1dd8b02ea76a1d7fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.103/tierstore-0.3.103-linux-aarch64.tar.gz"
      sha256 "fe5e1cf867161c1382116c6593a55496cf39d965586f4c40cf698e1c9075993f"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.103/tierstore-0.3.103-linux-x86_64.tar.gz"
      sha256 "339849a2548c994dd1a42ac0ca17a73ec21fb5cde5a6bbd1fa19ba54966b6b99"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
