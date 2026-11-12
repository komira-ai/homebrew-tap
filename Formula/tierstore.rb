class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.101/tierstore-0.3.101-macos-arm64.tar.gz"
      sha256 "ab64c30ff44a7a507aa83dd65226f7224e6e83170ee7b67dd51b4d0ac13adbb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.101/tierstore-0.3.101-linux-aarch64.tar.gz"
      sha256 "5913f96d6e2f6442916d554ad7869d8775daaae254cc5d65451b855f5a3b6fd4"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.101/tierstore-0.3.101-linux-x86_64.tar.gz"
      sha256 "584c293ccad46b6ed2666991315c8d36afa67fb106ce3ab50c08d921a74cbacd"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
