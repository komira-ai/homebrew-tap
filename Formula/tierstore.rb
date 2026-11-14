class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.105/tierstore-0.3.105-macos-arm64.tar.gz"
      sha256 "c320f352bf4367fa08f0eba87380ed6bc0359991de5cec7763b384aa1ebe56dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.105/tierstore-0.3.105-linux-aarch64.tar.gz"
      sha256 "a46ed0c0702a4c03d1893ecfc31604603f391d5325c9d3a54d5843fd220efbed"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.105/tierstore-0.3.105-linux-x86_64.tar.gz"
      sha256 "14010a589dcfb3ae5d1c8ac308fc592c2d71b3f31189c61127ec8a086983dddd"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
