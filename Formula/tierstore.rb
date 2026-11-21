class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.159/tierstore-0.3.159-macos-arm64.tar.gz"
      sha256 "e672dd706159f9308c738df6284f2cd306bb77777ab602b4551a94597e73cfeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.159/tierstore-0.3.159-linux-aarch64.tar.gz"
      sha256 "d4c7a4c42691a0149c40fd062cff6e0f01d15c8df058f85c55ba54d630612341"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.159/tierstore-0.3.159-linux-x86_64.tar.gz"
      sha256 "c5916d8030bdf09b251f294dbc77a569fff52e93197df44ba5e28871088e8932"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
