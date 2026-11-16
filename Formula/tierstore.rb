class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.112/tierstore-0.3.112-macos-arm64.tar.gz"
      sha256 "cb296fc5462da503f4c6eec52fb7f5d43cef75a906aa90d4ae17b4d5ae74f948"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.112/tierstore-0.3.112-linux-aarch64.tar.gz"
      sha256 "ed7cadbe7b15cab7fb4b51c2e622ca7d676640fec41b875b7f97115810532e36"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.112/tierstore-0.3.112-linux-x86_64.tar.gz"
      sha256 "f8b0592280828a24e6d7d3db9c94dcb8cc7b024b1ac7b779181838117351ff5b"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
