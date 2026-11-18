class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.129/tierstore-0.3.129-macos-arm64.tar.gz"
      sha256 "64364639d37b64f0bf052fe2a9810b1427fa3e2fb4fb2667afcac0280b77c480"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.129/tierstore-0.3.129-linux-aarch64.tar.gz"
      sha256 "2ac73582c98da47ab27d433ee111db6b8346fdab08cec589bb2f6b95d10ef5d3"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.129/tierstore-0.3.129-linux-x86_64.tar.gz"
      sha256 "894ec75a7fe27b9cc88c09ce9f8372c4b7bfcb8c44229893a964c77f5c84b471"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
