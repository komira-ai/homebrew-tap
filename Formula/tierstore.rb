class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.164/tierstore-0.3.164-macos-arm64.tar.gz"
      sha256 "4ec6ffb0d1e3def954d785f33c8c06ab5a0851670c1d98605195b30fc2115a14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.164/tierstore-0.3.164-linux-aarch64.tar.gz"
      sha256 "83d731bb06266ec50e9fe281b540313bd9436eb040a62e8e85bbe6b53cc861bb"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.164/tierstore-0.3.164-linux-x86_64.tar.gz"
      sha256 "653c188595680f4cc36e2833c1f8ccf043652533b6384ee521050afb5f573c32"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
