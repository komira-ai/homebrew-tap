class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.136/tierstore-0.3.136-macos-arm64.tar.gz"
      sha256 "af77860159c1ae89dcb0a62965846d8b0c3c6327ebafcb538b98851f251df650"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.136/tierstore-0.3.136-linux-aarch64.tar.gz"
      sha256 "3920487b259024063011c0f805391d3fca4a3786df1cf392a8c4a2c0d4ad1a9b"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.136/tierstore-0.3.136-linux-x86_64.tar.gz"
      sha256 "fe0a165a30f79cb28706a8f481807d2537e590d957162cdaa6fcabaa325fd016"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
