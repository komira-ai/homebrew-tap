class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.170/tierstore-0.3.170-macos-arm64.tar.gz"
      sha256 "acb01943262a6eb1e6d84fa1691fa7adf9c988ee3fd27fb66671655d4ae504cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.170/tierstore-0.3.170-linux-aarch64.tar.gz"
      sha256 "083704c6471a21c46457fb248060f52d4f91cb0d3be50342aab1542e1f7894c2"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.170/tierstore-0.3.170-linux-x86_64.tar.gz"
      sha256 "eedd0128a3fed16e342daed3f5b52863c5bc6da1635bdaadb0e40ba3e261d6e5"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
