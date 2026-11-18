class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.131/tierstore-0.3.131-macos-arm64.tar.gz"
      sha256 "817006d3244c006c7345afe6e76d4098c11f44d9aae197ca50f9c1f5eb99566b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.131/tierstore-0.3.131-linux-aarch64.tar.gz"
      sha256 "bc81617dc6325c1900aa1fab309940b537c0549f579e7df1d5a0a9bf3aba4b58"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.131/tierstore-0.3.131-linux-x86_64.tar.gz"
      sha256 "2b93f4dc7cd99cd74abfa8719b9e9cb83bbb1d796eb472f593e15919d016b9a9"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
