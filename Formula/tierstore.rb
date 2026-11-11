class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.93/tierstore-0.3.93-macos-arm64.tar.gz"
      sha256 "26775c0825672df358e42a262d718d9fa5dc28a8d6d463bb8b6202b59ae18640"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.93/tierstore-0.3.93-linux-aarch64.tar.gz"
      sha256 "b21a641ec12fea85d2882af8002d4992b2fba165adf43fbb21e5d373eb94969a"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.93/tierstore-0.3.93-linux-x86_64.tar.gz"
      sha256 "5f6dbc3ec9102a8739ed47aa0f2cde2813cda5772d2406ca05ebd50c1a721238"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
