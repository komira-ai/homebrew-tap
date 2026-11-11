class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.91/tierstore-0.3.91-macos-arm64.tar.gz"
      sha256 "be7a020b927d1db117f79e7efb110bf481217686f655ebb84cf9b148829ba407"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.91/tierstore-0.3.91-linux-aarch64.tar.gz"
      sha256 "9cd052e8c70f3e43312305626cfd56ae55cd57d1686008d5e0819d7d275c08dc"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.91/tierstore-0.3.91-linux-x86_64.tar.gz"
      sha256 "7b0b26a32c30dbcdf49dfc5ccc2f3c2111c86b5d52683f84b5f8b845cce996d1"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
